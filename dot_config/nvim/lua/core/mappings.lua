vim.g.mapleader = " "

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
-- vim.keymap.set('n', '<C-w>at', ':Neotree float git_status<CR>')

-- vim.cmd([[
--   imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
--   imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
--   smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
--   smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
--   xmap <Tab> <Plug>(snippy-cut-text)- xmap <Tab> <Plug>(snippy-cut-text)
-- ]])


-- Navigation
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
-- vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Splits
-- vim.keymap.set('n', '|', ':vsplit<CR>')
-- vim.keymap.set('n', '\\', ':split<CR>')

-- Other
-- vim.keymap.set('n', '<leader>w', ':w<CR>')
-- vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
-- vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
-- vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>')
-- vim.keymap.set('i', 'jj', '<Esc>')
-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs
-- vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
-- vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')

-- Terminal
-- vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
-- vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')
-- vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>')
