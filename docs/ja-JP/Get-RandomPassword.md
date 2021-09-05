---
external help file: PSPasswordGen-help.xml
Module Name: PSPasswordGen
online version:
schema: 2.0.0
---

# Get-RandomPassword

## SYNOPSIS
ランダムなパスワードを生成します。

## SYNTAX

```
Get-RandomPassword [[-Length] <Int32>] [[-Count] <Int32>] [-NoNumerals] [-NoLowerCase] [-NoUpperCase] [-NoSymbols]
 [-NoAmbiguous] [-NoVowels] [-NoMetaCharacters] [-NoNeedToEscape] [[-ExcludeChars] <Char[]>]
 [<CommonParameters>]
```

## DESCRIPTION
ランダムなパスワードを生成します。

生成されたパスワードは以下の規則に従います:

- パスワードは空白と制御文字を除いたASCII文字からなります。
- パスワードは数字・英小文字・英大文字・記号の4つのカテゴリからそれぞれ最低1文字づつを含みます。
- "-No\<カテゴリ名\>" オプションが指定された場合、前項の規則は緩和されます。
- パスワード長がカテゴリ数より少ない場合、いくつかの規則は無視されます。

## EXAMPLES

### EXAMPLE 1
```
Generate-Password
```

20個のパスワードが生成されます。それぞれのパスワード長は12文字です。

### EXAMPLE 2
```
Generate-Password -Length 20 -Count 1
```

1個のパスワードが生成されます。パスワード長は20文字です。

### EXAMPLE 3
```
Generate-Password -NoSymbols -ExcludeChars "Qwerty"
```

20個のパスワードが生成されます。7それぞれのパスワード長は12文字です。

生成されたパスワードは記号と"Q", "w", "e", "r", "t", "y"を含みません。

## PARAMETERS

### -Length
パスワード長(既定: 12)

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
生成されるパスワード数(既定: 20)

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
パスワードから数値を除外します。

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
パスワードから英小文字を除外します。

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
パスワードから英大文字を除外します。

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
パスワードから記号を除外します。

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
パスワードから"あいまい"な文字を除外します。

"あいまい"な文字は以下の通りです:

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
パスワードから母音を除外します。

母音は以下の通りです:

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
パスワードからシェルにおけるメタ文字を除外します。

対象は以下の通りです:

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
パスワードから、シェルにおいて引用符または二重引用符で囲んだ際にエスケープが必要な文字を除外します。

対象は以下の通りです:

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
除外する文字をカスタムします。

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

### なし
## OUTPUTS

### System.Stringの配列
## NOTES

## RELATED LINKS

[Repository: https://www.powershellgallery.com/packages/PSPasswordGen]()
[Source: https://github.com/telitas/PSPasswordGen]()

