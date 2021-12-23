Describe 'PSPasswordGen' {
    BeforeAll {
        Set-StrictMode -Version Latest
        $Testee = Join-Path -Path $PSScriptRoot -ChildPath ((Split-Path -Leaf $PSCommandPath) -replace '\.Tests\.ps1$', '.psm1')
        Import-Module $Testee -ErrorAction Stop
    }
    AfterAll {
        Remove-Module 'PSPasswordGen'
    }
    Context 'Lint' {
        It 'lint' {
            Get-ChildItem -Path .\src\*.ps1 -Recurse | ForEach-Object -Process {
                $output = Invoke-ScriptAnalyzer $_
                $output | Should -BeNullOrEmpty
            }
        }
    }
    Context 'Get-RandomPassword' {
        Context 'Passed' {
            It 'Set culture' {
                $culture = Get-UICulture
                @(
                    'en-US'
                    'ja-JP'
                    'nt-NW' # nothing, NoWhere
                ) | ForEach-Object -Process {
                    [CultureInfo]::CurrentUICulture = $_
                    Get-RandomPassword
                }
                [CultureInfo]::CurrentUICulture = $culture
            }
            It 'Omit all arguments' {
                $output = Get-RandomPassword
                $output.Count | Should -Be 20
                $output[0].Length | Should -Be 12
            }
            It 'Set password length' {
                $output = Get-RandomPassword -Length 1
                $output[0].Length | Should -Be 1
                $output = Get-RandomPassword -Length 100
                $output[0].Length | Should -Be 100
            }
            It 'Set passwords count' {
                $output = Get-RandomPassword -Count 1
                $output -is [String] | Should -BeTrue
                $output = Get-RandomPassword -Count 100
                $output.Count | Should -Be 100
            }
            It 'In default, contains 1 or more chars from each categories' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword
                    $output | ForEach-Object -Process {
                        $_ | Should -MatchExactly '[0123456789]'
                        $_ | Should -MatchExactly '[abcdefghijklmnopqrstuvwxyz]'
                        $_ | Should -MatchExactly '[ABCDEFGHIJKLMNOPQRSTUVWXYZ]'
                        $_ | Should -MatchExactly '[!"#$%&''()*+,-./:;<=>?@\[\\\]^_`{|}~]'
                    }
                }
            }
            It 'Set -NoNumerals' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -NoNumerals
                    $output | ForEach-Object -Process {
                        $_ | Should -Not -MatchExactly '[0123456789]'
                    }
                }
            }
            It 'Set -NoLowerCase' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -NoLowerCase
                    $output | ForEach-Object -Process {
                        $_ | Should -Not -MatchExactly '[abcdefghijklmnopqrstuvwxyz]'
                    }
                }
            }
            It 'Set -NoUpperCase' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -NoUpperCase
                    $output | ForEach-Object -Process {
                        $_ | Should -Not -MatchExactly '[ABCDEFGHIJKLMNOPQRSTUVWXYZ]'
                    }
                }
            }
            It 'Set -NoSymbols' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -NoSymbols
                    $output | ForEach-Object -Process {
                        $_ | Should -Not -MatchExactly '[!"#$%&''()*+,-./:;<=>?@[\]^_`{|}~]'
                    }
                }
            }
            It 'Set -NoAmbiguous' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -NoAmbiguous
                    $output | ForEach-Object -Process {
                        $_ | Should -Not -MatchExactly '[B8G6I1l0OQDS5Z2]'
                    }
                }
            }
            It 'Set -NoVowels' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -NoVowels
                    $output | ForEach-Object -Process {
                        $_ | Should -Not -MatchExactly '[01aeiouyAEIOUY]'
                    }
                }
            }
            It 'Set -NoMetaCharacters' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -NoMetaCharacters
                    $output | ForEach-Object -Process {
                        $_ | Should -Not -MatchExactly '[!"#$%&''()*,;<=>?@\[\\\]^`|~]'
                    }
                }
            }
            It 'Set -NoNeedToEscape' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -NoNeedToEscape
                    $output | ForEach-Object -Process {
                        $_ | Should -Not -MatchExactly '[!"$%''\`]'
                    }
                }
            }
            It 'Use all candidate chars' {
                for($i=0; $i -lt 30; $i++)
                {
                    $output = Get-RandomPassword -Length 100 -Count 1 -NoUpperCase -NoLowerCase -NoSymbols -ExcludeChars "123456789"
                    $output | ForEach-Object -Process {
                        $_ | Should -MatchExactly '^0+$'
                    }
                    $output = Get-RandomPassword -Length 200 -Count 1 -NoUpperCase -NoLowerCase -NoSymbols -ExcludeChars "23456789"
                    $output | ForEach-Object -Process {
                        $_ | Should -MatchExactly '^[01]*(01|10)[01]*$'
                    }
                }
            }
        }
        Context 'Exception' {
            It 'Password length less than minimum' {
                {Get-RandomPassword -Length 0} | Should -Throw
            }
            It 'Passwords count less than minimum' {
                {Get-RandomPassword -Count 0} | Should -Throw
            }
            It 'No characters for password generating with -No options' {
                {Get-RandomPassword -NoNumerals -NoLowerCase -NoUpperCase -NoSymbols} | Should -Throw
            }
            It 'No characters for password generating with -ExcludeChars option' {
                {Get-RandomPassword -ExcludeChars '!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~'} | Should -Throw
            }
            It 'No numerals without -NoNumerals option' {
                {Get-RandomPassword -ExcludeChars '0123456789'} | Should -Throw
            }
            It 'No upper case without -NoUpperCase option' {
                {Get-RandomPassword -ExcludeChars 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'} | Should -Throw
            }
            It 'No lower case without -NoLowerCase option' {
                {Get-RandomPassword -ExcludeChars 'abcdefghijklmnopqrstuvwxyz'} | Should -Throw
            }
            It 'No symbols without -NoSymbols option' {
                {Get-RandomPassword -ExcludeChars '!"#$%&''()*+,-./:;<=>?@[\]^_`{|}~'} | Should -Throw
            }
        }
    }
}
