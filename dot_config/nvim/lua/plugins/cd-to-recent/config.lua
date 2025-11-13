local homeDirectory = vim.env.HOME
return {
  predefined_directories = {
    { name = "Current file directory", path = vim.fn.expand('%:p:h') },
    { name = "nvim config root", path = homeDirectory .. "/.config/nvim" },
  }
}

