##
##    PowerShell module to output hello worlds!
##

#requires -Version 2.0
function ConvertFrom-JSON {
[CmdletBinding()]
Param(
    [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true, Mandatory=$true, Position=0)]    
    $JSON
)
	Add-Type -Path .\Newtonsoft.Json.Net35.dll
	[JsonParser.JsonParser]::FromJson($json)
<#
.Synopsis
    [TBD]
	
.Example
    [TBD]

#>
}