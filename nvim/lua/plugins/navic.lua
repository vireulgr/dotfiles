-- local navic = require("nvim-navic")

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

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
