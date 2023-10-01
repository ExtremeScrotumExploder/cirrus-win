@echo off
curl --silent -O https://raw.githubusercontent.com/Barento/cirrus-win/main/ngrok.exe
timeout 2
ngrok config add-authtoken 2W8kRCPkx554otoZqYxLqZezyoX_4NDPnAdrwUx6j2yzwe8pt
timeout 2
start ngrok.exe tcp --region us 3389
tzutil /s "SE Asia Standard Time" >nul
sc start audiosrv >nul
net config server /srvcomment:"rdpempire" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
start powershell Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
start powershell Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
net user Windows2022 rdpempire1! /add
timeout 2
net localgroup administrators Windows2022 /add
curl -o "C:\Users\Windows2022\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/Barento/dangdev/main/software/FastConfigVPS_v2.3.exe > out.txt 2>&1
curl -o "C:\Users\Windows2022\Desktop\EVKey Vietnamese Keyboard.exe" https://raw.githubusercontent.com/Barento/dangdev/main/software/EVKey64.exe > out.txt 2>&1
curl -o "C:\Users\Windows2022\Desktop\Enable Session notification.vbs" https://raw.githubusercontent.com/Barento/dangdev/main/Session.vbs > out.txt 2>&1
curl -o "C:\Users\Windows2022\Desktop\swd.bat" https://raw.githubusercontent.com/Barento/dangdev/main/swd.bat > out.txt 2>&1
curl -o "C:\Users\Windows2022\Desktop\minecraft_java_ngrok.bat" https://raw.githubusercontent.com/Barento/dangdev/main/minecraft_java_ngrok.bat > out.txt 2>&1
curl -o "C:\Users\Windows2022\Desktop\minecraft_java_playit.bat" https://raw.githubusercontent.com/Barento/dangdev/main/minecraft_java_playit.bat > out.txt 2>&1
curl -o "C:\Users\Windows2022\Desktop\auto_bedrock.bat" https://raw.githubusercontent.com/Barento/dangdev/main/auto_bedrock.bat > out.txt 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant Windows2022:F >nul
ICACLS C:\Windows\installer /grant Windows2022:F >nul
ICACLS C:\Windows\Temp /grant Windows2022:F >nul
ICACLS C:\Windows\installer /grant Windows2022:F >nul
echo Completed! Please check RDP address in ngrok endpoints. https://dashboard.ngrok.com/cloud-edge/endpoints/
ping -n 99999999999999999999999999999999 10.10.10.10 >nul
