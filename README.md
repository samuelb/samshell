# samshell

A minimalist zsh theme with git, kubernetes and python virtualenv decorations.

![](demo.png)

## Features

- show kubernetes context and namespace
- show current git branch
- indicates uncommited changes 
- indicates when a python virtualenv is loaded
- show the return code of the previous executed command
- displays path relative to git root

## Installation

### Manual

```
mkdir -p $ZSH_CUSTOM/themes`
wget -O $ZSH_CUSTOM/themes/samshell.zsh-theme https://raw.githubusercontent.com/samuelb/samshell/master/samshell.zsh-theme`
echo 'ZSH_THEME="samshell"' >> ~/.zshrc
```

### With antigen

```
antigen theme samuelb/samshell
```

## Credits

Originally, I took the "pi" theme from https://github.com/tobyjamesthomas/pi and modified it.
