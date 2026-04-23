local homeDirectory = vim.env.HOME
local config = {
  predefined_directories = {
    { name = "nvim config root", path = homeDirectory .. "\\.config\\nvim" },
    { name = "Repos root", path = "D:\\repos" },
    { name = "Code root", path = "D:\\code" },
    { name = "Tiny backend", path = "D:\\repos\\tiny-backend" },
    { name = "wgl-engine", path = "D:\\repos\\wgl-engine" },
  }
}
local current_path = vim.fn.expand('%:p')
if string.len(current_path) > 0 and 0 == vim.fn.isdirectory(current_path) then
  table.insert(config.predefined_directories, 1, { name = "Current file directory", path = vim.fs.dirname(current_path) })
end

return config
