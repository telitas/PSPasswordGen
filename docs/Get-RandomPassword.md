---
external help file: PSPasswordGen-help.xml
Module Name: PSPasswordGen
online version:
schema: 2.0.0
---

# Get-RandomPassword

## SYNOPSIS
Generate some random passwords.

## SYNTAX

```
Get-RandomPassword [[-Length] <Int32>] [[-Count] <Int32>] [-NoNumerals] [-NoLowerCase] [-NoUpperCase] [-NoSymbols]
 [-NoAmbiguous] [-NoVowels] [-NoMetaCharacters] [-NoNeedToEscape] [[-ExcludeChars] <Char[]>]
 [<CommonParameters>]
```

## DESCRIPTION
Generate some random passwords.

The password will be generated based on the following rules:

- The password constists of ASCII characters except white space and control characters.
- The password contains at least 1 character from each of 4 categories: numerals, upper case letters, lower case letters and symbols.
- If the "-No\<category name\>" option is specified, the corresponding rule is relaxed.
- If The password length is too short to meet the rules for categories, some rules will be ignored.

## EXAMPLES

### EXAMPLE 1
```
Generate-Password
```

20 passwords will be generated. Each password length is 12 characters.

### EXAMPLE 2
```
Generate-Password -Length 20 -Count 1
```

1 password will be generated. The length of the password is 20 characters.

### EXAMPLE 3
```
Generate-Password -NoSymbols -ExcludeChars "Qwerty"
```

20 passwords will be generated. The length of each password is 12 characters.

Generated passwords do not contains the symbols and "Q", "w", "e", "r", "t", "y".

## PARAMETERS

### -Length
Password length.(default: 12)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 12
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count
The count of password.(default: 20)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 20
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoNumerals
Exclude numerals from password.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoLowerCase
Exclude lower case letters from password.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoUpperCase
Exclude upper case letters from password.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoSymbols
Exclude symbol characters from password.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoAmbiguous
Exclude "ambiguous" characters from password.

The "ambiguous" are following characters:

B 8 G 6 I 1 l 0 O Q D S 5 Z 2

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoVowels
Exclude vowel characters from password.

Vowels are following characters:

0 1 a e i o u y A E I O U Y

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoMetaCharacters
Exclude meta characters in shells from password.

The targets are following characters:

! " # $ % & ' ( ) * , - ; \< = \> ? @ \[ \ \] ^ \` { | } ~

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoNeedToEscape
Exclude characters that need to be escaped when enclosed in single/double quotation marks in shells from password.

The targets are following characters:

! " $ % ' - \ \`

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeChars
Specify the custom characters to be excluded.

```yaml
Type: Char[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### Array of System.String
## NOTES

## RELATED LINKS

[Repository: https://www.powershellgallery.com/packages/PSPasswordGen]()
[Project: https://github.com/telitas/PSPasswordGen]()

