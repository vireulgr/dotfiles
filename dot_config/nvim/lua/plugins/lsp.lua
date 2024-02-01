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
lspconfig.pylsp.setup {
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
  },
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- JSON
lspconfig.jsonls.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  capabilities  = capabilities,
}

-- LUA (download from https://github.com/LuaLS/lua-language-server)
lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  capabilities  = capabilities,
}

-- ANGULAR
-- error may occure in 
-- C:\\Users\\Username\\Appdata\\Local\\npm\\node_modules\\@angular\\language-server\\index.js
local globalNpmRoot = 'C:\\Users\\Username\\AppData\\Roaming\\npm'
local angularLsLocation = globalNpmRoot .. '\\node_modules\\@angular\\language-server\\'
local tsLocation        = globalNpmRoot .. '\\node_modules\\typescript\\'
local cmd = {"ngserver", "--stdio", "--tsProbeLocations", tsLocation, "--ngProbeLocations", angularLsLocation}

lspconfig.angularls.setup {
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
  --on_attach = function(client, bufnr)
  --  navic.attach(client, bufnr)
  --end,
  capabilities = capabilities,
}


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
