function Get-RandomPassword
{
    <#
    .EXTERNALHELP ..\PSPasswordGen-help.xml
    #>
    [CmdletBinding()]
    Param(
        [ValidateRange(1, [int]::MaxValue)][int]$Length = 12,
        [ValidateRange(1, [int]::MaxValue)][int]$Count = 20,
        [switch]$NoNumerals,
        [switch]$NoLowerCase,
        [switch]$NoUpperCase,
        [switch]$NoSymbols,
        [switch]$NoAmbiguous,
        [switch]$NoVowels,
        [switch]$NoMetaCharacters,
        [switch]$NoNeedToEscape,
        [char[]]$ExcludeChars = @()
    )
    $UIMessages = data {}
    try
    {
        Import-LocalizedData -BindingVariable UIMessages -ErrorAction Stop
    }
    catch
    {
        Import-LocalizedData -BindingVariable UIMessages -UICulture 'en-US'
    }
    Set-Variable -Name SupportPowerShellVersion -Value 3 -Option ReadOnly
    if($PSVersionTable.PSVersion.Major -lt $SupportPowerShellVersion)
    {
        Write-Warning -Message $UIMessages.ThisVersionIsNotSupported.Replace('$SupportPowerShellVersion', $SupportPowerShellVersion)
    }
    function ContainsAny
    {
        param(
            [System.Collections.Generic.IEnumerable[char]]$One,
            [System.Collections.Generic.IEnumerable[char]]$Another
        )
        $oneSet = New-Object -TypeName "System.Collections.Generic.HashSet[char]" -ArgumentList $One
        $oneSet.IntersectWith($Another)
        $oneSet.Count -gt 0
    }
    Set-Variable -Name NumeralChars -Value '0123456789' -Option ReadOnly
    Set-Variable -Name LowerCaseChars -Value 'abcdefghijklmnopqrstuvwxyz' -Option ReadOnly
    Set-Variable -Name UpperCaseChars -Value 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' -Option ReadOnly
    Set-Variable -Name SymbolChars -Value '!\"#$%&''()*+,-./:;<=>?@[\]^_`{|}~' -Option ReadOnly

    Set-Variable -Name NumeralsPattern -Value (New-Object -TypeName "Regex" -ArgumentList "[$($NumeralChars)]") -Option ReadOnly
    Set-Variable -Name LowerPattern -Value (New-Object -TypeName "Regex" -ArgumentList "[$($LowerCaseChars)]") -Option ReadOnly
    Set-Variable -Name UpperPattern -Value (New-Object -TypeName "Regex" -ArgumentList "[$($UpperCaseChars)]") -Option ReadOnly
    Set-Variable -Name SymbolPattern -Value (New-Object -TypeName "Regex" -ArgumentList "[$($SymbolChars -replace '([\[\]\\])', '\$1')]") -Option ReadOnly

    Set-Variable -Name CandidateCharSet -Value (New-Object -TypeName "System.Collections.Generic.HashSet[char]" -ArgumentList ($NumeralChars + $LowerCaseChars + $UpperCaseChars + $SymbolChars)) -Option ReadOnly

    $CandidateCharSet.ExceptWith([char[]]$ExcludeChars)
    if($NoNumerals)
    {
        $CandidateCharSet.ExceptWith([char[]]$NumeralChars)
    }
    if($NoLowerCase)
    {
        $CandidateCharSet.ExceptWith([char[]]$LowerCaseChars)
    }
    if($NoUpperCase)
    {
        $CandidateCharSet.ExceptWith([char[]]$UpperCaseChars)
    }
    if($NoSymbols)
    {
        $CandidateCharSet.ExceptWith([char[]]$SymbolChars)
    }
    if($NoAmbiguous)
    {
        $CandidateCharSet.ExceptWith([char[]]'B8G6I1l0OQDS5Z2')
    }
    if($NoVowels)
    {
        $CandidateCharSet.ExceptWith([char[]]'01aeiouyAEIOUY')
    }
    if($NoMetaCharacters)
    {
        $CandidateCharSet.ExceptWith([char[]]'!"#$%&''()*,-;<=>?@[\]^`{|}~')
    }
    if($NoNeedToEscape)
    {
        $CandidateCharSet.ExceptWith([char[]]'!"$%''-\`')
    }
    Write-Verbose $UIMessages.TheseAreCandidateChars.Replace('$CandidateCharSet', $([System.Linq.Enumerable]::ToArray($CandidateCharSet) -join ''))
    if($CandidateCharSet.Count -eq 0)
    {
        Write-Error -Message $UIMessages.ThereAreNoCharacters -ErrorAction Stop
    }
    if((-not $NoNumerals) -and -not (ContainsAny -One $CandidateCharSet -Another $NumeralChars))
    {
        Write-Error -Message $UIMessages.ThereAreNoNumerals -ErrorAction Stop
    }
    if((-not $NoLowerCase) -and -not (ContainsAny -One $CandidateCharSet -Another $LowerCaseChars))
    {
        Write-Error -Message $UIMessages.ThereAreNoLowerCase -ErrorAction Stop
    }
    if((-not $NoUpperCase) -and -not (ContainsAny -One $CandidateCharSet -Another $UpperCaseChars))
    {
        Write-Error -Message $UIMessages.ThereAreNoUpperCase -ErrorAction Stop
    }
    if((-not $NoSymbols) -and -not (ContainsAny -One $CandidateCharSet -Another $SymbolChars))
    {
        Write-Error -Message $UIMessages.ThereAreNoSymbols -ErrorAction Stop
    }
    $CandidateCharList=[System.Linq.Enumerable]::ToArray($CandidateCharSet)
    for($i = 0; $i -lt $Count; $i++)
    {
        $password=""
        $randomGenerator = [System.Security.Cryptography.RandomNumberGenerator]::Create()
        while($password.length -lt $Length)
        {
            [int]$index=-1
            do
            {
                [byte[]]$randomBytes=@(0)
                $randomGenerator.GetNonZeroBytes($randomBytes)
                $index=$randomBytes[0]
            }
            while($index -ge $CandidateCharList.Length)
            $password=$password+$CandidateCharList[$index]
            if($password.length -eq $Length)
            {
                $various = 0
                Write-Debug "Candidate password is $($password)"
                if($NoNumerals -or $NumeralsPattern.IsMatch($password))
                {
                    $various++
                }
                else
                {
                    Write-Debug "Candidate password has no numerals."
                }
                if($NoLowerCase -or $LowerPattern.IsMatch($password))
                {
                    $various++
                }
                else
                {
                    Write-Debug "Candidate password has no lower case letters."
                }
                if($NoUpperCase -or $UpperPattern.IsMatch($password))
                {
                    $various++
                }
                else
                {
                    Write-Debug "Candidate password has no upper case letters."
                }
                if($NoSymbols -or $SymbolPattern.IsMatch($password))
                {
                    $various++
                }
                else
                {
                    Write-Debug "Candidate password has no symbols."
                }
                if($various -lt [Math]::Min(4, $Length))
                {
                    $password = $password.Remove(0, 1)
                }
            }
        }
        $password
    }
}