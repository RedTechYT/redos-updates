@echo off
setlocal
cd /d "%~dp0"

set "JAVA_BIN=C:\Program Files\Java\jdk-21.0.10\bin"
if exist "%JAVA_BIN%\java.exe" goto run
if defined JAVA_HOME set "JAVA_BIN=%JAVA_HOME%\bin"

:run
if not exist "%JAVA_BIN%\java.exe" (
  echo Java runtime not found. Install JDK 21 or update Run-RedOs.cmd.
  pause
  exit /b 1
)

echo Starting RedOS...
"%JAVA_BIN%\java.exe" --module-path "..\javafx-sdk-21.0.2\lib" --add-modules javafx.controls,javafx.graphics -jar RedOs-1.0.0.jar
if errorlevel 1 (
  pause
)
