echo 'current host current user'

if ($env:PROMPT_FEATURE -eq '') {
  $env:PROMPT_FEATURE = 'PS'
}

function Prompt {
  "[$env:PROMPT_FEATURE] $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))"
}
