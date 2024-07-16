@echo off

start /max chrome "http://www.google.com"
start /max chrome "https://wutheringwaves.kurogames.com/"
start /max chrome "https://www.instagram.com/"
start /max chrome "https://lbiennylrewind.wixsite.com/cc1j"
start /max chrome "https://streetcat.wiki/index.php/Mr._Fresh"

start calc

start notepad

rem /t [seconds] [/nobreak]
echo Notice! The system will shutdown in 120 minutes
timeout /t 120

shutdown

