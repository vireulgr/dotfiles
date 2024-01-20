local vsenv = {}
function vsenv.setVS22Env() 
  ENV_PATH = [[
C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.37.32822/bin/HostX64/x64;C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/IDE/VC/VCPackages;C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/IDE/CommonExtensions/Microsoft/TestWindow;C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/IDE/CommonExtensions/Microsoft/TeamFoundation/Team Explorer;C:/Program Files/Microsoft Visual Studio/2022/Community/MSBuild/Current/bin/Roslyn;C:/Program Files/Microsoft Visual Studio/2022/Community/Team Tools/Performance Tools/x64;C:/Program Files/Microsoft Visual Studio/2022/Community/Team Tools/Performance Tools;C:/Program Files (x86)/HTML Help Workshop;C:/Program Files (x86)/Windows Kits/10/bin/10.0.22621.0//x64;C:/Program Files (x86)/Windows Kits/10/bin//x64;C:/Program Files/Microsoft Visual Studio/2022/Community//MSBuild/Current/Bin/amd64;C:/Windows/Microsoft.NET/Framework64/v4.0.30319;C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/IDE/;C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/Tools/;C:/Program Files/WindowsApps/Microsoft.WindowsTerminal_1.12.10983.0_x64__8wekyb3d8bbwe;C:/Python311/Scripts/;C:/Python311/;C:/Program Files (x86)/VMware/VMware Workstation/bin/;C:/Windows/system32;C:/Windows;C:/Windows/System32/Wbem;C:/Windows/System32/WindowsPowerShell/v1.0/;C:/Windows/System32/OpenSSH/;C:/Program Files/Docker/Docker/resources/bin;C:/Program Files/PowerShell/7/;C:/Program Files/Git/cmd;C:/Program Files (x86)/Windows Kits/10/Windows Performance Toolkit/;C:/Program Files/nodejs/;C:/ProgramData/chocolatey/bin;C:/Program Files/CMake/bin;C:/Users/Username/AppData/Local/Microsoft/WindowsApps;C:/Program Files/Neovim/bin;C:/Users/Username/AppData/Roaming/npm;C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/bin;C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/Ninja;C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/IDE/VC/Linux/bin/ConnectionManagerExe;C:/Program Files/Microsoft Visual Studio/2022/Community/VC/vcpkg;C:/Program Files/Neovim/bin;C:/Program Files/Neovim/bin
]]

  ENV_INCLUDE = [[
C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.37.32822/include;C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.37.32822/ATLMFC/include;C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/VS/include;C:/Program Files (x86)/Windows Kits/10/include/10.0.22621.0/ucrt;C:/Program Files (x86)/Windows Kits/10//include/10.0.22621.0//um;C:/Program Files (x86)/Windows Kits/10//include/10.0.22621.0//shared;C:/Program Files (x86)/Windows Kits/10//include/10.0.22621.0//winrt;C:/Program Files (x86)/Windows Kits/10//include/10.0.22621.0//cppwinrt
]]

  ENV_LIB = [[
C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.37.32822/ATLMFC/lib/x64;C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.37.32822/lib/x64;C:/Program Files (x86)/Windows Kits/10/lib/10.0.22621.0/ucrt/x64;C:/Program Files (x86)/Windows Kits/10//lib/10.0.22621.0//um/x64 
]]

	vim.fn.setenv("PATH", ENV_PATH)
	vim.fn.setenv("INCLUDE", ENV_INCLUDE)
	vim.fn.setenv("LIB", ENV_LIB)
end

return vsenv
