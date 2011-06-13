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
    "When converting from JSON with child"
    $json = "{ ""foo"": ""bar"", ""child"":{""coo"":""roo""} }"    
    $result = convertfrom-json $json    
    $result.child.coo | should be_equal "roo"
}

test-spec {
    "When converting to JSON"
    $data = @{"foo" = "bar"}
    $result = convertto-json $data    
    $result | should be_equal "{""foo"":""bar""}"
}

test-spec {
    "When converting to JSON with child objects"    
    $data = @{"foo" = "bar"; "child" = @{"coo" = "roo" }}
    $result = convertto-json $data    
    $result | should be_equal "{""foo"":""bar"",""child"":{""coo"":""roo""}}"
}