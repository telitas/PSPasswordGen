# PSPasswordGen

PowerShell password generation tool.

## README Language

- [English](./README.md)
- [Japanese(日本語)](./README.ja-JP.md)

## How to Install

You can install from [PowerShell Gallery](https://www.powershellgallery.com/packages/PSPasswordGen/).

```ps1
Install-Module -Name PSPasswordGen -Scope CurrentUser
```

## Usage

```ps1
Get-RandomPassword
```

If you do not want to include some characters in passwords, set the `-No*` option.

```ps1
Get-RandomPassword -NoSymbols
Get-RandomPassword -NoUpperCase
```

You can exclude **troublesome symbols** on the command line with a single option!

```ps1
Get-RandomPassword -NoMetaCharacters
Get-RandomPassword -NoNeedToEscape
```

If you want to get more information, please read cmdlet help.

```ps1
Get-Help about_PSPasswordGen
Get-Help Get-RandomPassword -Detailed
```

## License

MIT
