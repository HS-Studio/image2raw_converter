@echo off
set INPUT_DIR=.
set OUTPUT_DIR=output_frames

REM Ordner für RAW-Dateien erstellen
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

for %%f in ("%INPUT_DIR%\*.bmp") do (
    echo Konvertiere %%~nxf ...
    python bmp_to_raw_rgb.py "%%f" "%OUTPUT_DIR%\%%~nf.raw"
)

echo.
echo Alle Bileder konvertiert!
pause
