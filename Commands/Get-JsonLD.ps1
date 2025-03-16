function Get-JsonLD {
    <#
    .SYNOPSIS
        Gets JSON-LD data from a given URL.
    .DESCRIPTION
        Gets JSON Linked Data from a given URL.
        
        This is a format used by many websites to provide structured data about their content.
    .EXAMPLE
        # Want to get information about a movie?  Linked Data to the rescue!
        Get-JsonLD -Url https://www.imdb.com/title/tt0211915/
    .EXAMPLE
        # Want information about an article?  Lots of news sites use this format.
        Get-JsonLD https://www.thebulwark.com/p/mahmoud-khalil-immigration-detention-first-amendment-free-speech-rights    
    #>
    [Alias('jsonLD','json-ld')]
    param(
    # The URL that may contain JSON-LD data
    [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [Uri]
    $Url
    )

    begin {
        $linkedDataRegex = [Regex]::new(@'
(?<HTML_LinkedData>
<script                                       # Match <script tag
\s{1,}                                        # Then whitespace
type=                                         # Then the type= attribute (this regex will only match if it is first)
[\"\']                                        # Double or Single Quotes
application/ld\+json                          # The type that indicates linked data
[\"\']                                        # Double or Single Quotes
[^>]{0,}                                      # Match anything until the end of the start tag
\>                                            # Match the end of the start tag
(?<JsonContent>(?:.|\s){0,}?(?=\z|</script>)) # Anything until the end tag is JSONContent
)        
'@, 'IgnoreCase,IgnorePatternWhitespace','00:00:00.1')
    }

    process {        
        $restResponse = Invoke-RestMethod -Uri $Url
        foreach ($match in $linkedDataRegex.Matches("$restResponse")) {
            foreach ($jsonObject in 
                $match.Groups['JsonContent'].Value | 
                    ConvertFrom-Json
            ) {
                if ($jsonObject.'@type') {
                    $schemaType = $jsonObject.'@context',$jsonObject.'@type' -ne '' -join '/'
                    $jsonObject.pstypenames.insert(0, $schemaType)
                    $jsonObject
                } elseif ($jsonObject.'@graph') {
                    foreach ($graphObject in $jsonObject.'@graph') {
                        if ($graphObject.'@type') {
                            $graphObject.pstypenames.insert(0, $graphObject.'@type')
                        }
                        $graphObject
                    }                    
                } else {
                    $jsonObject
                }
                
            }
        }        
    }
}
