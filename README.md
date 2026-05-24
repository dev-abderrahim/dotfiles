# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## What's in?

- Zsh
- Fish
- Ghostty

## Getting started

```sh
chezmoi init --apply https://github.com/dev-abderrahim/dotfiles.git
```

## Daily usage

```sh
# Preview changes
chezmoi diff

# Apply changes from source to home
chezmoi apply

# Pull latest from remote and apply
chezmoi update

# Add a new file to manage
chezmoi add ~/path/to/dotfile

# Edit a managed file
chezmoi edit ~/path/to/dotfile
```
