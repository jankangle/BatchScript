@echo off
setlocal enabledelayedexpansion
SET path1=Z:\Quality Assurance\QC CONTROL CHARTS\GC Area\GC-RGA Gas Analysis\RGA1
SET path2=Z:\Quality Assurance\QC CONTROL CHARTS\GC Area\GC-RGA Gas Analysis\RGA2
SET path3=Z:\Quality Assurance\QC CONTROL CHARTS\GC Area\GC-FID ASTM D7900 SB Ratio
SET path4=Z:\Quality Assurance\QC CONTROL CHARTS\GC Area\GC-FID Canmet Solvent in Tailings
SET path5=Z:\Quality Assurance\QC CONTROL CHARTS\GC Area\GC Headspace
SET path6=Z:\Quality Assurance\QC CONTROL CHARTS\GC Area\GC-FID Solvent D5134 Phillips

SET /a "Good=0"

echo Remote CC Changers 1.0
echo Jonathan Kung
echo May 22, 2018
echo.

:while1
if %Good% == 0 (
echo Type whats in the brackets to select test. It is not case sensitive
echo. 
echo "(RGA1) (RGA2) (D7900) (Can)met (Head)space (Phil)lips"
echo.

set /P id=Which test?:

)

if /I %id% == RGA1 (
   cd /d %path1%
   CALL :SUB_RGA1
   timeout /t 3
   GOTO :EOF
)
if /I %id% == RGA2 (
   cd /d %path2%
   CALL :SUB_RGA2
   timeout /t 3
   GOTO :EOF
)
if /I %id% == D7900 (
   cd /d %path3%
   CALL :SUB_D7900
   timeout /t 3
   GOTO :EOF
)
if /I %id% == Can (
   cd /d %path4%
   CALL :SUB_CANMET
   timeout /t 3
   GOTO :EOF
)
if /I %id% == Head (
   cd /d %path5%
   CALL :SUB_RGA2
   timeout /t 3
   GOTO :EOF
)
if /I %id% == Phil (
   cd /d %path6%
   CALL :SUB_PHIL
   timeout /t 3
   GOTO :EOF
)

echo.
echo That is not a recognized code. Please try again
goto :while1
GOTO :EOF

:: SUBROUTINES

:SUB_D7900
  set "CC=ASTM D7900 SB Ratio Control Chart.xlsx"
  if exist "Copy of %CC%" (
     echo "%CC% exists"
     if exist "%CC%" (
        del "%CC%"
     )
     TIMEOUT /T 2

     rename "Copy of %CC%" "%CC%"

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
  set RGA1[0]=RGA1 Cylinder D327740 C2 Ethane.xlsx
  set RGA1[1]=RGA1 Cylinder D327740 H2 Hydrogen.xlsx
  set RGA1[2]=RGA1 Cylinder D327740 H2S Hydrogen Sulfide.xlsx
  set RGA1[3]=RGA1 Cylinder D327740 iC5 Iso-pentane.xlsx
  set RGA1[4]=RGA1 Cylinder D327740 N2 Nitrogen.xlsx
  set RGA1[5]=RGA1 Cylinder D327740 nC5 Pentane.xlsx
  
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
  set RGA2[0]=RGA2 Cylinder D327740 C2 Ethane.xlsx
  set RGA2[1]=RGA2 Cylinder D327740 H2 Hydrogen.xlsx
  set RGA2[2]=RGA2 Cylinder D327740 H2S Hydrogen Sulfide.xlsx
  set RGA2[3]=RGA2 Cylinder D327740 iC5 Iso-pentane.xlsx
  set RGA2[4]=RGA2 Cylinder D327740 N2 Nitrogen.xlsx
  set RGA2[5]=RGA2 Cylinder D327740 nC5 Pentane.xlsx
  
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
