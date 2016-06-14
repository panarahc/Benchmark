[xml]$xccdf =  Get-Content -Path C:\Users\olao\Documents\Benchmark\CIS_Microsoft_Windows_7_Benchmark_v2.1.0-xccdf.xml
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

<#$regex_id =  [regex] "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){4}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
$regex_comment =  [regex] "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){5}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
#>

$regex_id =  [regex] "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3.\d{1,3}"
$regex_comment =  [regex] ".\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}"

#REGEX MATCH { id:value_1.1.1.5.1.2_ -> comment:rule_1.1.1.5.1_}

foreach($line in $id)
{
    $line
    $regex_id.Matches($line) | %{ $_.value}
}

#1.2.1.3.1.1.3.7
foreach($item in $comment)
{
    $item
    $regex_comment.Matches($item) | %{ $_.value}
}
    
       
    
    
