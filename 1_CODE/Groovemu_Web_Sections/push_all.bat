@echo off
cd /d "W:\1 SLAPASSOUND\001_JUCE_plugins\GROOVEMU website"

for /f %%I in ('powershell -NoProfile -Command "(Get-Date).ToString('yyyyMMdd_HHmmss')"') do set "CACHE_BUST=%%I"
echo Uuendan sektsioonifailide meedialinkide cache-bust vaartust: %CACHE_BUST%
powershell -NoProfile -Command "$cache='%CACHE_BUST%'; Get-ChildItem '1_CODE/Groovemu_Web_Sections' -Filter '*.txt' | ForEach-Object { $p=$_.FullName; $c=[System.IO.File]::ReadAllText($p); $u=[regex]::Replace($c,'(https://d1yei2z3i6k35z\.cloudfront\.net/[^\"''\s\?]+)(\?v=[^\"''\s]+)?',('$1?v=' + $cache)); if($u -ne $c){ [System.IO.File]::WriteAllText($p,$u,[System.Text.UTF8Encoding]::new($false)) } }"

git add "1_CODE/Groovemu_Web_Sections"
git commit -m "auto quick push"
if errorlevel 1 (
  echo.
  echo Commit ebaonnestus voi muudatusi polnud. Pushi ei tehta.
  pause
  exit /b 1
)

git push origin main
pause
