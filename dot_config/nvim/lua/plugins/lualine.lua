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
    lualine_a = {
      --{
      --  'mode',
      --  fmt = function(str) return str:sub(1,1) end
      --},
    },
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
  tabline = {
    lualine_a = {
      {
        function()
          return vim.fn.getcwd()
        end,
      }
    },
    lualine_b = {
      --  {
      --    'buffers',
      --    show_filename_only = true,   -- Shows shortened relative path when set to false.
      --    hide_filename_extension = false,   -- Hide filename extension when set to true.
      --    show_modified_status = true, -- Shows indicator when the buffer is modified.

      --    mode = 4, -- 0: Shows buffer name
      --              -- 1: Shows buffer index
      --              -- 2: Shows buffer name + buffer index
      --              -- 3: Shows buffer number
      --              -- 4: Shows buffer name + buffer number

      --    max_length = (vim.o.columns * 2 / 3), -- Maximum width of buffers component,
      --                                          -- it can also be a function that returns
      --                                          -- the value of `max_length` dynamically.
      --    filetype_names = {
      --      TelescopePrompt = 'Telescope',
      --      dashboard = 'Dashboard',
      --      packer = 'Packer',
      --      fzf = 'FZF',
      --      alpha = 'Alpha'
      --    },        -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

      --    -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
      --    use_mode_colors = false,

      --    --buffers_color = {
      --      -- Same values as the general color option can be used here.
      --      --active = 'lualine_{section}_normal',     -- Color for active buffer.
      --      --inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
      --    --},

      --    symbols = {
      --      modified = ' ●',      -- Text to show when the buffer is modified
      --      alternate_file = '#', -- Text to show to identify the alternate file
      --      directory =  '',     -- Text to show when the buffer is a directory
      --    },
      --  },
      {
        'tabs',
        tab_max_length = 40,  -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
        max_length = vim.o.columns, -- Maximum width of tabs component.
        -- Note:
        -- It can also be a function that returns
        -- the value of `max_length` dynamically.
        mode = 0, -- 0: Shows tab_nr
        -- 1: Shows tab_name
        -- 2: Shows tab_nr + tab_name

        path = 3, -- 0: just shows the filename
        -- 1: shows the relative path and shorten $HOME to ~
        -- 2: shows the full path
        -- 3: shows the full path and shorten $HOME to ~

        -- Automatically updates active tab color to match color of other components (will be overidden if buffers_color is set)
        use_mode_colors = false,

        tabs_color = {
          -- Same values as the general color option can be used here.
          active = 'lualine_b_normal',     -- Color for active tab.
          inactive = 'lualine_b_inactive', -- Color for inactive tab.
        },

        show_modified_status = true,  -- Shows a symbol next to the tab name if the file has been modified.
        symbols = {
          modified = '󰆕',  -- Text to show when the file is modified.
        },

        fmt = function(name, context)
          -- Show + if buffer is modified in tab
          local buflist = vim.fn.tabpagebuflist(context.tabnr)
          local winnr = vim.fn.tabpagewinnr(context.tabnr)
          local bufnr = buflist[winnr]
          local mod = vim.fn.getbufvar(bufnr, '&mod')

          return name .. (mod == 1 and ' +' or '')
        end
      }
    },
  },
  winbar = {
    lualine_a = {
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
