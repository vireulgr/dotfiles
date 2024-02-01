local navic = require('nvim-navic')

require('lualine').setup {

  options = {
    icons_enabled = true,
    -- theme = 'auto',
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {
    lualine_a = {
      {
        function()
          return vim.fn.getcwd()
        end,
      }
    },
    lualine_c = {
      {
        function()
          return navic.get_location()
        end,
      },
    },
    lualine_y = {
      {
        function()
          return ''
        end,
        cond = function()
          return true == (vim.b.editorconfig ~= nil
            and next(vim.b.editorconfig) ~= nil)
            or (vim.g.editorconfig ~= nil
            and next(vim.g.editorconfig) ~= nil)
        end
      }
    },
    lualine_z = {
      {
        'datetime',
        style = '%H:%M'
      },
    },
  },
  inactive_winbar = {},
  extensions = {}
}
