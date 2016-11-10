@echo off

set build_dir=%1
:: output valid yaml containing the start command

echo ---
echo default_process_type:
echo   web: runner\start.bat

exit /b 0
