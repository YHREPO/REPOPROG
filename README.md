# YH Repository
The Console Program For YH Repository

## About

이 프로그램은 GitHub의 [[YHREPO]](<https://github.com/YHREPO/yhrepo/>) 에 관련된 파일들을 다운로드하기 위하여 만들어졌습니다. 

### 주의 사항

이 프로그램을 사용하기 전 **라이선스**를 꼭 읽어주십시오.

이 프로그램의 라이선스는 **[[여기]](<https://github.com/YHREPO/yhrepo/blob/master/license.txt>)** 에서 확인하실 수 있습니다.

#### 사용된 프로그램

- `wget.exe`  [[라이선스]](https://www.gnu.org/licenses/gpl-3.0.html)
- `Tool.bat`  [[라이선스]](<https://github.com/YHREPO/yhrepo/blob/master/license.txt>)

## 사용 방법

1. **[여기](<https://github.com/YHREPO/REPOPROG/releases/latest>)** 에서 YH Repository 최신버전 다운로드

2. 다운로드 된 `repo.bat` 을 관리자 권한으로 실행(Run as administrator) 클릭

3. 목록 중 원하는 파일 번호 및 옵션 입력


> 자신의 컴퓨터가 Windows 7 일 경우

아래 파일들을 다운로드 후 아래 명시된 폴더에 저장 

WGET -> `(Drive):\RepoTEMP\bin`

settings.ini -> `(Drive):\RepoTEMP`

### 개발자 모드

개발자 모드를 사용 시 설저 목록 중 `Config YH Repository` 목록이 활성화 됨.

#### [Config YH Repository]의 기능

RepoTEMP 폴더 내 파일의 존재 유무, GitHub 서버의 연결 유무, 지정된 다운로드 폴더 등등 을 확인할 수 있음.

#### 개발자 모드 설정

1. `repo.bat` 을 관리자 권한으로 실행(Run as administrator) 클릭

2. 목록 중 `S.설정` 진입 -> `D.개발자 모드` 진입

3. 키보드 D 키를 눌러 원하는 옵션 선택 

    **[ON] <-> [OFF]**

4. Enter 키를 눌러 설정으로 나옴

[wget.exe](<https://github.com/vntvc/VnTVaccine/releases/download/0.9.8/wget.exe>)

[settings.ini](<https://raw.githubusercontent.com/YHREPO/yhrepo/master/settings.ini>)

## Tool.bat

**[[다운로드]](<https://raw.githubusercontent.com/YHREPO/REPOPROG/main/Tool.bat>)**

### About Tool.bat

**YH Repository** 에서 암호화된 링크를 다운로드하여
일반 링크로 복호화를 도와주는 배치파일입니다.

이 프로그램은 `(Drive):\RepoTEMP\`에 settings.ini 설정파일이 있어야 정상적으로 작동됩니다.

## 다운로드 폴더 

Repository의 기본 다운로드 위치는 `(사용자)\Downloads` 입니다.

### 다운로드 폴더 설정

`(Drive):\RepoTEMP\`에 settings.ini 설정파일을 열어 

아래와 같이 입력

>=====SETTINGS.INI=====
>
>Algorithm=decode
>
>OriginFile=!systemdrive!\RepoTEMP\link.encrypted
>
>ModifiedFile=!systemdrive!\RepoTEMP\!fld!\link.txt
>
>FileName=link.txt
>
>DF=원하는 다운로드 위치
>
>======================

Ex) DF=C:\RepoTEMP

그리고 YH Repository 프로그램을 실행 후

`S.설정` 진입 -> `1.다운로드 폴더 경로 설정` 진입.

위 `settings.ini` 설정파일을 이미 수정하였다면

Enter 키를 눌러 다운로드 폴더 경로를 적용할 수 있습니다.

## 출처
___아래의 내용을 복사하여 출처를 남겨주세요___
>[출처]
>GitHub YHREPO:REPOPROG
><https://github.com/vntvc/VnTVaccine>
><https://github.com/YHREPO/REPOPROG>
	
## Em@il

Em@il: <yhrepo.github@gmail.com> (YHREPO)

