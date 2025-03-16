@{
    RootModule = 'JSON-LD.psm1'
    ModuleVersion = '0.0.1'
    GUID = '4e65477c-012c-4077-87c7-3e07964636ce'
    Author = 'JamesBrundage'
    CompanyName = 'Start-Automating'
    Copyright = '(c) 2025 Start-Automating.'
    Description = 'Get JSON Linked Data with PowerShell'
    FunctionsToExport = 'Get-JsonLD'
    AliasesToExport = 'jsonLD', 'json-ld'    
    PrivateData = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @('json-ld','SEO','Web','PowerShellWeb')
            # A URL to the license for this module.
            ProjectURI = 'https://github.com/PowerShellWeb/JSON-LD'
            LicenseURI = 'https://github.com/PowerShellWeb/JSON-LD/blob/main/LICENSE'
            ReleaseNotes = @'

> Like It? [Star It](https://github.com/PowerShellWeb/JSON-LD)
> Love It? [Support It](https://github.com/sponsors/StartAutomating)

Get Linked Data from any page

## JSON-LD 0.0.1

* Initial Release of JSON-LD Module (#1)
  * `Get-JsonLD` gets linked data (#2)
  * `Get-JsonLD` is aliased to `jsonLD` and `json-ld`
'@
        }
    }
    
}

