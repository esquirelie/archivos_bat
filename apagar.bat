@echo off

rem subir directorio hasta C
cd C:\

rem terminar programas con estatus no responda
taskkill.exe /f /fi "status eq Not Responding"

rem limpiar los dns
ipconfig /flushdns

ipconfig /renew *
netsh int ip set dns

netsh winsock reset

ipconfig /release *

rem borrar temporales
del *.tmp /s /f


rem ARCHIVOS TEMPORALES DE INTERNET
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
rem COOKIES 
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2 
rem HISTORIAL
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1 
rem FORMULARIOS 
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16

REM reiniciado shutdown /r

rem apagado 
shutdown /s