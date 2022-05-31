@echo off
cls
title Fix para compartilhamento de impressoras no Windows
color 3F
echo ============================================================================            
echo   FIX correcao de erros 0x00000709 , 0x0000007c e 0x0000011b do Windows
echo -
echo  ** OBS: O Windows vai ser reiniciado em 10 segundos para aplicar a correcao **
echo =
echo ===
echo IMPORTANTE: Fix somente aplicado se EXECUTAR COMO ADMINISTRADOR
echo ===
echo =
echo ============================================================================
echo              ** ERROS 0x00000709 e 0x0000007c **
echo   1. Windows 10 versoes 2004, 20H2, 21H1 e 21H2           			 
echo   2. Windows 10 versao 1909                  			
echo   3. Windows 10 versao 1809 e para o Windows Server 2019
echo ============================================================================
echo ============================================================================
echo                     ** ERRO 0x0000011b **
echo   4. Correcao para 'O Windows nao pode se conectar a impressora'                                        
echo ============================================================================
set /p op= Escolha uma opcao entre 1 a 4 e tecle ENTER:
echo ==============================
if %op% equ 1 goto opcao1
if %op% equ 2 goto opcao2
if %op% equ 3 goto opcao3
if %op% equ 4 goto opcao4


:opcao1
cls
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides" /v "713073804" /t REG_DWORD /d 0
@shutdown -r -t 10


:opcao2
cls
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides" /v "1921033356" /t REG_DWORD /d 0
@shutdown -r -t 10


:opcao3
cls
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides" /v "3598754956" /t REG_DWORD /d 0
@shutdown -r -t 10


:opcao4
cls
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /t REG_DWORD /d 0
@shutdown -r -t 10