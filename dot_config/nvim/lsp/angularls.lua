-- error may occure in 
-- C:\\Users\\Username\\Appdata\\Local\\npm\\node_modules\\@angular\\language-server\\index.js
local globalNpmRoot = 'C:\\Users\\Username\\AppData\\Roaming\\npm'
local angularLsLocation = globalNpmRoot .. '\\node_modules\\@angular\\language-server\\'
local tsLocation        = globalNpmRoot .. '\\node_modules\\typescript\\'
local cmd = {"ngserver", "--stdio", "--tsProbeLocations", tsLocation, "--ngProbeLocations", angularLsLocation}

local M = {
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
}


return M
