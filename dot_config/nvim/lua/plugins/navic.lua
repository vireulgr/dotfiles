local navic = require('nvim-navic')

-- lspconfig = require("lspconfig")
-- 
-- lspconfig.clangd.setup {
--   on_attach = function(client, bufnr)
--     navic.attach(client, bufnr)
--   end
-- }

-- configured in lsp.lua
-- lspconfig.pylsp.setup {
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 100
--         }
--       }
--     }
--   },
--   on_attach = function(client, bufnr)
--     navic.attach(client, bufnr)
--   end,
-- }

navic.setup {
  icons = {
    File          = "󰈙 ",
    Module        = " ",
    Namespace     = "󰌗 ",
    Package       = " ",
    Class         = "󰌗 ",
    Method        = "󰆧 ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "󰕘",
    Interface     = "󰕘",
    Function      = "󰊕 ",
    Variable      = "󰆧 ",
    Constant      = "󰏿 ",
    String        = "󰀬 ",
    Number        = "󰎠 ",
    Boolean       = "◩ ",
    Array         = "󰅪 ",
    Object        = "󰅩 ",
    Key           = "󰌋 ",
    Null          = "󰟢 ",
    EnumMember    = " ",
    Struct        = "󰌗 ",
    Event         = " ",
    Operator      = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  lsp = {
    auto_attach = false,
    preference = nil,
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
  lazy_update_context = false,
  click = false,
  format_text = function(text)
    return text
  end,
}

-- vim.o.winbar = "󰈙 %F:%{%v:lua.require'nvim-navic'.get_location()%}"
