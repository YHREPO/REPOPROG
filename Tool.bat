@echo off
title Decryption Tool By YHREPO
setlocal EnableDelayedExpansion
if not exist "%systemdrive%\RepoTEMP\license.txt" goto ER4
echo Decryption Tool By YHREPO
echo Release 1.0 [2021-02-09] 
echo Distributed for free under the MIT License.
set NAND=%1
if /i "%1" == "%NAND%" set SEL=%NAND%
echo.
set AL=
set OFile=
set MFile=
set fld=
set MEM=
set MEM2=
set MEM3=
set MEM4=
set MEM5=
cd %systemdrive%\RepoTEMP
set fld=%random%
if not exist "%systemdrive%\RepoTEMP\Bin\wget.exe" goto ER1
if not exist "%systemdrive%\RepoTEMP\settings.ini" goto ER2
md %fld%
for /f "tokens=2 delims==" %%a in ('type "%systemdrive%\RepoTEMP\settings.ini" ^|findstr /bi "Algorithm="') do (set "MEM=%%a")
for /f "tokens=2 delims==" %%b in ('type "%systemdrive%\RepoTEMP\settings.ini" ^|findstr /bi "OriginFile="') do (set "MEM2=%%b")
for /f "tokens=2 delims==" %%c in ('type "%systemdrive%\RepoTEMP\settings.ini" ^|findstr /bi "ModifiedFile="') do (set "MEM3=%%c")
for /f "tokens=2 delims==" %%f in ('type "%systemdrive%\RepoTEMP\settings.ini" ^|findstr /bi "FileName="') do (set "MEM5=%%f")
echo Settings.ini ���� �ҷ����� ��...
echo.
echo �������� %SEL% �Դϴ�.
certutil -%MEM% %MEM2% %MEM3% >nul || goto ER3
for /f "tokens=2 delims=&" %%d in ('type "%systemdrive%\RepoTEMP\%fld%\%MEM5%" ^|findstr /bi "%SEL%."') do (set "MEM4=%%d")
echo %MEM4% > %systemdrive%\RepoTEMP\Decrypted.txt
rd /s /q %systemdrive%\RepoTEMP\%fld%
echo �۾��� �Ϸ�Ǿ����ϴ�.
goto EOF

:ER1
cls
color 4f
echo [ERROR]
echo.
echo �ٿ�ε� �� �ʿ��� ������ �����ϴ�...
echo.
echo �ƹ�Ű�� ������ ����˴ϴ�.
PAUSE>NUL
goto EOF


:ER2
cls
color 4f
echo [ERROR]
echo.
echo �������� �����ϴ�...
echo.
echo �ƹ�Ű�� ������ ����˴ϴ�.
PAUSE>NUL
goto EOF





:ER3
cls
color 4f
echo [ERROR]
echo.
echo �۾��� ���� �߻�
echo.
echo �ƹ�Ű�� ������ ����˴ϴ�.
PAUSE>NUL
goto EOF

:ER4
cls
color 4f
echo [ERROR]
echo.
echo ���̼��� ������ �߰ߵ��� �ʾҽ��ϴ�...
echo.
echo �ƹ�Ű�� ������ ����˴ϴ�.
PAUSE>NUL
goto EOF


:EOF