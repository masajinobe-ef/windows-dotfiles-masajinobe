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
Invoke-Expression (&scoop-search --hook)

# oh-my-posh 
$profileDirectory = (Get-Item $PROFILE).Directory.FullName
$relativeConfigPath = Join-Path $profileDirectory "di4am0nd.omp.json"
oh-my-posh --init --shell pwsh --config $relativeConfigPath | Invoke-Expression

### Aliases ###
Set-Alias -Name s   -Value scoop
Set-Alias -Name g   -Value git
Set-Alias -Name l   -Value ls
Set-Alias -Name rg  -Value findstr
Set-Alias -Name n  -Value nvim

Set-Alias -Name ls  -Value ezafunc
function ezafunc {
    Clear-Host
    eza --long --header --tree --icons=always --all --level=1 --group-directories-first --time-style '+%d-%m-%Y %H:%M' --no-permissions
}

Invoke-Expression (& { (zoxide init powershell | Out-String) }) # Z jumper (zoxide)

Clear-Host