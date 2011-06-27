function browser_navigate($browser, $url)
{
    if ($url -eq '')
    {
        Write-Host "ERROR: Empty navigation url " -backgroundcolor red;
        return $false;
    }
    $browser.navigate($url);
    return $true;
} 

function browser_set_value($browser, $target, $value)
{
    if ($target -eq '')
    {
        Write-Host "ERROR: Empty target url " -backgroundcolor red;
        return $false;
    }
    $browser.Document.getElementById($target).value = $value;
    return $true;
} 

function browser_click($browser, $target)
{
    if ($target -eq '')
    {
        Write-Host "ERROR: Empty target " -backgroundcolor red;
        return $false;
    }
    $browser.Document.getElementById($target).Click();
    return $true;
}

function browser_checked($browser, $target, $value)
{
    if ($target -eq '')
    {
        Write-Host "ERROR: Empty target url " -backgroundcolor red;
        return $false;
    }
    $browser.Document.getElementById($target).checked  = $true;
    return $true;
}
 

function create_ie
{
    $ie = New-Object -com internetexplorer.application;
    $ie.visible = $true;
    return $ie
}


function w8_for_ie ($browser)
{
	while ($browser.Busy -eq $true) { Start-Sleep -Milliseconds 500 }
}


$step_file =  Import-Csv -Delimiter "`t" -Path $args[0];
$browser = create_ie;
$line_num = 0;

foreach ($line in $step_file)
{   
    $line_num++;
    w8_for_ie $browser
    Write-Host "EXECUTING: " $line_num $line.operation $line.target	$line.value	$line.wait_before -nonewline;
    Start-Sleep -Milliseconds $line.wait_before;
    $retval = $false
    switch ($line.operation) 
    { 
        'navigate' 
        {
            $retval = browser_navigate $browser $line.value 
        } 
        'value' 
        {
            $retval = browser_set_value $browser $line.target $line.value 
        } 
        'click' 
        {
            $retval = browser_click $browser $line.target 
        } 
        'checked'
        {
            $retval = browser_checked $browser $line.target $line.value
        }
        'close' 
        {
            $browser.Quit();
            Write-Host "FINISHED" -foregroundcolor black -backgroundcolor yellow;           
        } 
        default {Write-Host " ERROR:Unknown operation " -backgroundcolor red -nonewline}
    }
    if ($retval) {Write-Host " OK" -foregroundcolor black -backgroundcolor green}

}