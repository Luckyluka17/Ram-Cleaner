@echo off
echo X=MsgBox("La version de RAM Cleaner est a jour (version 1.0)",0+64,"Ram Cleaner") >info.vbs
start info.vbs
title Ram Cleaner
goto :CHECKPERMISSION
:CHECKPERMISSION
    echo Veuillez patienter, demarrage...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto :start
    ) else (
        echo Le logiciel doit etre execute en administrateur
        echo [%time% / %date%] Erreur : Le logiciel lance par l'utilisateur %username% a été désactivé en raison de permissions d'administration >>logfile.txt
        pause
        exit
    )

    pause >nul
:start
echo Pour commencer a nettoyer, veuillez appuyer sur une touche
pause >nul
echo Analyse du système en cours...
tree >nul
echo Anlyse effectue !
echo [%time% / %date%] Analyse effectue du systeme >>logfile.txt
timeout 02 /nobreak >nul
cls
dir /s
echo [%time% / %date%] Nettoyage effectue >>logfile.txt
echo Nettoyage terminé !
pause
exit
