vim.wo.number = true
vim.wo.relativenumber = true

-- pynvim `g:python3_host_prog` is not set.  Searching for python3.11 in the environment.
vim.g.python3_host_prog = 'C:\\Python311\\python.exe'

vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

vim.opt.number = true
vim.opt.signcolumn = 'yes'

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- function tprint (tbl, indent)
--   if not tbl then
--     print('table is nil')
--   end
--   if not indent then indent = 0 end
--   for k, v in pairs(tbl) do
--     formatting = string.rep("  ", indent) .. k .. ": "
--     if type(v) == "table" then
--       print(formatting)
--       tprint(v, indent+1)
--     elseif type(v) == 'boolean' then
--       print(formatting .. tostring(v))      
--     else
--       print(formatting .. v)
--     end
--   end
-- end

-- vim.api.nvim_create_user_command('PrintEditorConfig', function() tprint(vim.b.editorconfig) end, {})

vim.opt.title = true
vim.opt.titlelen = 80
vim.opt.titlestring = 'nvim %{getcwd()}'


-- vim.cmd('cd $XDG_CONFIG_HOME/nvim')

-- POWERSHELL as shell in nvim
if vim.fn.executable('pwsh') == 1 then
  vim.o.shell = 'pwsh'
else
  vim.o.shell = 'powershell'
end

vim.o.shellcmdflag = [[
  -NoLogo
  -ExecutionPolicy RemoteSigned
  -Command
  [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;
]]
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe  = '2>&1 | Tee-Object -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- my custom commands
function ShowGitDiff()
  vim.cmd('tabnew | setf diff | r!git diff')
end
vim.api.nvim_create_user_command('ShowGitDiff', ShowGitDiff, {})

function CopyBufferName()
  local a = vim.fn.escape(vim.fn.expand('%:p'), ' \\')
  vim.fn.setreg('"', a, 'c')
end
vim.api.nvim_create_user_command('CopyBufferName', CopyBufferName, {})

-- Angular
vim.api.nvim_create_user_command('AngularEditHtml', function()
  vim.cmd('tabe ' .. vim.fn.expand('%:p:r') .. '.html')
end, {})

vim.api.nvim_create_user_command('AngularEditTypeScript', function()
  vim.cmd('tabe ' .. vim.fn.expand('%:p:r') .. '.ts')
end, {})

vim.api.nvim_create_user_command('AngularEditCss',        function()
  vim.cmd('tabe ' .. vim.fn.expand('%:p:r') .. '.css')
end, {})

vim.api.nvim_create_user_command('AngularEditScss',       function()
  vim.cmd('tabe ' .. vim.fn.expand('%:p:r') .. '.scss')
end, {})
