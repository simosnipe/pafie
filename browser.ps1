function browser_navigate($browser, $url){
    if ($url -eq '')
    {
        Write-Host "ERROR: Empty navigation url " -backgroundcolor red;
        return $false;
    }
    $browser.navigate($url);
    return $true;
} 

function browser_set_value($browser, $target, $value){
    if ($target -eq ''){
        Write-Host "ERROR: Empty target url " -backgroundcolor red;
        return $false;
    }
    $browser.Document.getElementById($target).value = $value;
    return $true;
} 

function browser_click($browser, $target){
    if ($target -eq ''){
        Write-Host "ERROR: Empty target " -backgroundcolor red;
        return $false;
    }
    $browser.Document.getElementById($target).Click();
    return $true;
}

function browser_checked($browser, $target, $value){
    if ($target -eq ''){
        Write-Host "ERROR: Empty target url " -backgroundcolor red;
        return $false;
    }
    $browser.Document.getElementById($target).checked  = $true;
    return $true;
}

function browser_get_url($browser){
    return $browser.Document.url;
} 

function browser_get_value($browser, $target){
    if ($target -eq ''){
        Write-Host "ERROR: Empty target" -backgroundcolor red;
        return $false;
    }
    return $browser.Document.getElementById($target).value;
} 

function browser_get_checked($browser, $target){
    if ($target -eq ''){
        Write-Host "ERROR: Empty target url " -backgroundcolor red;
        return $false;
    }
    return $browser.Document.getElementById($target).checked;
}

function create_ie{
    $ie = New-Object -com internetexplorer.application;
    $ie.visible = $true;
    return $ie
}

function w8_for_browser ($browser){
	while ($browser.Busy -eq $true) { Start-Sleep -Milliseconds 500 }
}

