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

<#$regex_id =  [regex] "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){4}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
$regex_comment =  [regex] "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){5}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"


$regex_id =  [regex] "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3.\d{1,3}"
$regex_comment =  [regex] ".\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}"

#>

$regex = [regex] "_\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"

$regex5 = [regex] "_\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}"
$regex6 = [regex] "_\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}.\d{1,3}"
$regex7 = [regex] "_\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}"
$regex8 = [regex] "_\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}"

<#REGEX MATCH { id:value_1.1.1.5.1.2_ -> comment:rule_1.1.1.5.1_}
1.2.1.3.1.1.3.7
#>

foreach($item in $comment)
{
    $test = @($($regex5.Matches($item) | %{ $_.value}), $($regex6.Matches($item) | %{ $_.value}),
            $($regex7.Matches($item) | %{ $_.value}), $($regex8.Matches($item) | %{ $_.value}))
    $test
    foreach($x in $test)
    {
        $x | %{$_.Length}
    }    
        
}

<#
foreach($line in $id)
{
    $line
    $regex.Matches($line) | %{ $_.value}
}

#1.2.1.3.1.1.3.7
foreach($item in $comment)
{
    $item
    ($regex.Matches($item) | %{ $_.value})
}
#>   

    
