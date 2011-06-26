function browser_navigate($browser, $url)
{
    if ($target -eq '')
    {
        "ERROR: Empty navigation url ";
        return false;
    }
    $browser.navigate($url);
    return true;
} 

$step_file =  Import-Csv -Delimiter "`t" -Path $args[0];
$line_num = 0;

foreach ($line in $step_file)
{   
    $line_num++;
    echo $line_num $line.operation;
}

#    $ie = New-Object -com internetexplorer.application;
#    $ie.visible = $true;
#
#    switch ($operation) 
#    { 
#        'navigate' 
#        {
#            browser_navigate $ie 
#        } 
#        2 {"The color is blue."} 
#        3 {"The color is green."} 
#        4 {"The color is yellow."} 
#        5 {"The color is orange."} 
#        6 {"The color is purple."} 
#        7 {"The color is pink."}
#        8 {"The color is brown."} 
#        default {"Unknown operation"}
#    }