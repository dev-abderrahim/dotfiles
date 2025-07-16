# My Dotfiles

## 📂 Structure

```
.
├── nvim/
│   └── .config/
│       └── nvim/
├── zsh/
│   └── .zshrc
├── fish/
│   └── .config/
│       └── fish/
├── git/
│   └── .gitconfig
│   └── .gitignore\_global
├── tmux/
│   └── .tmux.conf
└── README.md

````

---

## 🚀 Installation

Follow these steps to set up my dotfiles on a new system:

### 1. Install GNU Stow: 

the package is named `stow` on all distros.

### 2. Clone the Repository

Clone to `~/.dotfiles`.

```bash
git clone https://github.com/dev-abderrahim/dotfiles.git $HOME/.dotfiles
````

### 3. Stow the Dotfiles

Use `stow` to create symbolic links for each "package".
If there is an existing configuration files, `stow` will conflict. **Back up or remove** first.

```bash
cd ~/.dotfiles

stow nvim
stow zsh
stow fish
stow git
stow tmux
# etc
```

-----

## 🛠️ Usage and Maintenance

  * **Making Changes:** Editing the files directly within `~/.dotfiles/<package_name>/` will, since they are symlinked, reflect the changes to the active configuration.
  * **Adding New Files:** Placing new configuration files in the appropriate package directory within `~/.dotfiles/` the new file should be picked up automatically. If not, re-running `stow <package_name>` usually resolves it.
  * **Removing Files/Unstowing:**
      * To remove a specific file: First, `stow -D <package_name>` to remove the symlinks for that package, then delete the file from your `~/dotfiles/<package_name>/` directory. Finally, `stow <package_name>` to re-link the remaining files.
      * To completely unstow a package (remove all its symlinks): `stow -D <package_name>`

