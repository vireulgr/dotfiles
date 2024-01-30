require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
        ['<C-t>'] = 'select_tab',
        ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
      },
      n = {
        ['<C-t>'] = 'select_tab',
      },
    },
    preview = {
      hide_on_startup = true -- hide
    }
  },
  pickers = {},
  extensions = {}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
