# CTX OS PowerShell Profile

# 1. Display CTX Branding
if (Test-Path "/usr/bin/ctx-about") {
    & /usr/bin/ctx-about
}

# 2. CTX OS Custom Aliases
Set-Alias -Name 'ctx-help' -Value '/usr/bin/ctx-help'
Set-Alias -Name 'ctx-dev' -Value '/usr/bin/ctx-dev-setup'
Set-Alias -Name 'grep' -Value 'grep --color=auto'
Set-Alias -Name 'ls' -Value 'ls --color=auto'
Set-Alias -Name 'll' -Value 'ls -la'
Set-Alias -Name 'update' -Value 'sudo ctx-update'

# 3. Prompt Customization (CTX Style)
function prompt {
    $p = Split-Path -Leaf $pwd
    $user = [Environment]::UserName
    Write-Host "[$user@ctxos " -NoNewline -ForegroundColor Cyan
    Write-Host "$p" -NoNewline -ForegroundColor White
    Write-Host "]$ " -NoNewline -ForegroundColor Cyan
    return " "
}

# 4. Environment Variables
$env:EDITOR = 'vim'
$env:CTXOS_VERSION = '1.0.0'
$env:CTXOS_HOME = '/opt/ctxos'

# 5. Module Autoload
$PSModuleAutoLoadingPreference = 'All'

# 6. History Configuration
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
