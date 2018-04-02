@REM  it3xl.com

@REM 
@ECHO OFF

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

CD %SYSTEMDRIVE%/

ECHO.
CALL "%invokePath%\manager\worker.bat"
ECHO. & ECHO ERRORLEVEL is %ERRORLEVEL% & ECHO.

IF %ERRORLEVEL% NEQ 0 ( PAUSE )
@REM PAUSE