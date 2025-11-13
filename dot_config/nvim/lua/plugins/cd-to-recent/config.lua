local homeDirectory = vim.env.HOME
local config = {
  predefined_directories = {
    { name = "nvim config root", path = homeDirectory .. "\\.config\\nvim" },
  }
}
local current_path = vim.fn.expand('%:p')
if 0 == vim.fn.isdirectory(current_path) then
  table.insert(config.predefined_directories, 1, { name = "Current file directory", path = vim.fs.dirname(current_path) })
end

return config
