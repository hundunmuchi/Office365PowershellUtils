param (
	[string]$GroupName
)
#Set default params
if (!$GroupName) {
	$GroupName = ($MoveStats | Out-GridView -OutputMode Single -Title "Choose group to suspend:")
}

if (!$MoveStats) {
    . .\Office365\Monitor-MoveStats.ps1
}

$Suspended = $MoveStats | Where-Object {$_.Name -eq $GroupName}
($Suspended.Group) | Select-Object -First 2 | ForEach-Object {Resume-MoveRequest $_.Alias}
