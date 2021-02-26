set gitdir=%cd%
set latexdir=C:\Users\msko\AppData\Local\Programs\MiKTeX 2.9\miktex\bin\x64\
set filter="%1%"
echo %1%

if "%1%"=="" (set filter=*.tex)

echo %filter%
rem pause
for %%f in (%filter%) do (
    echo %%~nf
    cd %latexdir%
    "%latexdir%\pdflatex.exe" -output-directory %gitdir% %gitdir%\%%~nf.tex
    cd %gitdir%
)

for %%f in (*.aux) do (del %%~nf.aux)
for %%f in (*.log) do (del %%~nf.log)


rem pause