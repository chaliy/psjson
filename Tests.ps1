$here = (Split-Path -parent $MyInvocation.MyCommand.Definition)
set-location $here
import-module PowerSpec
import-module .\PsJson\PsJson.psm1 -Force

test-spec {
    "When converting from JSON"
    $json = "{ ""foo"": ""bar"" }"    
    $result = convertfrom-json $json    
    $result.foo | should be_equal "bar"
}

test-spec {
    "When converting to JSON"
    $data = @{"foo" = "bar"}
    $result = convertto-json $data    
    $result | should be_equal "{""foo"":""bar""}"
}