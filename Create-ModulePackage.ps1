Set-Variable -Name PackageName -Value "PSPasswordGen" -Option ReadOnly
Set-Variable -Name PackagePath -Value (Join-Path -Path $PSScriptRoot -ChildPath $PackageName) -Option ReadOnly
Set-Variable -Name FilesMapping -Value @{
    "$($PackageName).psm1"=$null
    "$($PackageName).psd1"=$null
    "src"=$null
} -Option ReadOnly

if(Test-Path -Path $PackagePath){
    Write-Warning -Message "Old package was removed."
    Remove-Item -Path $PackagePath -Recurse
}
New-Item -ItemType Directory -Path $PackagePath > $null

$FilesMapping.Keys | ForEach-Object -Process {
    Copy-Item -Path (Join-Path -Path $PSScriptRoot -ChildPath $_) -Destination (Join-Path -Path $PackagePath -ChildPath $(if($null -eq $FilesMapping[$_]){$_}else{$FilesMapping[$_]})) -Recurse
}

Set-Variable -Name DocumetsPath -Value (Join-Path -Path $PSScriptRoot -ChildPath "docs") -Option ReadOnly
New-ExternalHelp -Path $DocumetsPath -OutputPath $PackagePath > $null
Get-ChildItem -Path $DocumetsPath -Attributes Directory -Recurse | ForEach-Object -Process {
    New-ExternalHelp -Path $_.FullName -OutputPath $_.FullName.Replace($DocumetsPath, $PackagePath) > $null
}
Test-ModuleManifest -Path (Join-Path -Path $PackagePath -ChildPath "$($PackageName).psd1")

Write-Output "New package was created."