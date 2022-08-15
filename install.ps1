# auto ez reinstall script by dippio / hitorigoto
# v0.1

# my brain goes schizo mode and randomly wipes my windows installs sometimes
# so i'm making this just so i don't have to spend 2 hours remembering
# and reinstalling all the stuff i normally use lol

#definitions
#creates a new tab for windows updates as superuser
function New-Tab
{
    sudo start powershell {.\update.ps1}
}

#installs chocolatey pkgmgr (i hate winget)
function Install-Choco 
{
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

#installs scoop (i'm braindead and use sudo a lot and i only know how to get sudo via scoop)
function Install-Scoop 
{
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    irm get.scoop.sh | iex
}

#trust me it is vital to install neofetch
function Install-ScoopPrograms 
{
    scoop bucket add main
    scoop install sudo, neofetch, lynx
}

#these are the programs i generally use the most on a new pc, i normally can just go from this point onward from memory, add / remove anything to ur hearts content though
function Install-ChocoPrograms 
{
    sudo choco install brave-nightly --pre, paint.net, python3, vscode, audacity, obs, git, curl, libreoffice, qbittorrent, spotify, spicetify-cli, vlc, winscp, discord, betterdiscord, vcredist2015, vcredist2017, directx, dotnet4 -y
}

function Update-Packages
{
    sudo scoop update --all
    sudo choco upgrade all -y
}


Write-Host " Currently installing Chocolatey..."
Install-Choco
Write-Host "Chocolatey successfully installed."
Write-Host "Attempting to install scoop..."
Write-Host "Scoop successfully installed."
Write-Host "Attempting to download sudo and neofetch via scoop..."
Install-ScoopPrograms
Write-Host "Scoop programs installed successfully."
Write-Host "Opening a new tab for windows updates..."
New-Tab
Write-Host "Attempting to download main programs via choco."
Install-ChocoPrograms
Write-Host "All packages downloaded. Attemtping to update just incase."
Update-Packages
Write-Host "Everything has been completed."