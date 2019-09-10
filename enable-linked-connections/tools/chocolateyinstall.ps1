$ErrorActionPreference = 'Stop';
$OSBuild=Get-WinVerBuild
$OSFound = (Get-WinName) + " " + (Get-WinVerMajor) + "." + (Get-WinVerMinor) + "." + (Get-WinVerBuild)

# Filter out incompatible Windows OSes
if ((Get-IsWin7) -or (Get-IsWin8) -or (Get-IsWin81)){
	Write-Warning "Enabled linked connection is only for Windows 10 or higher"
	throw
}

# Filter out incompatible Windows Server OSes
if ((Get-IsWinServer2008) -or (Get-IsWinServer2008R2) -or (Get-IsWinServer2012) -or (Get-IsWinServer2012R2)){
	Write-Warning "Enabled linked connection is only for Windows Server 2016 or higher"
	throw
}

Write-Host "  ** OS Found: $OSFound" -foreground magenta
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'AddEnableLinkedConnections.cmd'
$cmdLocation = $Env:ComSpec
$statementsToRun = "/C `"$fileLocation`""
Start-ChocolateyProcessAsAdmin $statementsToRun $cmdLocation -validExitCodes @(0,3010) | out-null
Set-PowerShellExitCode 3010
