local navic = require('nvim-navic')
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.snippetSupport = true
-- node:utils -> utils
-- C:\\Users\\<Username>\\AppData\\Roaming\\npm\\node_modules\\vscode-langservers-extracted\\node_modules\\vscode-languageserver\\lib\\node\\main.js

-- Setup language servers.

-- TSSERVER
lspconfig.tsserver.setup {
--  handlers = {
--    -- not working???
--    ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
--      if params.diagnostics ~= nil then
--        local idx = 1
--        while idx <= #params.diagnostics do
--          if params.diagnostics[idx].code == 80001 then
--            table.remove(params.diagnostics, idx)
--          else
--            idx = idx + 1
--          end
--        end
--      end
--      vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
--    end,
--  },
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- CSS
lspconfig.cssls.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- HTML
lspconfig.html.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- PYTHON
do
  local pythonLsOptions = require('plugins.language_servers.pylsp')
  pythonLsOptions['on_attach'] = function(client, bufnr) navic.attach(client, bufnr) end
  pythonLsOptions['capabilities'] = capabilities
  lspconfig.pylsp.setup(pythonLsOptions)
end

-- JSON
lspconfig.jsonls.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  capabilities  = capabilities,
}

-- LUA (download from https://github.com/LuaLS/lua-language-server)
do
  local luaLsOptions = require('plugins.language_servers.luals')
  luaLsOptions['on_attach'] = function(client, bufnr) navic.attach(client, bufnr) end
  luaLsOptions['capabilities'] = capabilities

  lspconfig.lua_ls.setup(luaLsOptions)
end


-- ANGULAR
-- error may occure in 
-- C:\\Users\\Username\\Appdata\\Local\\npm\\node_modules\\@angular\\language-server\\index.js
do
  local angularLsOptions = require('plugins.language_servers.angularls')
  angularLsOptions['capabilities'] = capabilities;
  lspconfig.angularls.setup(angularLsOptions)
end

-- ESLINT
do
  local eslintOptions = require('plugins.language_servers.eslint')
  eslintOptions['capabilities'] = capabilities
  --eslintOptions['on_attach'] = function(client, bufnr)
  --    navic.attach(client, bufnr)
  --    vim.api.nvim_create_autocmd("BufWritePre", {
  --      buffer = bufnr,
  --      command = "EslintFixAll",
  --    })
  --  end
  lspconfig.eslint.setup(eslintOptions)
end



-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = {buffer = ev.buf}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
-- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder, opts)
-- vim.keymap.set('n', '<Leader>sl', function() 
--      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--    end, opts)
-- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'v'}, '<Leader>la', vim.lsp.buf.code_action, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format {async = true} end, opts)
  end
})
