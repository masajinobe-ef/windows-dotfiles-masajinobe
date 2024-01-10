# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# scoop-search
Invoke-Expression (&scoop-search --hook)

# oh-my-posh & posh-git
oh-my-posh --init --shell pwsh --config 'C:\Users\masa\Documents\PowerShell\bubbles.omp.json' | Invoke-Expression
Import-Module posh-git

# Icons
Import-Module -Name Terminal-Icons

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+t' 
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f'

# Completion
Import-Module -Name CompletionPredictor

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -BellStyle Visual
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[36;7;238m"}

# Alias
Set-Alias c code
Set-Alias n notepad
Set-Alias s scoop
Set-Alias g git
Set-Alias l ls
Set-Alias grep findstr
Set-Alias lg lazygit

function sy {
    s update
    s status
}

function syu {
    s update
    s status
    s update *
}

function ss {
    $query = scoop-search | fzf --query="$args"
    scoop-search $query
}

function live {
    live-server --port=5500
}

# Use inline prediction view in VSCode to avoid: WARNING: The prediction 'ListView' is temporarily disabled because the current window size of the console is too small. To use the 'ListView', please make sure the 'WindowWidth' is not less than '54' and the 'WindowHeight' is not less than '15'.
if($env:TERM_PROGRAM -eq "vscode") {
    Set-PSReadLineOption -PredictionViewStyle InlineView
 }