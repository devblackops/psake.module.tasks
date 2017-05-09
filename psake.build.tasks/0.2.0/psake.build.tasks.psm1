
$deploy = {
    Write-Host '    Running deploy task [0.2.0]'
}

$test = {
    Write-Host '    Running test task [0.2.0]'
}

function Get-DeployTask {
    $deploy
}

function Get-TestTask {
    $test
}
