set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:\=/%"
C:\msys64\msys2_shell.cmd -defterm -here -mingw64 -no-start -c "%SCRIPT_DIR%setup.sh %*"