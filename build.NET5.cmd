@echo off

SET R_HOME=../../../R-sharp/App/net5.0

"%R_HOME%/Rscript.exe" --build /save ./Bing.zip
"%R_HOME%/R#.exe" --install.packages ./Bing.zip

pause