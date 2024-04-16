-- pynvim `g:python3_host_prog` is not set.  Searching for python3.11 in the environment.
vim.g.python3_host_prog = 'C:\\Python311\\python.exe'

vim.opt.fileformat = 'unix'
vim.opt.fileencodings = {'utf-8', 'cp1251', 'iso-8859-5', 'latin1'}

vim.g.formatoptions = 'qrn1'
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

vim.opt.showmode = false
vim.opt.virtualedit = 'block'
vim.opt.undofile = true
vim.opt.scrolloff = 2
vim.wo.linebreak = true
vim.opt.updatetime = 1000

-- Mouse
vim.opt.mouse = 'a'
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Shorter messages
vim.opt.shortmess:append('c')

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Fillchars
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

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
  vim.cmd('tabnew | setf diff | file git_diff | r!git diff')
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


vim.api.nvim_create_user_command('QuoteLikeJSON', function()

  local sel_start = vim.fn.getpos("'<")
  local sel_end = vim.fn.getpos("'>")
  local start_line = sel_start[2] - 1
  -- local start_col = sel_start[3] - 1
  local end_line = sel_end[2]
  -- local end_col = sel_end[3]

  local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

  local result = {}
  for _, v in ipairs(lines) do
    table.insert(result, vim.fn.substitute(v, '\\(\\<\\w\\+\\>\\):', '"\\1":', 'g'))
  end

  vim.api.nvim_buf_set_lines(0, start_line, end_line, false, result);

end, {})
