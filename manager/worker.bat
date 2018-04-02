@REM  it3xl.com

@REM Install Visual Studio 2017 on low bandwidth or unreliable network environments
@REM https://docs.microsoft.com/en-us/visualstudio/install/install-vs-inconsistent-quality-network

IF NOT EXIST "%invokePath%\packages\vs_setup.exe" (
  ECHO. & ECHO First run the file "create-update offline packages.bat".
  ECHO It will download 34+GB of packages of VS 2017 within hours
  ECHO You must have unrestricted internet connection in place of running.
  EXIT /B 101
)


SET certmgr="%invokePath%\certmgr\certmgr.exe"

SET cert_path=%invokePath%\packages\certificates
@REM From "Option 3 - Install certificates as part of a scripted deployment of Visual Studio"
@REM https://docs.microsoft.com/en-us/visualstudio/install/install-certificates-for-visual-studio-offline
%certmgr% -add -c "%cert_path%\manifestSignCertificates.p12" -n "Microsoft Code Signing PCA 2011" -s -r LocalMachine CA
IF %ERRORLEVEL% NEQ 0 ( ECHO EXIT - Fix certificate error for "Microsoft Code Signing PCA 2011" & EXIT /B 103 )
%certmgr% -add -c "%cert_path%\manifestSignCertificates.p12" -n "Microsoft Root Certificate Authority" -s -r LocalMachine root
IF %ERRORLEVEL% NEQ 0 ( ECHO EXIT - Fix certificate error for "Microsoft Root Certificate Authority" & EXIT /B 103 )
%certmgr% -add -c "%cert_path%\manifestCounterSignCertificates.p12" -n "Microsoft Time-Stamp PCA 2010" -s -r LocalMachine CA
IF %ERRORLEVEL% NEQ 0 ( ECHO EXIT - Fix certificate error for "Microsoft Time-Stamp PCA 2010" & EXIT /B 103 )
%certmgr% -add -c "%cert_path%\manifestCounterSignCertificates.p12" -n "Microsoft Root Certificate Authority" -s -r LocalMachine root
IF %ERRORLEVEL% NEQ 0 ( ECHO EXIT - Fix certificate error for "Microsoft Root Certificate Authority" & EXIT /B 103 )
%certmgr% -add -c "%cert_path%\vs_installer_opc.SignCertificates.p12" -n "Microsoft Code Signing PCA" -s -r LocalMachine CA
IF %ERRORLEVEL% NEQ 0 ( ECHO EXIT - Fix certificate error for "Microsoft Code Signing PCA" & EXIT /B 103 )
%certmgr% -add -c "%cert_path%\vs_installer_opc.SignCertificates.p12" -n "Microsoft Root Certificate Authority" -s -r LocalMachine root
IF %ERRORLEVEL% NEQ 0 ( ECHO EXIT - Fix certificate error for "Microsoft Root Certificate Authority" & EXIT /B 103 )


ECHO. & ECHO Start Visula Studio installer. & ECHO.
START  "\packages\vs_setup.exe"  "%invokePath%\packages\vs_setup.exe"




