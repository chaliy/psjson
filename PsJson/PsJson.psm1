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
	Add-Type -Path $PSScriptRoot\JsonParser.Net35.dll
	[JsonParser.JsonParser]::FromJson($JSON)
<#
.Synopsis
    [TBD]
	
.Example
    [TBD]

#>
}
function ConvertTo-JSON {
[CmdletBinding()]
Param(
    [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true, Mandatory=$true, Position=0)]    
    $Data
)
	Add-Type -Path $PSScriptRoot\JsonParser.Net35.dll    
        
    function ToDictionary($inp){
    
        #$outp = new-object "System.Collections.Generic.Dictionary``2[[System.String, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.String, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]"
        $outp = new-object "System.Collections.Generic.Dictionary``2[[System.String],[System.Object]]"
    
        foreach($key in $inp.Keys){
            $item = $inp[$key]
            if ($item -is [Collections.Hashtable]){
                $item = ToDictionary($item)
            }
            $outp.Add($key, $item)		
    	}
        
        $outp
    }
    
    $DataToConvert = ToDictionary($Data)    
	[JsonParser.JsonParser]::ToJson($DataToConvert)
<#
.Synopsis
    [TBD]
	
.Example
    [TBD]

#>
}