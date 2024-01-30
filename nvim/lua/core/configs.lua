vim.wo.number = true
vim.wo.relativenumber = true

vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

vim.opt.number = true
vim.opt.signcolumn = 'yes'

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

vim.api.nvim_create_user_command('OpenGitDiff', function() vim.cmd('tabnew | setf diff | r!git diff') end, {})
vim.api.nvim_create_user_command('CopyBufferName', function() vim.fn.setreg('"', vim.fn.expand('%:p'), 'c') end, {})

vim.api.nvim_create_user_command('AngularEditHtml',       function() vim.cmd('tabe ' .. vim.fn.expand('%:p:r') .. '.html') end, {})
vim.api.nvim_create_user_command('AngularEditTypeScript', function() vim.cmd('tabe ' .. vim.fn.expand('%:p:r') .. '.ts') end, {})
vim.api.nvim_create_user_command('AngularEditCss',        function() vim.cmd('tabe ' .. vim.fn.expand('%:p:r') .. '.css') end, {})
vim.api.nvim_create_user_command('AngularEditScss',       function() vim.cmd('tabe ' .. vim.fn.expand('%:p:r') .. '.scss') end, {})

vim.cmd('cd $XDG_CONFIG_HOME/nvim')

vim.opt.title = true
vim.opt.titlelen = 80
vim.opt.titlestring = 'nvim %{getcwd()}'
