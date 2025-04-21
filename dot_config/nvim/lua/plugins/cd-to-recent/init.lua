local pathToThisFile = ...
-- local folderOfThisFile = pathToThisFile:match('(.-)[^%.]+$')
-- print(vim.inspect(folderOfThisFile))
local config = require(pathToThisFile .. '.config') -- Load configuration

local plugin_win_id = 0
local plugin_buf_id = 0
local recents_text = {}

for _, dir in ipairs(config.predefined_directories) do
  table.insert(recents_text, dir.name .. ' (' .. dir.path .. ')')
end

local function handle_close()
  vim.api.nvim_buf_delete(plugin_buf_id, {})
  -- vim.api.nvim_redraw({});
  vim.cmd.redraw();
end

local function open_predefined_directory(dir)
  vim.api.nvim_set_current_dir(dir.path)
  handle_close()
end

local function handle_selection()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  if cursor_pos[1] and config.predefined_directories[cursor_pos[1]] then
    local selected_data = config.predefined_directories[cursor_pos[1]]
    open_predefined_directory(selected_data)
  else
    print('Invalid selection')
  end
end

-- create buffer, populate with item text, set buffer options
local function display_list()

  local window_id = vim.api.nvim_get_current_win(); -- outmost window id
  local window_info = vim.fn.getwininfo(window_id)[1]
  local list_width = window_info.width - window_info.textoff
  local list_height = #(config.predefined_directories)

  local window_options = {
    relative = 'editor',
    row = 0,
    col = 0,
    width = list_width,
    height = list_height,
    style = 'minimal',
    title = ' Select directory to cd (q to close) ',
    title_pos = 'left',
    border = { '╔', '═' ,'╗', '║', '╝', '═', '╚', '║' }
  }

  -- Create a new window
  plugin_win_id = vim.api.nvim_open_win(0, true, window_options)

  -- Create a buffer for the window's content
  plugin_buf_id = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(plugin_buf_id)

  -- Populate the buffer with UI content
  vim.api.nvim_buf_set_lines(plugin_buf_id, 0, -1, true, recents_text)

  -- Set the buffer as the window's buffer
  vim.api.nvim_set_current_win(plugin_win_id)
  vim.api.nvim_buf_set_option(plugin_buf_id, 'modifiable', false)

-- Define key mappings for user interaction
  vim.keymap.set('n', '<CR>', handle_selection, { buffer = true, noremap = true, silent = true })
  vim.keymap.set('n', 'q', handle_close, { buffer = true, noremap = true, silent = true })
end


vim.api.nvim_create_autocmd('VimEnter', {
  pattern = { '*' },
  callback = display_list
})

vim.api.nvim_create_user_command('CdToRecent', display_list, {})
