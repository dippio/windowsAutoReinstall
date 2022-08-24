# windowsAutoReinstall
## Automatically redownloads some packages and updates windows


i prefer linux over windows, i just gotta reinstall it for school sometimes

this makes it slightly less nightmareish to get everything set up

## what it does
does a bunch of stuff
<details>
  <summary>(what it actually does)</summary>
    - installs chocolatey
    - updates windows (and drivers / firmware if supported)
    - installs some cli utilities (curl, git, sudo, winfetch)
    - installs python 3.6.7 and pandas, pillow, numpy, matplotlib and pygame
    - installs some general programs (spotify, obs, libreoffice, audacity, etc)
</details>

## how to use
run:
'Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force; ls -Recurse *.ps*1 | Unblock-File; .\install.ps1' 
in an admin powershell environment

accept any admin requests that pop up
