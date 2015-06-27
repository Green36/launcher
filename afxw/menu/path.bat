@echo off

FOR /F  %%A in ( 'C:\cygwin\bin\cygpath.exe %1' ) DO @set CopyStr=%%A
SET /P<NUL=%CopyStr%|clip

