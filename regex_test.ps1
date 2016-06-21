[xml]$oval =  Get-Content -Path C:\Users\olao\Documents\Benchmark\CIS_Microsoft_Windows_7_Benchmark_v2.1.0-oval.xml
[xml]$xccdf =  Get-Content -Path C:\Users\olao\Documents\Benchmark\CIS_Microsoft_Windows_7_Benchmark_v2.1.0-xccdf.xml


#Registry Objects from "CIS_Microsoft_Windows_7_Benchmark_v2.1.0-oval.xml"
$def_objects = $oval.oval_definitions.objects
$registry_objects = $def_objects.registry_object

#$Benchmark Objects from "CIS_Microsoft_Windows_7_Benchmark_v2.1.0-xccdf.xml"
$xccdf_benchmark = $xccdf.Benchmark
$benchmark_value = $xccdf.Benchmark.Value


$id = ($benchmark_value | ForEach-Object{$_.id})
$comment = ($registry_objects | ForEach-Object{$_.comment})

$comment > .\Desktop\comment.txt
$id  > .\Desktop\id.txt


$regex_test = [regex] "\d{1,3}.+\d{1,3}.{0}."


<#REGEX MATCH { id:value_1.1.1.5.1.2_ -> comment:rule_1.1.1.5.1_}
1.2.1.3.1.1.3.7
Extract the Benchmark Items
#>

foreach($item in $comment)
{
    $test = @($($regex_test.Matches($item)) | %{ $_.value})
    foreach($x in $test)
    {
        $x = $x -replace '_[^/]*$',''
        $x
    }       
}

