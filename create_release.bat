@echo off
REM I know this is hardcoded bullshit. At some point I'll build a Rhai script out of it :)
hemtt.exe release --no-archive --no-sign
mkdir %CD%\.hemttout\release\keys
copy P:\private_keys\cineafx.bikey %CD%\.hemttout\release\keys
for /f %%f in ('dir /b /s %CD%\.hemttout\release\addons\') do "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\DSSignFile\DSSignFile.exe" "P:\private_keys\cineafx.biprivatekey" %%f
pause
