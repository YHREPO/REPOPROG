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
echo 관리자 권한 확인 중 . . .
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
echo 관리자 권한 확인 [완료]
echo.               
echo.	          
echo 파일 확인 중 . . .       
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
echo 관리자 권한 확인 [완료!]
echo.               
echo.	          
echo 파일 확인 중 [완료!]       
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
echo 계속하려면 아무키나 누르세요.
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
echo 현재 운영체제의 버전이 권장버전보다 낮습니다...	          
echo.      
echo 권장 버전 : WINDOWS 7 이상
echo 현재 버전 : Build %winbuild%
echo.
echo 이 경고를 무시하고 실행 할 경우 
echo 예기치 않은 오류가 발생할 수 있습니다.
echo.
echo 계속 실행하시겠습니까? [Y,N]
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
echo 관리자 권한 확인 [완료!]
echo.               
echo.	          
echo 파일 확인 중 [완료!]       
echo.
echo.
echo 파일 다운로드 중 . . .
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
if not exist "%systemdrive%\RepoTEMP\list.txt" set LIST=리스트가 발견되지 않았습니다.
echo =================================================
echo YH Repository - MAIN
echo =================================================
echo.
type %systemdrive%\RepoTEMP\list.txt || echo %LIST%
echo.
echo S. 설정
echo.
echo C. 나가기 
echo.
echo 원하시는 번호를 입력
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
echo 파일 다운로드
echo. 
echo.               
echo 파일 링크 복호화 중...	          
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo 잠시 기다려 주세요 . . .
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
echo 파일 다운로드
echo.
echo.               
echo 파일 링크 복호화 [완료]	          
echo. 
echo.
echo 파일 다운로드 중...
echo. 
echo.
echo.
echo.
echo 잠시 기다려 주세요 . . .
bin\wget.exe -q -nc -P %DWLD_F% --no-hsts %LNK%
ping -n 2 localhost >nul
goto FLD_3


:FLD_3
cls
echo =================================================
echo YH Repository - DOWNLOAD Completed
echo =================================================
echo.
echo 파일 다운로드 
echo.
echo.               
echo 파일 링크 복호화 [완료]	          
echo.
echo.
echo 파일 다운로드 [완료]
echo. 
echo.
echo 파일 저장 위치 : %DWLD_F%
echo.
echo 아무키나 누르면 메인으로 나갑니다.
pause>nul
goto MAIN





:SET
if exist "%systemdrive%\RepoTEMP\dev.conf" goto SET_dev
cls
echo =================================================
echo YH Repository - SETTINGS
echo =================================================
echo.
echo 설 정 
echo.               
echo 1. 다운로드 폴더 경로 설정	          
echo.      
echo D. 개발자 모드
echo.
echo R. 프로그램 초기화
echo.
echo L. 라이선스
echo. 
echo U. 업데이트 확인
echo.
echo C. 나가기
set /p setting= 원하시는 번호를 입력 :
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
echo 설 정
echo.               
echo 1. 다운로드 폴더 경로 설정 	          
echo.      
echo D. 개발자 모드
echo.
echo R. 프로그램 초기화
echo.
echo L. 라이선스
echo. 
echo U. 업데이트 확인
echo.
echo F. Config YH Repository
echo.
echo C. 나가기 
set /p setting= 원하시는 번호를 입력 :
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
echo Repo 프로그램 업데이트
echo.
echo.               
echo.	          
echo YH Repository 에서 업데이트 확인 중...
echo.
echo.
echo.
echo.
echo.
echo.
echo 잠시 기다려 주세요.
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
echo Repo 프로그램 업데이트
echo.
echo.               
echo 업데이트 중 오류가 발생하여	          
echo.
echo 업데이트가 중단되었습니다
echo.
echo.
echo.
echo.
echo.
echo 아무키나 누르면 메인으로 나갑니다.
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
echo Repo 프로그램 업데이트
echo.
echo.               
echo.	          
echo YH Repository 에서 발견된 업데이트가 없습니다.
echo.
echo.
echo 이 버전이 최신 버전입니다.
echo.
echo.
echo.
echo 아무키나 누르면 메인으로 나갑니다.
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
echo Repo 프로그램 업데이트
echo.
echo.               
echo.	          
echo 업데이트를 취소하였습니다.
echo.
echo.
echo.
echo.
echo.
echo.
echo 3초 후 메인으로 나갑니다.
ping -n 3 localhost >nul
goto MAIN



:UPD_3
cls
echo =================================================
echo YH Repository - CHECKING UPDATE
echo =================================================
echo.
echo Repo 프로그램 업데이트
echo.
echo.               
echo 새 버전의 Repo 프로그램이 발견되었습니다.          
echo.
echo.
echo 현재 버전 : %ORP%
echo. 
echo 새로운 버전 : %NRP%
echo.
echo.
echo 업데이트를 진행하시겠습니까?
choice /c YN /m "Y,N 입력"
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
echo Repo 프로그램 업데이트
echo.
echo.               
echo 업데이트가 진행 중 입니다.	          
echo.
echo 프로그램을 종료하지 마세요.
echo.
echo.
echo 업데이트 후 Repo 버전 : %ORP%
echo.
echo.
echo 잠시 기다려 주세요.
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
echo Repo 프로그램 업데이트
echo.
echo.               
echo Repo 프로그램의 업데이트가 완료 되었습니다.         
echo.
echo 새로운 Repo 프로그램은 아래 경로에 다운로드 되었습니다.
echo.
echo [%userprofile%\Desktop\NEW_REPO]
echo.
echo 업데이트 된 Repo 버전 : %ORP%
echo.
echo 아무키나 누르면 메인으로 나갑니다.
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
echo 아무키나 누르면 설정으로 나갑니다.
pause>nul
goto SET_dev

:S_DWLD_F
cls
echo =================================================
echo YH Repository - SET Download Folder
echo =================================================
echo.
echo 다운로드 폴더 경로 설정
echo.               
echo ==================   
echo.    
echo 현재 경로 : %DWLD_F%
echo.
echo ==================
echo.
echo 새로운 경로 설정을 원하시면 %systemdrive%\RepoTEMP 에 
echo settings.ini 파일에 DF=원하시는 경로를 추가하여 주세요
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
echo 다운로드 폴더 경로 설정 
echo.               
echo.  
echo.    
echo 다운로드 폴더 경로를 설정 중 입니다.
echo.
echo.
echo.
echo.
echo 설정 후 자동으로 메인으로 나갑니다.
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
echo 개 발 자  모 드
echo.               
echo ==================     
echo.      
echo D. 개발자 모드 - %DV%
echo.
echo ==================
echo.
echo.
echo. 
echo 원하시는 옵션의 영어를 입력하세요. [빈칸으로 놔두면 나갑니다.]
set /p menu= ^> 입력 :
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
echo 설정값 저장 중 . . .
ping -n 3 localhost >nul
goto SET

:RESET
cls
echo =================================================
echo YH Repository - RESET
echo =================================================
echo.
echo 초 기 화 
echo.               
echo.
echo "YH Repository"를 처음 상태로 되돌립니다.               
echo.          
echo.      
echo 이 작업은 중간에 취소할 수 없으며 
echo.
echo RepoTEMP 폴더에 있는 모든 파일들은 삭제됩니다.
echo.
echo 초기화될 폴더 : RepoTEMP 
echo.
echo 계속 진행하시겠습니까? [Y,N]
set /p reset=
if /i "%reset%" EQU "Y" goto :WRK_RST
if /i "%reset%" EQU "y" goto :WRK_RST
if /i "%reset%" EQU "N" goto :Gmain
if /i "%reset%" EQU "n" goto :Gmain
goto RESET


:WRK_RST
cls
title 초기화 진행중 ...
echo =================================================
echo YH Repository - RESET
echo =================================================
echo.
echo 초 기 화 
echo.               
echo 초기화가 진행 중입니다.          
echo.      
echo 컴퓨터를 종료하거나 프로그램을 종료하지 마십시오.
echo.
echo.
echo [진 행 중] . . . Erasing RepoTEMP
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
echo 초 기 화
echo.               
echo 초기화가 성공적으로 완료되었습니다.	          
echo.      
echo YH Repository 를 재시작 해주십시오.
echo.
echo.
echo.
echo. 
echo.
echo 아무키나 누르면 종료됩니다.
pause>nul
goto EOF



:Gmain
cls
echo =================================================
echo YH Repository - Canceled RESET
echo =================================================
echo.
echo 초 기 화 
echo.               
echo 모든 작업을 취소하였습니다.        
echo.      
echo.
echo.
echo.
echo.
echo. 
echo.
echo 3초 후 메인으로 돌아갑니다.
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
echo 계속하려면 아무키나 누르세요.
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
echo 파일 다운로드에 실패하였습니다...	          
echo.      
echo 컴퓨터가 인터넷에 연결되어 있지 않거나
echo 서버가 잠시 불안정할 수 있습니다.
echo.
echo.
echo. 
echo.
echo 아무키나 누르면 종료됩니다.
pause>nul
goto EOF


:DWLD_F
cls
echo =================================================
echo YH Repository - DOWNLOADING FILES
echo =================================================
echo.
echo.
echo 관리자 권한 확인 [완료]
echo.               
echo.	          
echo 파일을 수동으로 다운로드 중...   [Wget.exe] [Settings.ini]
echo.
echo.
echo.
echo.
echo.
echo.
echo 잠시 기다려 주세요 . . .
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
echo RepoTEMP에 wget.exe 가 발견되지 않았습니다.       
echo.      
echo.
echo.
echo 파일을 다운로드 하거나 
echo.
echo 메인으로 나가실 수 있습니다.
echo.
echo 다운로드 하시겠습니까? [Y,N]
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
echo 관리자 권한이 아닙니다...	          
echo.
echo 프로그램을 관리자 권한으로 실행해 주세요
echo.
echo.
echo.
echo. 
echo.
echo 아무키나 누르면 종료됩니다.
pause>nul