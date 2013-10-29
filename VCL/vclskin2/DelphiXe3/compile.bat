SET OLDPATH=%PATH%
CD %1
path=c:\Program Files\Embarcadero\RAD Studio\7.0\bin
dcc32.exe /B winSkinD2010.dpk -$H-,W-
del dcc32.cfg
SET Path=%OLDPATH%
