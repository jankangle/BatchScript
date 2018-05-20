@echo off
setlocal enabledelayedexpansion

CALL :SUB_CHECK


TIMEOUT /T 3

GOTO :EOF


:SUB_CHECK
  for %%i in (*) do (
    echo %%i|find "D7900" >nul
    if errorlevel 1 (
        call
    ) else (
        CALL :SUB_D7900 
        GOTO:EOF
    )
    echo %%i|find "Canmet" >nul
    if errorlevel 1 (
        call
    ) else (
        CALL :SUB_CANMET
        GOTO:EOF
    )
    echo %%i|find "Headspace" >nul
    if errorlevel 1 (
        CALL
    ) else (
        CALL :SUB_HEAD 
        GOTO:EOF
    )
    echo %%i|find "D5134" >nul
    if errorlevel 1 (
        CALL
    ) else (
        CALL :SUB_PHIL
        GOTO:EOF
    )
    echo %%i|find "RGA1" >nul
    if errorlevel 1 (
        CALL
    ) else (
        echo "RGA1 found"
        CALL :SUB_RGA1
	echo "RGA1 Done!"
        GOTO:EOF
    )
    echo %%i|find "RGA2" >nul
    if errorlevel 1 (
        CALL
    ) else (
        echo "RGA2 found"
        CALL :SUB_RGA2
	echo "RGA2 Done!"
        GOTO:EOF
    )
  )






:SUB_D7900
  set "CC=ASTM D7900 SB Ratio Control Chart.xlsx"
  if exist "Copy of %CC%" (
     echo "%CC% exists"
     if exist "%CC%" (
        del "%CC%"
     )
     TIMEOUT /T 2

     rename "Copy of %CC%" "%CC%"

     echo "Process Complete!"
) else (
     echo "Copy of %CC% Doesn't exists"
)
  EXIT /B


:SUB_CANMET
  set "CC=GCFID3 Canmet Control Chart.xlsx"
  if exist "Copy of %CC%" (
     echo "%CC% exists"
     if exist "%CC%" (
        del "%CC%"
     )
     TIMEOUT /T 2

     rename "Copy of %CC%" "%CC%"

     echo "Process Complete!"
) else (
     echo "Copy of %CC% Doesn't exists"
)
  EXIT /B


:SUB_HEAD
  set "CC=GC Headspace Control Chart.xlsx"
  if exist "Copy of %CC%" (
     echo "%CC% exists"
     if exist "%CC%" (
        del "%CC%"
     )
     TIMEOUT /T 2

     rename "Copy of %CC%" "%CC%"

     echo "Process Complete!"
) else (
     echo "Copy of %CC% Doesn't exists"
)
  EXIT /B


:SUB_PHIL
  set phil[0]=GC-FID2 Solvent D5134 Phillips iC5 ISOPENTANE.xlsx
  set phil[1]=GC-FID2 Solvent D5134 Phillips nC5 nPENTANE.xlsx
  for /l %%n in (0,1,1) do (
    if exist "Copy of !phil[%%n]!" (
       if exist "!phil[%%n]!" (
          del "!phil[%%n]!"
       )

       rename "Copy of !phil[%%n]!" "!phil[%%n]!"

    ) else (
       echo "Copy !phil[%%n]! Doesn't exists"
    )
  )
  EXIT /B


:SUB_RGA1
  set RGA1[0]=RGA1 Control Chart C2 Ethane.xlsx
  set RGA1[1]=RGA1 Control Chart H2 Hydrogen.xlsx
  set RGA1[2]=RGA1 Control Chart H2S Hydrogen Sulfide.xlsx
  set RGA1[3]=RGA1 Control Chart iC5 Iso-pentane.xlsx
  set RGA1[4]=RGA1 Control Chart N2 Nitrogen.xlsx
  set RGA1[5]=RGA1 Control Chart nC5 Pentane.xlsx
  
  for /l %%n in (0,1,5) do (
    if exist "Copy of !RGA1[%%n]!" (
       if exist "!RGA1[%%n]!" (
          del "!RGA1[%%n]!"
       )
       rename "Copy of !RGA1[%%n]!" "!RGA1[%%n]!"

    ) else (
       echo "Copy of !RGA1[%%n]! Doesn't exists"
    )
  )
  EXIT /B

:SUB_RGA2
  set RGA2[0]=RGA2 Control Chart C2 Ethane.xlsx
  set RGA2[1]=RGA2 Control Chart H2 Hydrogen.xlsx
  set RGA2[2]=RGA2 Control Chart H2S Hydrogen Sulfide.xlsx
  set RGA2[3]=RGA2 Control Chart iC5 Iso-pentane.xlsx
  set RGA2[4]=RGA2 Control Chart N2 Nitrogen.xlsx
  set RGA2[5]=RGA2 Control Chart nC5 Pentane.xlsx
  
  for /l %%n in (0,1,5) do (
    if exist "Copy of !RGA2[%%n]!" (
       if exist "!RGA2[%%n]!" (
          del "!RGA2[%%n]!"
       )
       rename "Copy of !RGA2[%%n]!" "!RGA2[%%n]!"

    ) else (
       echo "Copy of !RGA2[%%n]! Doesn't exists"
    )
  )
  EXIT /B

:EOF
