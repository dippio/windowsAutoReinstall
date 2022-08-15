# auto ez reinstall script by dippio / hitorigoto
# v0.1

# attempts to update windows seeing as i normally intend on using this after factory resets

Write-Host "attempting to install windows updater..."
Install-Module PSWindowsUpdate -Force | ECHO Y
Write-Host "updater installed"
Write-Host "attemtping to update windows..."
Get-WindowsUpdate
Install-WindowsUpdate | ECHO A
