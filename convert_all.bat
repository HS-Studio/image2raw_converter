@echo off
set INPUT_DIR=.
set OUTPUT_DIR=output

REM Change ENDIAN to big or little
set ENDIAN=little

echo byteorder: %ENDIAN%
echo.

REM Ordner für RAW-Dateien erstellen
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

for %%f in ("%INPUT_DIR%\*.bmp", "%INPUT_DIR%\*.jpg", "%INPUT_DIR%\*.jpeg", "%INPUT_DIR%\*.png") do (
    echo Konvertiere %%~nxf ...
    python bmp_to_raw_rgb.py "%%f" "%OUTPUT_DIR%\%%~nf.raw" "%ENDIAN%"
)

echo.
echo Alle Bileder konvertiert!
pause
