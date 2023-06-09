import os
import sys
import win32file

script_path = "sqf_filter.py"

if sys.platform == "win32":
    file_handle = win32file.Open(script_path, win32file.FILE_ATTRIBUTE_NORMAL)
    win32file.SetFileTime(file_handle, 0, 0, 0)
    win32file.CloseHandle(file_handle)
