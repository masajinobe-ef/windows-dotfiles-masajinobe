# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# scoop-search
Invoke-Expression (&scoop-search --hook)

# oh-my-posh & posh-git
oh-my-posh --init --shell pwsh --config 'C:\Users\masa\Documents\PowerShell\bubbles.omp.json' | Invoke-Expression
Import-Module posh-git

# Icons
Import-Module -Name Terminal-Icons

# Alias
Set-Alias c code
Set-Alias n notepad
Set-Alias s scoop
Set-Alias scoof scoop
Set-Alias g git
Set-Alias l ls
Set-Alias grep findstr
Set-Alias lg lazygit

function sy {
    scoop update
    scoop status
}

function syu {
    scoop update
    scoop status
    scoop update *
}

function live {
    live-server --port=5500 --no-browser
}

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# Use inline prediction view in VSCode to avoid: WARNING: The prediction 'ListView' is temporarily disabled because the current window size of the console is too small. To use the 'ListView', please make sure the 'WindowWidth' is not less than '54' and the 'WindowHeight' is not less than '15'.
if($env:TERM_PROGRAM -eq "vscode") {
    Set-PSReadLineOption -PredictionViewStyle InlineView
 }else {
    Set-PSReadLineOption -PredictionViewStyle ListView
 }

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+f'

cls