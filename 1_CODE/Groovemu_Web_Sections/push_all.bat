@echo off
cd /d "W:\1 SLAPASSOUND\001_JUCE_plugins\GROOVEMU website"

git add -A
git commit -m "auto quick push"
if errorlevel 1 (
  echo.
  echo Commit ebaonnestus voi muudatusi polnud. Pushi ei tehta.
  pause
  exit /b 1
)

git push origin main
pause
