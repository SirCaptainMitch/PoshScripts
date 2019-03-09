$InstallDir = 'c:\source\'
$FileName = 'Ubuntu.appx'
$zipName = 'Ubuntu.zip'
$uri = 'https://aka.ms/wsl-ubuntu-1604'

$expandPath = Join-Path $InstallDir 'Ubuntu'
$path = Join-Path $InstallDir $FileName 
$zipPath = join($InstallDir, $zipName)

Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -$path  -UseBasicParsing

Rename-Item $path $zipPath
Expand-Archive $zipPath $expandPath 

$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + $expandPath, "User")

