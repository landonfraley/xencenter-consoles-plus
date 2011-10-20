@echo off
set RESGEN="C:\Program Files\Microsoft SDKs\Windows\v7.0A\bin\ResGen.exe"
set AL="C:\Program Files\Microsoft SDKs\Windows\v7.0A\bin\al.exe"
set PROJECTNAME=xencenter-consoles-plus
REM set DROPBOX="C:\Users\landonf\Dropbox\Projects"

echo Creating %PROJECTNAME%.resources
%RESGEN% %PROJECTNAME%.resx
echo Creating %PROJECTNAME%.resources.dll
%AL% /t:lib /embed:%PROJECTNAME%.resources /culture:0x007F /out:%PROJECTNAME%.resources.dll
pause

REM echo Copying files from dev to production..
REM copy %PROJECTNAME%.resources.dll %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM copy %PROJECTNAME%.xcplugin.xml %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM copy %PROJECTNAME%.css %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM copy %PROJECTNAME%.js %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM copy %PROJECTNAME%.html %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM copy configBX.html %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM copy configBX.js %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM copy jquery-1.3.2.js %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM copy jquery.rpc.js %DROPBOX%\xcplugins\landonf.com\%PROJECTNAME% /Y
REM pause

REM echo Updating XenCenter
REM cd %CWD%
REM xcopy landonf.com "C:\Program Files\Citrix\XenCenter\Plugins" /Y
REM pause

REM cd ..\..\xcplugins
REM PowerShell .\Create_PluginInstaller.ps1 -wix "C:\\Wix20" -plugins "C:\\Users\\landonf\\Dropbox\\Projects\xcplugins" -out BetterXenCenter.msi -title "Better XenCenter Plugin" -description "Helpful XenCenter Plugins" -manufacturer "landonf.com" -upgrade_code $([System.Guid]::NewGuid().ToString())
REM pause

REM copy %PROJECTNAME%.resources.dll "C:\Program Files\Citrix\XenCenter\Plugins\landonf.com\%PROJECTNAME%" /Y
REM copy %PROJECTNAME%.xcplugin.xml "C:\Program Files\Citrix\XenCenter\Plugins\landonf.com\%PROJECTNAME%" /Y
REM pause