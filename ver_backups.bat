@echo off
chcp 65001 >nul
echo ========================================
echo      BACKUPS DISPONIBLES
echo ========================================
echo.
echo Ubicacion: C:\Users\peper\canales-pepe\backups\
echo.

cd /d "C:\Users\peper\canales-pepe"

if not exist "backups" (
    echo No hay carpeta de backups.
    pause
    exit /b
)

echo Lista de backups (mas reciente primero):
echo ----------------------------------------
dir backups\*.m3u /b /o-d
echo.

echo Total de backups:
dir backups\*.m3u /b | find /c ".m3u"
echo.

echo Ultimo backup creado:
for /f "delims=" %%i in ('dir backups\*.m3u /b /o-d 2^>nul') do (
    echo   Nombre: %%i
    for %%F in ("backups\%%i") do (
        echo   Fecha: %%~tF
        echo   Tamano: %%~zF bytes
    )
    goto :fin
)
echo No hay backups.

:fin
echo.
pause