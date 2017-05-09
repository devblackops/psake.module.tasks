
properties {
    $taskModuleVersion = $modVer
}

task Default -depends Test

task Init {
    '   Initializing...'
    Remove-Module psake.build.tasks -ErrorAction SilentlyContinue
    $importParams = @{
        Name = "$PSScriptRoot\psake.build.tasks"
        Scope = 'Local'
        RequiredVersion = $taskModuleVersion
        ErrorAction = 'Stop'
        WarningAction = 'SilentlyContinue'
        Verbose = $false
    }
    Write-Verbose "Importing task module version [$taskModuleVersion]"
    Import-Module @importParams
    $script:testTask = Get-TestTask
    $script:deployTask = Get-DeployTask
}

task Test -depends Init {
    . $script:testTask
}

task Deploy -depends Test {
    . $script:deployTask
}
