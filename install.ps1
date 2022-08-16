# auto ez reinstall script by dippio / hitorigoto
# v0.1

# my brain goes schizo mode and randomly wipes my windows installs sometimes
# so i'm making this just so i don't have to spend 2 hours remembering
# and reinstalling all the stuff i normally use lol


#definitions
#creates a new tab for windows updates as superuser
function New-Tab
{
    start powershell {.\update.ps1}
}

#installs chocolatey package manager
function Install-Choco
{
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}


#these are the programs i generally use the most on a new pc, i normally can just go from this point onward from memory, add / remove anything to ur hearts content though
function Install-ChocoPrograms 
{
    choco install sudo, winfetch, brave-nightly --pre, paint.net, python3, vscode, audacity, obs, git, curl, libreoffice, qbittorrent, spotify, spicetify-cli, vlc, winscp, discord, betterdiscord, steam, vcredist2015, vcredist2017, directx -y
}

function Update-Packages
{
    choco upgrade all -y
}

Write-Host "Attemtping to install Chocolatey..."
Install-Choco
Write-Host "Chocolatey successfully installed."
Write-Host "Opening a new tab for windows updates..."
New-Tab
Write-Host "Attempting to download main programs via choco."
Install-ChocoPrograms
Write-Host "All packages downloaded. Attemtping to update just incase."
Update-Packages
Write-Host "Everything has been completed."