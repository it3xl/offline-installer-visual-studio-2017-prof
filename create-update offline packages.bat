@REM  it3xl.com

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

CD %SYSTEMDRIVE%/

@REM Source for the bootstrapper of VS
@REM https://www.visualstudio.com/vs/
START  "\web_installer\vs_professional.exe"^
  "%invokePath%\web_installer\vs_professional.exe"^
  --layout "%invokePath%\packages"^
  --lang en-US

