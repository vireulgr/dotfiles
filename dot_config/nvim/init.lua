-- winget packages
-- 
-- Docker Desktop                            Docker.DockerDesktop
-- Git                                       Git.Git
-- LLVM                                      LLVM.LLVM
-- App Installer                             Microsoft.AppInstaller
-- Power Automate                            Microsoft.PowerAutomateDesktop_8wekyb3d8b…
-- PowerShell                                Microsoft.PowerShell_8wekyb3d8bbwe
-- PowerToys ImageResizer Context Menu       Microsoft.PowerToys.ImageResizerContextMe…
-- PowerToys PowerRename Context Menu        Microsoft.PowerToys.PowerRenameContextMen…
-- Snipping Tool                             Microsoft.ScreenSketch_8wekyb3d8bbwe
-- Dev Home                                  Microsoft.DevHome
-- Windows Terminal                          Microsoft.WindowsTerminal
-- Windows Package Manager Source (winget)   Microsoft.Winget.Source_8wekyb3d8bbwe
-- Windows Subsystem for Linux               MicrosoftCorporationII.WindowsSubsystemFo…
-- Visual Studio Community 2022              Microsoft.VisualStudio.2022.Community
-- fd                                        sharkdp.fd
-- PowerToys (Preview) x64                   Microsoft.PowerToys
-- Python 3.11.5 (64-bit)                    Python.Python.3.11
-- Node.js                                   {24063EF5-3293-46E8-A8B9-5304740544A7}
-- Python Launcher                           Python.Launcher
-- Windows SDK AddOn                         {342873C0-1C08-4A99-82B6-50D1D2043E5A}
-- Neovim                                    Neovim.Neovim
-- Windows Software Development Kit - Windo… Microsoft.WindowsSDK.10.0.22621
-- CMake                                     Kitware.CMake
-- Windows Subsystem for Linux               {B65C3390-98CD-4624-B0CC-F44416BDF6A3}
-- Microsoft Update Health Tools             {C6FD611E-7EFE-488C-A0E0-974C09EF6473}
-- Windows Subsystem for Linux Update        {F8474A47-8B5D-4466-ACE3-78EAB3BF21A8}
-- Windows Software Development Kit - Windo… Microsoft.WindowsSDK.10.0.2200
--
-- chocolatey packages
--
-- chocolatey 2.2.2
-- chezmoi 2.46.0
-- llvm 17.0.3
-- mingw 13.2.0
-- ripgrep 13.0.0.20220913
--
-- Global NPM packets:
--
-- neovim@4.10.1
-- typescript@4.3.5
-- @angular/language-server@12.2.3
-- typescript-language-server@4.3.1 ???
-- vscode-langservers-extracted@4.8.0

-- Basic
require('core.plugins')
require('core.mappings')
require('core.colors')
require('core.configs')

-- Plugins
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.neotree')
require('plugins.cmp')
require('plugins.telescope')
require('plugins.navic')
require('plugins.lualine')
require('plugins.oil')
require('plugins.snippy')
require('plugins.cd-to-recent')

