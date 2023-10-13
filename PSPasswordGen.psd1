@{
    RootModule = 'PSPasswordGen.psm1'
    ModuleVersion = '$Version'
    GUID = 'a3f8a08e-2fd8-4753-b71d-8a5373ec5811'
    Author = 'telitas'
    CompanyName = 'Unknown'
    Copyright = '(c) 2021 telitas'
    Description = 'PowerShell password generation tool.'
    PowerShellVersion = '5.0'
    FunctionsToExport = @('Get-RandomPassword')
    CmdletsToExport = @()
    VariablesToExport = '*'
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('Password', 'Management', 'Utility', 'Generator', 'Windows', 'MacOS', 'Linux')
            License = 'MIT'
            ProjectUri = 'https://github.com/telitas/PSPasswordGen'
        }
    }
}
