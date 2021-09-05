# PSPasswordGen

PowerShell上でパスワード生成ができます。

## README 言語の選択

- [英語(English)](./README.md)
- [日本語(Japanese)](./README.ja-JP.md)

## インストール方法

[PowerShell Gallery](https://www.powershellgallery.com/packages/PSPasswordGen/)からインストールします。

```ps1
Install-Module -Name PSPasswordGen -Scope CurrentUser
```

## 使用方法

```ps1
Get-RandomPassword
```

パスワード中に含めたくない文字がある場合は `-No*` オプションを設定します。

```ps1
Get-RandomPassword -NoSymbols
Get-RandomPassword -NoUpperCase
```

コマンドラインでトラブルを起こしがちな記号を、1つのオプションで除外できます。

```ps1
Get-RandomPassword -NoMetaCharacters
Get-RandomPassword -NoNeedToEscape
```

より詳細な情報については、コマンドレット　ヘルプをご覧ください。

```ps1
Get-Help about_PSPasswordGen
Get-Help Get-RandomPassword -Detailed
```

## ライセンス

MIT
