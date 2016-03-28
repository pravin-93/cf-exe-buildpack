@echo off

echo "URL Access Rights:"
netsh http show urlacl 

echo "Starting the console app ..."
call "%~dp0..\run.bat"
