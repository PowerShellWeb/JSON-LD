# JSON-LD

Get JSON Linked Data with PowerShell

Gets information stored in a page's [json-ld](https://json-ld.org/) (json linked data)

Many pages expose this information for search engine optimization.  

## JSON-LD in PowerShell

JSON-LD is one of a number of ways you can get more information about a page.

This information can be useful in any number of fun and useful PowerShell scenarios

For example, let's get information about a movie.

~~~PowerShell
Get-JsonLD https://www.imdb.com/title/tt0211915/
~~~

Let's take things a step further, and get the information we can know about any movie:

~~~PowerShell
JsonLD https://schema.org/Movie
~~~
 