New-Item -Path ($PSScriptRoot + '\Temp') -ItemType Directory -Force | Out-Null
Start-Transcript ($PSScriptRoot + '\Temp\runbuild.txt')

$version = Get-Content "$PSScriptRoot\version.json" | Out-String | ConvertFrom-Json

$packageVersion = "$($version.Major).0.$($version.Release)"
$assemblyName = "Mag.Newtonsoft.Json.$packageVersion"

& $PSScriptRoot\runbuild.ps1 -properties @{"majorVersion"="$($version.Major).0"; "majorWithReleaseVersion"=$packageVersion; "nugetPrerelease"=$version.Prerelease; "zipFileName"="Json$($version.Major)0r$($version.Release).zip"; "packageId"="Mag.Newtonsoft.Json"; "assemblyName"=$assemblyName; "treatWarningsAsErrors"=$true}
