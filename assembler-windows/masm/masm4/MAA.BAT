@echo off
rem �᫨ � ����⢥ ��ࠬ��� ��।��� ��� 䠩�� � �ணࠬ��� ��� ���७��
if exist %1 goto f3
if not exist %1.asm goto f3
rem 
rem                       ��������� ᮧ���� �� ���� ��ꥪ�� ����� %1.obj
c:\masm_exe\masm %1,%1,%1;
if errorlevel 1 goto f1
echo                                �⠯ �������樨 �८����� ...
rem 
rem ������� �痢� ᮧ���� �� ��ꥪ⭮�� ����� �ᯮ��塞� 䠩� %1.exe
c:\masm_exe\link %1+c:\masm_exe\ioproc.obj,%1;
rem
rem ��ꥪ�� ����� 㤠�����
del %1.obj
if errorlevel 1 goto f2
rem 
echo �믮������ �ணࠬ�� ��砫���:
%1.exe
echo.
echo �믮������ �ணࠬ�� �����祭�.
goto fin
rem ______________________________________________________________
:f1
echo �訡�� �������樨 !!!
del %1.obj
goto fin
:f2
echo �訡�� ।���஢���� �痢� !
goto fin
:f3
echo ���� � �ணࠬ��� �� �����㦥�. 
echo ��������, � ����⢥ ��ࠬ��� �訡�筮 㪠���� ��� 䠩�� � ���७���.
:fin
echo on
