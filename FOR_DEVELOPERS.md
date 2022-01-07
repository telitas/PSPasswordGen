# For developers

## Develop environment

This project uses following tools.

| Category | Name |
| ------------- | ------------- |
| Test framework | [Pester](https://pester.dev/) |
| Linter | [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer) |
| Document Generator | [platyPS](https://github.com/PowerShell/platyPS) |

## About preset characters option

### Ambiguous and vowels

In this module, they are defined as the same characters used in pwgen.

### Metacharacters

In this module, the symbols are considered as metacharacters when either of the following 3 echo commands returns the different value from its argument without single/double quotations.

```sh
echo <symbol>
echo <symbol><letter><symbol>
echo <letter><symbol><letter>

#example
echo +
echo +a+
echo a+a
```

```txt
pwsh  "#$ &'() , ;< > @  ] `{|} 
cmd  !   %&       < >     ^  |  
bash !"#$ &'()*  ;< >?  \  ` | ~
dash  "#$ &'()*  ;< >?  \  ` | ~
tcsh !"#$ &'()*  ;< >?  \  `{| ~
zsh  !"#$ &'()* -;<=>? [\  ` | ~
--------------------------------
all  !"#$%&'()*,-;<=>?@[\]^`{|}~
```

### Need to escapes

Similar to metacharacters, but the argument is enclosed in single/double quotations.

```sh
echo "<symbol>"
echo "<symbol><letter><symbol>"
echo "<letter><symbol><letter>"

echo '<symbol>'
echo '<symbol><letter><symbol>'
echo '<letter><symbol><letter>'

#example
echo "+"
echo "+a+"
echo "a+a"

echo '+'
echo '+a+'
echo 'a+a'
```

```txt
"-pwsh  "$    `
"-cmd  !  %    
"-bash  "$   \`
"-dash  "$   \`
"-tcsh !"$    `
"-zsh   "$  -\`
'-pwsh     '   
'-bash     '   
'-dash     '   
'-tcsh !   '   
'-zsh      '-  
---------------
all    !"$%'-\`
```
