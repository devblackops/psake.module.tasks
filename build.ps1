
[cmdletbinding(DefaultParameterSetName = 'task')]
param(
    [parameter(ParameterSetName = 'task')]
    [string[]]$Task = 'Default',

    [parameter(ParameterSetName = 'help')]
    [switch]$Help,

    [version]$ModuleVersion = '0.1.0'
)

if (-not (Get-Module -Name 'psake' -ListAvailable -Verbose:$false)) {
    Import-Module -Name psake
}

if ($PSBoundParameters.ContainsKey('help')) {
    Get-PSakeScriptTasks -buildFile "$PSScriptRoot\psake.ps1" |
        Sort-Object -Property Name |
        Format-Table -Property Name, Description, Alias, DependsOn
} else {
    $psakeParams = @{
        BuildFile = "$PSScriptRoot\psake.ps1"
        TaskList = $Task
        NoLogo = $true
        Verbose = ($VerbosePreference -eq 'Continue')
    }
    if ($ModuleVersion) {
        $psakeParams.Parameters = @{ModVer = $ModuleVersion}
    }
    Invoke-psake @psakeParams
    exit ( [int]( -not $psake.build_success ) )
}
