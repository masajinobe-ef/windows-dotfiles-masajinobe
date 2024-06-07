# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# scoop-search
Invoke-Expression (&scoop-search --hook)

# oh-my-posh & posh-git
$profileDirectory = (Get-Item $PROFILE).Directory.FullName
$relativeConfigPath = Join-Path $profileDirectory "space.omp.json"
oh-my-posh --init --shell pwsh --config $relativeConfigPath | Invoke-Expression
Import-Module posh-git

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
Set-Alias -Name c -Value code
Set-Alias -Name n -Value notepad
Set-Alias -Name s -Value scoop
Set-Alias -Name g -Value git
Set-Alias -Name l -Value ls
Set-Alias -Name grep -Value findstr
Set-Alias -Name lg -Value lazygit

# Functions
Set-Alias -Name ls -Value ezafunc
function ezafunc { 
    eza --long --header --tree --icons=always --hyperlink --all --level=1 --group-directories-first --time-style '+%d-%m-%Y %H:%M' --no-permissions
 }

# FZF
Set-Alias -Name fzf -Value fzffunc
function fzffunc { fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' }

# VSCODE
if($env:TERM_PROGRAM -eq "vscode") {
    Set-PSReadLineOption -PredictionViewStyle InlineView
 }

clear