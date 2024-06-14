### General ###

# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# set InlineView for vscode
if($env:TERM_PROGRAM -eq "vscode") {
    Set-PSReadLineOption -PredictionViewStyle InlineView
 }


### Modules ###
Import-Module -Name CompletionPredictor # completion
Import-Module posh-git # posh-git
Invoke-Expression (&scoop-search --hook) # scoop-search
Invoke-Expression (& { (zoxide init powershell | Out-String) }) # Z jumper (zoxide)

# oh-my-posh 
$profileDirectory = (Get-Item $PROFILE).Directory.FullName
$relativeConfigPath = Join-Path $profileDirectory "space.omp.json"
oh-my-posh --init --shell pwsh --config $relativeConfigPath | Invoke-Expression

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption      -EditMode Emacs
Set-PSReadLineOption      -HistorySearchCursorMovesToEnd
Set-PSReadLineOption      -ShowToolTips
Set-PSReadLineOption      -BellStyle Visual
Set-PSReadLineOption      -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption      -PredictionSource HistoryAndPlugin
Set-PSReadLineOption      -PredictionViewStyle ListView
Set-PSReadLineOption      -Colors @{ InlinePrediction = "$([char]0x1b)[36;7;238m"}
Set-PSReadLineKeyHandler  -key Enter -Function ValidateAndAcceptLine
Set-PSReadLineKeyHandler  -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler  -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler  -Key DownArrow -Function HistorySearchForward


### Aliases ###
Set-Alias -Name c   -Value code
Set-Alias -Name s   -Value scoop
Set-Alias -Name g   -Value git
Set-Alias -Name l   -Value ls
Set-Alias -Name rg  -Value findstr
Set-Alias -Name lg  -Value lazygit


Set-Alias -Name ls  -Value ezafunc
function ezafunc {
    eza --long --header --tree --icons=always --hyperlink --all --level=1 --group-directories-first --time-style '+%d-%m-%Y %H:%M' --no-permissions
}

clear
