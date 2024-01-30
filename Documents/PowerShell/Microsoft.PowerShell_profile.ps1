if ([String]::IsNullOrEmpty($env:PROMPT_FEATURE)) {
  $env:PROMPT_FEATURE = 'PS'
}

function Prompt {
  "[$env:PROMPT_FEATURE] $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))"
}
