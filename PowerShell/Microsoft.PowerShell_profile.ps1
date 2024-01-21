# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# scoop-search
Invoke-Expression (&scoop-search --hook)

# oh-my-posh & posh-git
$profileDirectory = (Get-Item $PROFILE).Directory.FullName
$relativeConfigPath = Join-Path $profileDirectory "jandedobbeleer.omp.json"
oh-my-posh --init --shell pwsh --config $relativeConfigPath | Invoke-Expression
Import-Module posh-git

# Icons
Import-Module -Name Terminal-Icons

# Completion
Import-Module -Name CompletionPredictor

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -BellStyle Visual
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -key Enter -Function ValidateAndAcceptLine
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[36;7;238m"}

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+t' 
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f'

# Alias
Set-Alias c code
Set-Alias n notepad
Set-Alias s scoop
Set-Alias g git
Set-Alias l ls
Set-Alias grep findstr
Set-Alias lg lazygit

# Use inline prediction view in VSCode to avoid: 
# WARNING: The prediction 'ListView' is temporarily disabled because the current window size of the console is too small. 
# To use the 'ListView', please make sure the 'WindowWidth' is not less than '54' and the 'WindowHeight' is not less than '15'.
if($env:TERM_PROGRAM -eq "vscode") {
    Set-PSReadLineOption -PredictionViewStyle InlineView
 }

# scoop update
function sy {
    s update
    s status
}

# scoop update *
function su {
    s update *
    s status
}

# scoop sync packages and update
function syu {
    s update
    s status
    s update *
}

# live-server
function live {
    live-server --port=5500
}

clear