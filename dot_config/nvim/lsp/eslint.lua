local M = {
  handlers = {
    ["eslint/confirmESLintExecution"] = function () vim.prent('eslint confirmESLintExecution'); end,
    ["eslint/noLibrary"] = function () vim.prent('eslint noLibrary'); end,
    ["eslint/openDoc"] = function () vim.prent('eslint openDoc'); end,
    ["eslint/probeFailed"] = function () vim.prent('eslint probeFailed'); end,
  },
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = false,
      mode = "all"
    },
    experimental = {
      useFlatConfig = false
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    problems = {
      shortenToSingleLine = false
    },
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "auto"
    }
  }
}

return M
