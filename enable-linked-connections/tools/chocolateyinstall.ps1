$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'AddEnableLinkedConnections.cmd'
$cmdLocation = $Env:ComSpec
$statementsToRun = "/C `"$fileLocation`""
Start-ChocolateyProcessAsAdmin $statementsToRun $cmdLocation -validExitCodes @(0,3010) | out-null
Set-PowerShellExitCode 3010
