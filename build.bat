@echo off
:loop
@echo off&amp;color 0A
cls
echo,
echo ��ѡ��Ҫ�����ϵͳ������
echo,
echo 1. Windows_amd64
echo 2. linux_amd64
echo 3. linux_i386
echo 4. All
echo 0. quit
echo,
::���releaseĿ¼...
rmdir /s release /Q
SET projectName="fileserver"
::SET zipDirs=config public
SET zipDirs=
::del app


set/p action=��ѡ��:
if %action% == 1 goto build_Windows_amd64
if %action% == 2 goto build_linux_amd64
if %action% == 3 goto build_linux_i386
if %action% == 4 goto all
if %action% == 0 goto end
cls &amp; goto :loop

:build_Windows_amd64
echo ����Windows�汾64λ
SET CGO_ENABLED=0
SET GOOS=windows
SET GOARCH=amd64
go build -v -a -o release/windows/amd64/%projectName%_windows_amd64.exe
echo �����Դ������Ŀ¼�����
copy release\windows\amd64\%projectName%_windows_amd64.exe .
echo ���zip��
WinRAR.exe a release/%projectName%_windows_amd64.zip %zipDirs% %projectName%_windows_amd64.exe
timeout /t 2 /nobreak
del %projectName%_windows_amd64.exe
goto end

:build_linux_amd64
echo ����Linux�汾64λ
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -v -a -o release/linux/amd64/%projectName%_linux_amd64
echo �����Դ������Ŀ¼�����
copy release\linux\amd64\%projectName%_linux_amd64 .
echo ���zip��
WinRAR.exe a release/%projectName%_linux_amd64.zip %zipDirs% %projectName%_linux_amd64
timeout /t 2 /nobreak
del %projectName%_linux_amd64
goto end

:build_linux_i386
echo ����Linux�汾32λ
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=386
go build -v -a -o release/linux/i386/%projectName%_linux_i386
echo �����Դ������Ŀ¼�����
copy release\linux\i386\%projectName%_linux_i386 .
echo ���zip��
WinRAR.exe a release/%projectName%_linux_i386.zip %zipDirs% %projectName%_linux_i386
timeout /t 2 /nobreak
del %projectName%_linux_i386
goto end

:all
echo ׼���������а汾�������ĵȴ�...
timeout /t 3 /nobreak
::ɾ��֮ǰ��zip��
del release\*.zip
echo,

echo ����Windows�汾64λ
SET CGO_ENABLED=0
SET GOOS=windows
SET GOARCH=amd64
go build -v -a -o release/windows/amd64/%projectName%_windows_amd64.exe
echo �����Դ������Ŀ¼�����
copy release\windows\amd64\%projectName%_windows_amd64.exe .
echo ���zip��
WinRAR.exe a release/%projectName%_windows_amd64.zip %zipDirs% %projectName%_windows_amd64.exe
timeout /t 2 /nobreak
del %projectName%_windows_amd64.exe

echo ===============�ָ���=====================

echo ����Linux�汾64λ
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -v -a -o release/linux/amd64/%projectName%_linux_amd64
echo �����Դ������Ŀ¼�����
copy release\linux\amd64\%projectName%_linux_amd64 .
echo ���zip��
WinRAR.exe a release/%projectName%_linux_amd64.zip %zipDirs% %projectName%_linux_amd64
timeout /t 2 /nobreak
del %projectName%_linux_amd64

echo ===============�ָ���=====================

echo ����Linux�汾32λ
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=386
go build -v -a -o release/linux/i386/%projectName%_linux_i386
echo �����Դ������Ŀ¼�����
copy release\linux\i386\%projectName%_linux_i386 .
echo ���zip��
WinRAR.exe a release/%projectName%_linux_i386.zip %zipDirs% %projectName%_linux_i386
timeout /t 2 /nobreak
del %projectName%_linux_i386

:end
start release
pause
#@exit
