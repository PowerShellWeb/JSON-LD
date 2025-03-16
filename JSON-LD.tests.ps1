describe 'JSON-LD' {
    context 'JSON-LD is a standard for embedding information in web pages' {
        it 'can get information about a movie' {            
            $result = Get-JsonLD -Url 'https://www.imdb.com/title/tt0211915/'
            $result.pstypenames | Should -Not -BeNullOrEmpty
            $result.pstypenames | Should -Contain 'https://schema.org/Movie'
            
        }
        it 'can get information a schema' {
            Get-JsonLD https://schema.org/Movie | 
                Select-Object -ExpandProperty pstypenames -Unique | 
                Should -Contain 'rdf:Property'            
        }         
    }
}
