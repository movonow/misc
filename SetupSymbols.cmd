REM .symopt-0x100: stop windbg from loading unknowing symbols

SET PATH=%PATH%;"C:\Program Files\Path to Debugging Tools Binaries"
REM Copy all .DLL files
SYMSTORE add /r /f C:\Windows\*.dll /s C:\Symbols /t "Microsoft Windows" /v ""
REM Download symbols for .DLL files
SYMCHK /r C:\Windows\*.dll /s SRV*C:\Symbols*http://msdl.microsoft.com/download/symbols
REM Copy all .EXE files
SYMSTORE add /r /f C:\Windows\*.exe /s C:\Symbols /t "Microsoft Windows" /v ""
REM Download symbols for .EXE files
SYMCHK /r C:\Windows\*.exe /s SRV*C:\Symbols*http://msdn.microsoft.com/download/symbols
