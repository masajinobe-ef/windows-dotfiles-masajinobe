# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Invoke-Expression (&scoop-search --hook)

oh-my-posh --init --shell pwsh --config 'C:\Users\masa\Documents\PowerShell\1_shell.omp.json' | Invoke-Expression
Import-Module posh-git

Import-Module -Name Terminal-Icons

# PSReadLine
Import-Module PSReadLine
# Use inline prediction view in VSCode to avoid: WARNING: The prediction 'ListView' is temporarily disabled because the current window size of the console is too small. To use the 'ListView', please make sure the 'WindowWidth' is not less than '54' and the 'WindowHeight' is not less than '15'.
if($env:TERM_PROGRAM -eq "vscode") {
   Set-PSReadLineOption -PredictionViewStyle InlineView
}else {
   Set-PSReadLineOption -PredictionViewStyle ListView
}
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+f'

# Alias
Set-Alias c code
Set-Alias n notepad
Set-Alias s scoop
Set-Alias scoof scoop
Set-Alias g git
Set-Alias l ls
Set-Alias grep findstr

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}