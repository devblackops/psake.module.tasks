
# Module psake Tasks

This is an work in progress example of hosting [psake](https://github.com/psake/psake) tasks inside a standalone PowerShell module and invoking those tasks withing a psake script.

## Usage

### Execute psake tasks from version `0.1.0` of the task module
```powershell
.\build.ps1 -Task Deploy -ModuleVersion 0.1.0

Executing Init
   Initializing...
Executing Test
    Running test task [0.1.0]
Executing deploy
    Running deploy task [0.1.0]

Build Succeeded!

----------------------------------------------------------------------
Build Time Report
----------------------------------------------------------------------
Name   Duration
----   --------
Init   00:00:00.0110621
Test   00:00:00.0062529
Deploy 00:00:00.0088795
Total: 00:00:00.0286268

```

### Execute psake tasks from version `0.2.0` of the task module
```powershell
.\build.ps1 -Task Deploy -ModuleVersion 0.2.0

Executing Init
   Initializing...
Executing Test
    Running test task [0.2.0]
Executing deploy
    Running deploy task [0.2.0]

Build Succeeded!

----------------------------------------------------------------------
Build Time Report
----------------------------------------------------------------------
Name   Duration
----   --------
Init   00:00:00.0129413
Test   00:00:00.0071977
Deploy 00:00:00.0083056
Total: 00:00:00.0308062

```
