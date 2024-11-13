@echo off
setlocal


:: Define variables locally and set in separate script for added security, or in .bashrc 
echo KPSCRIPT_PATH=%KPSCRIPT_PATH%
echo DATABASE_PATH=%DATABASE_PATH%
echo ENTRY_TITLE=%ENTRY_TITLE%
echo ENTRY_USERNAME=%ENTRY_USERNAME%
echo ENTRY_URL=%ENTRY_URL%
echo PASSWORD_LENGTH=%PASSWORD_LENGTH%

:: Generate a password
for /f "tokens=* delims=" %%i in ('%KPSCRIPT_PATH% -c:GeneratePassword -Length:%PASSWORD_LENGTH%') do set GENERATED_PASSWORD=%%i

:: Add the generated password to KeePass
%KPSCRIPT_PATH% -c:AddEntry -pw:%MASTER_PASSWORD% -in:%DATABASE_PATH% -Title:%ENTRY_TITLE% -UserName:%ENTRY_USERNAME% -Password:%GENERATED_PASSWORD% -URL:%ENTRY_URL%

:: Optionally, upload the KeePass database to a remote server (example using SCP)
:: set REMOTE_SERVER="user@remote.server:/path/to/backup/"
:: scp %DATABASE_PATH% %REMOTE_SERVER%

endlocal
