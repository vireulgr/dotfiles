
local M = {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100,
          indentSize = 2
        }
      }
    }
  }
}

return M
