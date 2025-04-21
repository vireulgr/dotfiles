local pathToThisFile = ...
local folderOfThisFile = pathToThisFile:match("(.-)[^%.]+$")
print(vim.inspect(folderOfThisFile))
local config = require(folderOfThisFile .. "config") -- Load configuration

local dirs_data = {}
for _, dir in ipairs(config.predefined_directories) do
  -- Add the predefined directory to the :item[file explorer] UI
  -- ... implementation details ...
  -- Add an event handler to call open_predefined_directory(dir) when selected
  table.insert(dirs_data, dir.name .. ' (' .. dir.path .. ')')
end

local function open_predefined_directory(dir)
  -- Open the directory in the :item[file explorer]
  -- ... implementation details ...
  vim.cmd("cd " .. dir.path)
end


-- Define key mappings for user interaction
vim.api.set_keymap("n", "<C-w>", "<Cmd>lua require('cd-to-recent').handle_selection()<CR>", { noremap = true, silent = true })


-- create buffer, populate with item text, set buffer options
local function display_list(items)

  -- Create a new window
  local winid = vim.api.open_win(0, true, { relative = "editor", width = 20, height = 10 })

  -- Create a buffer for the window's content
  local bufnr = vim.api.create_buf(false, true)
  vim.api.set_current_buf(bufnr)

  -- Populate the buffer with UI content
  vim.api.buf_set_lines(bufnr, 0, -1, true, items)

  -- Set the buffer as the window's buffer
  vim.api.set_current_win(winid)
  vim.api.buf_set_option(bufnr, "modifiable", false)
end

local function handle_selection()
  local selected_index = vim.api.nvim_get_current_line() -- Get selected line
  if selected_index and dirs_data[selected_index] then
    local selected_data = dirs_data[selected_index].path
    -- Process the selected data
    print("Selected item data:", selected_data)
    open_predefined_directory(selected_data)
  else
    print("Invalid selection")
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = { "*" },
  command = function ()
    display_list(dirs_data)
  end
})

