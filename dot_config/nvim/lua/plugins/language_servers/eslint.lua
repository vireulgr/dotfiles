local M = {
  --handlers = {
  --  ["eslint/confirmESLintExecution"] = function () end,
  --  ["eslint/noLibrary"] = function () end,
  --  ["eslint/openDoc"] = function () end,
  --  ["eslint/probeFailed"] = function () end,
  --},
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
      mode = "location"
    }
  }
}

return M
