@echo off
title YH Repository 1.1
mode con cols=50 lines=20
for /f "tokens=6 delims=[]. " %%G in ('ver') do set winbuild=%%G
if %winbuild% LSS 2600 goto ER1
if not exist "%systemdrive%\RepoTEMP%" goto LIC
set LIST=
:AD
color 0f
echo =================================================
echo YH Repository 
echo =================================================
echo.
echo.
echo ������ ���� Ȯ�� �� . . .
echo.               
echo.	          
echo.       
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping -n 2 localhost >nul
bcdedit >nul
if %errorlevel% EQU 1 goto :nadmin
:A2
cls
echo =================================================
echo YH Repository 
echo =================================================
echo.
echo.
echo ������ ���� Ȯ�� [�Ϸ�]
echo.               
echo.	          
echo ���� Ȯ�� �� . . .       
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping -n 1 localhost >nul
if not exist "%systemdrive%\RepoTEMP\bin\wget.exe" goto DWLD_F
if not exist "%systemdrive%\RepoTEMP\settings.ini" goto DWLD_F
:FL
cls
echo =================================================
echo YH Repository 
echo =================================================
echo.
echo.
echo ������ ���� Ȯ�� [�Ϸ�!]
echo.               
echo.	          
echo ���� Ȯ�� �� [�Ϸ�!]       
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping -n 1 localhost >nul
goto DWLD


:LIC
cls
mode con cols=120 lines=9000
cd %systemdrive%\RepoTEMP
if not exist "%systemdrive%\RepoTEMP\license.txt" goto DWLD_F
echo =================================================
echo YH Repository - License
echo =================================================
echo.
type license.txt
echo ����Ϸ��� �ƹ�Ű�� ��������.
pause>nul
goto AD

:ER1
cls
echo =================================================
echo YH Repository - ERROR
echo =================================================
echo.
echo ERROR 
echo.               
echo ���� �ü���� ������ ����������� �����ϴ�...	          
echo.      
echo ���� ���� : WINDOWS 7 �̻�
echo ���� ���� : Build %winbuild%
echo.
echo �� ��� �����ϰ� ���� �� ��� 
echo ����ġ ���� ������ �߻��� �� �ֽ��ϴ�.
echo.
echo ��� �����Ͻðڽ��ϱ�? [Y,N]
set /p error=
if /i "%error%" EQU "Y" goto :DWLD
if /i "%error%" EQU "y" goto :DWLD
if /i "%error%" EQU "N" goto :EOF
if /i "%error%" EQU "n" goto :EOF
goto ER1


:DWLD
cls
mode con cols=50 lines=20
cd %systemdrive%\RepoTEMP
del /q link.encrypted >nul >nul
del /q list.txt >nul >nul
echo =================================================
echo YH Repository - DOWNLOADING FILES
echo =================================================
echo.
echo.
echo ������ ���� Ȯ�� [�Ϸ�!]
echo.               
echo.	          
echo ���� Ȯ�� �� [�Ϸ�!]       
echo.
echo.
echo ���� �ٿ�ε� �� . . .
echo.
echo.
echo.
echo.
if exist "%systemdrive%\RepoTEMP\settings.ini" goto DWLD_2
bin\wget.exe -q -nc -P %systemdrive%\RepoTEMP --no-hsts https://raw.githubusercontent.com/YHREPO/yhrepo/master/settings.ini
:DWLD_2
bin\wget.exe -q -nc -P %systemdrive%\RepoTEMP --no-hsts https://raw.githubusercontent.com/YHREPO/yhrepo/master/link.encrypted
bin\wget.exe -q -nc -P %systemdrive%\RepoTEMP --no-hsts https://raw.githubusercontent.com/YHREPO/yhrepo/master/list.txt
ping -n 2 localhost >nul
if not exist "%systemdrive%\RepoTEMP\settings.ini" goto ER2
if not exist "%systemdrive%\RepoTEMP\link.encrypted" goto ER2
if not exist "%systemdrive%\RepoTEMP\list.txt" goto ER2
goto MAIN


:MAIN
cls
mode con cols=50 lines=20
set DWLD_F=1
set SMD=
for /f "tokens=2 delims==" %%g in ('type "%systemdrive%\RepoTEMP\settings.ini" ^|findstr /bi "DF="') do (set "DWLD_F=%%g")
if "%DWLD_F%"=="1" set DWLD_F=%userprofile%\Downloads
if not exist "%systemdrive%\RepoTEMP\list.txt" set LIST=����Ʈ�� �߰ߵ��� �ʾҽ��ϴ�.
echo =================================================
echo YH Repository - MAIN
echo =================================================
echo.
type %systemdrive%\RepoTEMP\list.txt || echo %LIST%
echo.
echo S. ����
echo.
echo C. ������ 
echo.
echo ���Ͻô� ��ȣ�� �Է�
choice /c 12345sc /m ":"
IF ERRORLEVEL==7 goto EOF
IF ERRORLEVEL==6 goto SET
IF ERRORLEVEL==5 goto M5
IF ERRORLEVEL==4 goto M4
IF ERRORLEVEL==3 goto M3
IF ERRORLEVEL==2 goto M2
IF ERRORLEVEL==1 goto M1


:M1
set SMD=1
goto FLD

:M2
set SMD=2
goto FLD

:M3
set SMD=3
goto FLD

:M4
set SMD=4
goto FLD

:M5
set SMD=5
goto FLD

:FLD
cls
echo =================================================
echo YH Repository - DOWNLOADING FILE
echo =================================================
echo.
echo ���� �ٿ�ε�
echo. 
echo.               
echo ���� ��ũ ��ȣȭ ��...	          
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ��� ��ٷ� �ּ��� . . .
call %systemdrive%\RepoTEMP\Tool.bat %SMD%
cd %systemdrive%\RepoTEMP
set/p LNK=<Decrypted.txt
goto FLD_2


:FLD_2
if not exist "%systemdrive%\RepoTEMP\bin\wget.exe" goto ER_wget
set DWLD_F=1
for /f "tokens=2 delims==" %%g in ('type "%systemdrive%\RepoTEMP\settings.ini" ^|findstr /bi "DF="') do (set "DWLD_F=%%g")
if "%DWLD_F%"=="1" set DWLD_F=%userprofile%\Downloads
cls
echo =================================================
echo YH Repository - DOWNLOADING FILE
echo =================================================
echo.
echo ���� �ٿ�ε�
echo.
echo.               
echo ���� ��ũ ��ȣȭ [�Ϸ�]	          
echo. 
echo.
echo ���� �ٿ�ε� ��...
echo. 
echo.
echo.
echo.
echo ��� ��ٷ� �ּ��� . . .
bin\wget.exe -q -nc -P %DWLD_F% --no-hsts %LNK%
ping -n 2 localhost >nul
goto FLD_3


:FLD_3
cls
echo =================================================
echo YH Repository - DOWNLOAD Completed
echo =================================================
echo.
echo ���� �ٿ�ε� 
echo.
echo.               
echo ���� ��ũ ��ȣȭ [�Ϸ�]	          
echo.
echo.
echo ���� �ٿ�ε� [�Ϸ�]
echo. 
echo.
echo ���� ���� ��ġ : %DWLD_F%
echo.
echo �ƹ�Ű�� ������ �������� �����ϴ�.
pause>nul
goto MAIN





:SET
if exist "%systemdrive%\RepoTEMP\dev.conf" goto SET_dev
cls
echo =================================================
echo YH Repository - SETTINGS
echo =================================================
echo.
echo �� �� 
echo.               
echo 1. �ٿ�ε� ���� ��� ����	          
echo.      
echo D. ������ ���
echo.
echo R. ���α׷� �ʱ�ȭ
echo.
echo L. ���̼���
echo. 
echo U. ������Ʈ Ȯ��
echo.
echo C. ������
set /p setting= ���Ͻô� ��ȣ�� �Է� :
if %setting%==1 goto S_DWLD_F
if %setting%==D goto S_DEVM
if %setting%==R goto RESET
if %setting%==L goto LIC2
if %setting%==C goto MAIN 
if %setting%==d goto S_DEVM
if %setting%==r goto RESET
if %setting%==l goto LIC2
if %setting%==c goto MAIN 
if %setting%==U goto CHKUPD
if %setting%==u goto CHKUPD
goto :SET


:SET_dev
cls
echo =================================================
echo YH Repository - SETTINGS [Dev]
echo =================================================
echo.
echo �� ��
echo.               
echo 1. �ٿ�ε� ���� ��� ���� 	          
echo.      
echo D. ������ ���
echo.
echo R. ���α׷� �ʱ�ȭ
echo.
echo L. ���̼���
echo. 
echo U. ������Ʈ Ȯ��
echo.
echo F. Config YH Repository
echo.
echo C. ������ 
set /p setting= ���Ͻô� ��ȣ�� �Է� :
if %setting%==1 goto S_DWLD_F
if %setting%==D goto S_DEVM
if %setting%==R goto RESET
if %setting%==L goto LIC2
if %setting%==C goto MAIN 
if %setting%==d goto S_DEVM
if %setting%==r goto RESET
if %setting%==l goto LIC2
if %setting%==c goto MAIN 
if %setting%==F goto FLST6
if %setting%==f goto FLST
if %setting%==U goto CHKUPD
if %setting%==u goto CHKUPD
goto :SET_dev


:CHKUPD
cd %systemdrive%\RepoTEMP
if not exist "db.txt" goto UPD_D
if not exist "ndb.txt" goto UPD_N
del ndb.txt
:CHKUPD1
cls
echo =================================================
echo YH Repository - CHECKING UPDATE
echo =================================================
echo.
echo Repo ���α׷� ������Ʈ
echo.
echo.               
echo.	          
echo YH Repository ���� ������Ʈ Ȯ�� ��...
echo.
echo.
echo.
echo.
echo.
echo.
echo ��� ��ٷ� �ּ���.
ping -n 3 localhost >nul
goto UPD_2


:UPD_2
if "%ORP%" LSS "%NRP%" goto UPD_3
if "%ORP%" == "%NRP%" goto NUP
goto ER0

:UPD_D
cd %systemdrive%\RepoTEMP
echo 1.0 >>%systemdrive%\RepoTEMP\db.txt
goto CHKUPD


:UPD_N
bin\wget.exe -q -nc -P %systemdrive%\RepoTEMP --no-hsts https://raw.githubusercontent.com/YHREPO/REPOPROG/main/ndb.txt
if not exist "db.txt" goto ER0
if not exist "ndb.txt" goto ER0
set /p ORP=<db.txt
set /p NRP=<ndb.txt
goto CHKUPD1


:ER0
cls
echo =================================================
echo YH Repository - UPDATE Failed
echo =================================================
echo.
echo Repo ���α׷� ������Ʈ
echo.
echo.               
echo ������Ʈ �� ������ �߻��Ͽ�	          
echo.
echo ������Ʈ�� �ߴܵǾ����ϴ�
echo.
echo.
echo.
echo.
echo.
echo �ƹ�Ű�� ������ �������� �����ϴ�.
pause>nul
goto MAIN

:NUP
cd %systemdrive%\RepoTEMP
del db.txt
cls
echo =================================================
echo YH Repository - CHECKING UPDATE
echo =================================================
echo.
echo Repo ���α׷� ������Ʈ
echo.
echo.               
echo.	          
echo YH Repository ���� �߰ߵ� ������Ʈ�� �����ϴ�.
echo.
echo.
echo �� ������ �ֽ� �����Դϴ�.
echo.
echo.
echo.
echo �ƹ�Ű�� ������ �������� �����ϴ�.
pause>nul
goto MAIN


:NPD
cd %systemdrive%\RepoTEMP
del db.txt
cls
echo =================================================
echo YH Repository - CHECKING UPDATE
echo =================================================
echo.
echo Repo ���α׷� ������Ʈ
echo.
echo.               
echo.	          
echo ������Ʈ�� ����Ͽ����ϴ�.
echo.
echo.
echo.
echo.
echo.
echo.
echo 3�� �� �������� �����ϴ�.
ping -n 3 localhost >nul
goto MAIN



:UPD_3
cls
echo =================================================
echo YH Repository - CHECKING UPDATE
echo =================================================
echo.
echo Repo ���α׷� ������Ʈ
echo.
echo.               
echo �� ������ Repo ���α׷��� �߰ߵǾ����ϴ�.          
echo.
echo.
echo ���� ���� : %ORP%
echo. 
echo ���ο� ���� : %NRP%
echo.
echo.
echo ������Ʈ�� �����Ͻðڽ��ϱ�?
choice /c YN /m "Y,N �Է�"
IF ERRORLEVEL==2 goto NPD
IF ERRORLEVEL==1 goto UPD_4


:UPD_4
cd %systemdrive%\RepoTEMP
if not exist "UPDATE" md UPDATE
set ORP=%NRP%
del ndb.txt
del db.txt
echo %NRP%>>%systemdrive%\RepoTEMP\db.txt 
bin\wget.exe -q -nc -P %systemdrive%\RepoTEMP\UPDATE --no-hsts https://raw.githubusercontent.com/YHREPO/REPOPROG/main/repo.bat
if not exist "%userprofile%\Desktop\NEW_REPO" md %userprofile%\Desktop\NEW_REPO
move %systemdrive%\RepoTEMP\UPDATE\repo.bat %userprofile%\Desktop\NEW_REPO\repo.bat
cls
echo =================================================
echo YH Repository - CHECKING UPDATE
echo =================================================
echo.
echo Repo ���α׷� ������Ʈ
echo.
echo.               
echo ������Ʈ�� ���� �� �Դϴ�.	          
echo.
echo ���α׷��� �������� ������.
echo.
echo.
echo ������Ʈ �� Repo ���� : %ORP%
echo.
echo.
echo ��� ��ٷ� �ּ���.
ping -n 3 localhost >nul
goto UPD_5


:UPD_5
cd %systemdrive%\RepoTEMP
del db.txt
cls
echo =================================================
echo YH Repository - UPDATE Completed
echo =================================================
echo.
echo Repo ���α׷� ������Ʈ
echo.
echo.               
echo Repo ���α׷��� ������Ʈ�� �Ϸ� �Ǿ����ϴ�.         
echo.
echo ���ο� Repo ���α׷��� �Ʒ� ��ο� �ٿ�ε� �Ǿ����ϴ�.
echo.
echo [%userprofile%\Desktop\NEW_REPO]
echo.
echo ������Ʈ �� Repo ���� : %ORP%
echo.
echo �ƹ�Ű�� ������ �������� �����ϴ�.
pause>nul
goto MAIN


:FLST
set lnke=Not Exist
set seti=Not Exist
set tlbt=Not Exist
set wgte=Not Exist
set lstt=Not Exist
set intn=Not Connected
set lsnc=Not Exist
set DWLD_F=1
set Archt=Win32
if %PROCESSOR_ARCHITECTURE%==AMD64 set Archt=x64
if %PROCESSOR_ARCHITECTURE%==ARM set Archt=ARM
if %PROCESSOR_ARCHITECTURE%==ARM64 set Archt=ARM64
for /f "tokens=2 delims==" %%g in ('type "%systemdrive%\RepoTEMP\settings.ini" ^|findstr /bi "DF="') do (set "DWLD_F=%%g")
if "%DWLD_F%"=="1" set DWLD_F=%userprofile%\Downloads
del /q %systemdrive%\RepoTEMP\tele.txt >nul >nul
bin\wget.exe -q -nc -P %systemdrive%\RepoTEMP --no-hsts https://raw.githubusercontent.com/vntvc/VnTVaccine/master/tele.txt
if exist "%systemdrive%\RepoTEMP\link.encrypted" set lnke=Exist
if exist "%systemdrive%\RepoTEMP\settings.ini" set seti=Exist
if exist "%systemdrive%\RepoTEMP\Tool.bat" set tlbt=Exist
if exist "%systemdrive%\RepoTEMP\bin\wget.exe" set wgte=Exist
if exist "%systemdrive%\RepoTEMP\list.txt" set lstt=Exist
if exist "%systemdrive%\RepoTEMP\tele.txt" set intn=Server Connected
if exist "%systemdrive%\RepoTEMP\license.txt" set lsnc=Exist
cls
echo =================================================
echo YH Repository - Config YH Repository 
echo =================================================
echo.
echo YHREPO CONFIG
echo.               
echo link.encrypted = [%lnke%] 
echo settings.ini = [%seti%] 
echo Tool.bat = [%tlbt%]
echo wget.exe = [%wgte%]
echo license.txt = [%lsnc%]
echo list.txt = [%lstt%]
echo YHREPO GitHub = [%intn%]
echo Download Folder = [%DWLD_F%]
echo Processor Architecture = [%Archt%]
echo Windows Build = [%winbuild%]
echo.
echo �ƹ�Ű�� ������ �������� �����ϴ�.
pause>nul
goto SET_dev

:S_DWLD_F
cls
echo =================================================
echo YH Repository - SET Download Folder
echo =================================================
echo.
echo �ٿ�ε� ���� ��� ����
echo.               
echo ==================   
echo.    
echo ���� ��� : %DWLD_F%
echo.
echo ==================
echo.
echo ���ο� ��� ������ ���Ͻø� %systemdrive%\RepoTEMP �� 
echo settings.ini ���Ͽ� DF=���Ͻô� ��θ� �߰��Ͽ� �ּ���
echo.
pause>nul
goto S_DWLD_F2

:S_DWLD_F2
cls
for /f "tokens=2 delims==" %%g in ('type "%systemdrive%\RepoTEMP\settings.ini" ^|findstr /bi "DF="') do (set "DWLD_F=%%g")
echo =================================================
echo YH Repository - SET Download Folder
echo =================================================
echo.
echo �ٿ�ε� ���� ��� ���� 
echo.               
echo.  
echo.    
echo �ٿ�ε� ���� ��θ� ���� �� �Դϴ�.
echo.
echo.
echo.
echo.
echo ���� �� �ڵ����� �������� �����ϴ�.
echo.
ping -n 3 localhost >nul
goto SET


:S_DEVM
set DV=OFF
if exist "%systemdrive%\RepoTEMP\dev.conf" set DV=ON
:S_DEV
set menu=
cls
echo =================================================
echo YH Repository - DEVELOPER MODE
echo =================================================
echo.
echo �� �� ��  �� ��
echo.               
echo ==================     
echo.      
echo D. ������ ��� - %DV%
echo.
echo ==================
echo.
echo.
echo. 
echo ���Ͻô� �ɼ��� ��� �Է��ϼ���. [��ĭ���� ���θ� �����ϴ�.]
set /p menu= ^> �Է� :
if [%menu%]==[] goto :S2_DEV
set menu=%menu:~0,1%
if /i %menu%==D (if /i %DV%==OFF (set DV=ON) else (set DV=OFF))
goto :S_DEV


:S2_DEV
if "%DV%"=="ON" goto ON_DEV
goto S3_DEV

:ON_DEV
cd %systemdrive%\RepoTEMP
echo DEVELOPER MODE = ON >>%systemdrive%\RepoTEMP\dev.conf
goto S4_DEV

:OFF_DEV
cd %systemdrive%\RepoTEMP
del /s /q %systemdrive%\RepoTEMP\dev.conf >nul
goto S4_DEV

:S3_DEV
if exist "%systemdrive%\RepoTEMP\dev.conf" goto OFF_DEV
goto S4_DEV

:S4_DEV
echo.
echo ������ ���� �� . . .
ping -n 3 localhost >nul
goto SET

:RESET
cls
echo =================================================
echo YH Repository - RESET
echo =================================================
echo.
echo �� �� ȭ 
echo.               
echo.
echo "YH Repository"�� ó�� ���·� �ǵ����ϴ�.               
echo.          
echo.      
echo �� �۾��� �߰��� ����� �� ������ 
echo.
echo RepoTEMP ������ �ִ� ��� ���ϵ��� �����˴ϴ�.
echo.
echo �ʱ�ȭ�� ���� : RepoTEMP 
echo.
echo ��� �����Ͻðڽ��ϱ�? [Y,N]
set /p reset=
if /i "%reset%" EQU "Y" goto :WRK_RST
if /i "%reset%" EQU "y" goto :WRK_RST
if /i "%reset%" EQU "N" goto :Gmain
if /i "%reset%" EQU "n" goto :Gmain
goto RESET


:WRK_RST
cls
title �ʱ�ȭ ������ ...
echo =================================================
echo YH Repository - RESET
echo =================================================
echo.
echo �� �� ȭ 
echo.               
echo �ʱ�ȭ�� ���� ���Դϴ�.          
echo.      
echo ��ǻ�͸� �����ϰų� ���α׷��� �������� ���ʽÿ�.
echo.
echo.
echo [�� �� ��] . . . Erasing RepoTEMP
echo. 
echo.
echo =================================================
cd %systemdrive%\RepoTEMP
rd /s /q %systemdrive%\RepoTEMP
md %systemdrive%\RepoTEMP
ping -n 3 localhost >nul
goto FNSH_RST


:FNSH_RST
cls
echo =================================================
echo YH Repository - Completed RESET
echo =================================================
echo.
echo �� �� ȭ
echo.               
echo �ʱ�ȭ�� ���������� �Ϸ�Ǿ����ϴ�.	          
echo.      
echo YH Repository �� ����� ���ֽʽÿ�.
echo.
echo.
echo.
echo. 
echo.
echo �ƹ�Ű�� ������ ����˴ϴ�.
pause>nul
goto EOF



:Gmain
cls
echo =================================================
echo YH Repository - Canceled RESET
echo =================================================
echo.
echo �� �� ȭ 
echo.               
echo ��� �۾��� ����Ͽ����ϴ�.        
echo.      
echo.
echo.
echo.
echo.
echo. 
echo.
echo 3�� �� �������� ���ư��ϴ�.
ping -n 3 localhost >nul
goto MAIN


:LIC2
cls
mode con cols=120 lines=9000
cd %systemdrive%\RepoTEMP
if not exist "%systemdrive%\RepoTEMP\license.txt" goto DWLD_F
echo =================================================
echo YH Repository - License
echo =================================================
echo.
type license.txt
echo ����Ϸ��� �ƹ�Ű�� ��������.
pause>nul
goto MAIN


:ER2
cls
echo =================================================
echo YH Repository - ERROR
echo =================================================
echo.
echo ERROR 
echo.               
echo ���� �ٿ�ε忡 �����Ͽ����ϴ�...	          
echo.      
echo ��ǻ�Ͱ� ���ͳݿ� ����Ǿ� ���� �ʰų�
echo ������ ��� �Ҿ����� �� �ֽ��ϴ�.
echo.
echo.
echo. 
echo.
echo �ƹ�Ű�� ������ ����˴ϴ�.
pause>nul
goto EOF


:DWLD_F
cls
echo =================================================
echo YH Repository - DOWNLOADING FILES
echo =================================================
echo.
echo.
echo ������ ���� Ȯ�� [�Ϸ�]
echo.               
echo.	          
echo ������ �������� �ٿ�ε� ��...   [Wget.exe] [Settings.ini]
echo.
echo.
echo.
echo.
echo.
echo.
echo ��� ��ٷ� �ּ��� . . .
if not exist "%systemdrive%\RepoTEMP\bin" md %systemdrive%\RepoTEMP\bin
powershell "(New-Object System.Net.WebClient).DownloadFile('https://github.com/vntvc/VnTVaccine/releases/download/0.9.8/wget.exe',' %systemdrive%\RepoTEMP\bin\wget.exe')"
if not exist "%systemdrive%\RepoTEMP\bin\wget.exe" goto ER2
cd %systemdrive%\RepoTEMP
bin\wget.exe -q -nc -P %systemdrive%\RepoTEMP --no-hsts https://raw.githubusercontent.com/YHREPO/yhrepo/master/settings.ini
bin\wget.exe -q -nc -P %systemdrive%\RepoTEMP --no-hsts https://raw.githubusercontent.com/YHREPO/yhrepo/master/license.txt
ping -n 2 localhost >nul
goto A2


:ER_wget
cls
echo =================================================
echo YH Repository - ERROR
echo =================================================
echo.
echo ERROR 
echo.               
echo RepoTEMP�� wget.exe �� �߰ߵ��� �ʾҽ��ϴ�.       
echo.      
echo.
echo.
echo ������ �ٿ�ε� �ϰų� 
echo.
echo �������� ������ �� �ֽ��ϴ�.
echo.
echo �ٿ�ε� �Ͻðڽ��ϱ�? [Y,N]
set /p error=
if /i "%error%" EQU "Y" goto :DWLD_F
if /i "%error%" EQU "y" goto :DWLD_F
if /i "%error%" EQU "N" goto MAIN
if /i "%error%" EQU "n" goto MAIN
goto ER1


:nadmin
cls
echo =================================================
echo YH Repository - ERROR
echo =================================================
echo.
echo ERROR 
echo.               
echo ������ ������ �ƴմϴ�...	          
echo.
echo ���α׷��� ������ �������� ������ �ּ���
echo.
echo.
echo.
echo. 
echo.
echo �ƹ�Ű�� ������ ����˴ϴ�.
pause>nul