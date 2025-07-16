# ~/.zshrc

# ------------------------------------------------------------------------------
# Oh My Zsh Configuration
# ------------------------------------------------------------------------------

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="random" # Uncomment to use a random theme.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" ) # Optional: Limit random themes.

# Case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Auto-update settings (uncomment and modify ONE of the modes)
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update (default)
# zstyle ':omz:update' frequency 13   # days between updates (default: 13)

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f" # Custom waiting string

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check faster for large repos.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# History timestamp format. See 'man strftime'.
# HIST_STAMPS="yyyy-mm-dd"

# Custom folder location (rarely needed).
# ZSH_CUSTOM=/path/to/new-custom-folder

# Oh My Zsh plugins to load. Add wisely, as too many plugins slow down startup.
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    git
    # Add other plugins here, e.g.
    # docker
    # history
)

# Source Oh My Zsh. This MUST come after setting ZSH variables.
# shellcheck source=/dev/null
source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# Environment Variables
# ------------------------------------------------------------------------------

# Set default locale.
export LANG=en_GB.UTF-8

# Set preferred editor.
export EDITOR='vim'



# Set GRADLE_HOME - Using which might be slow if gradle isn't in the immediate PATH yet.
# Consider setting it statically if path doesn't change, or let tools find it.
GRADLE_PATH=$(command -v gradle) # Use command -v instead of which
if [[ -n "$GRADLE_PATH" ]]; then
  export GRADLE_HOME="$GRADLE_PATH"
fi


# Potentially useful, uncomment if needed:
export MANPATH="/usr/local/man:$MANPATH"
# export ARCHFLAGS="-arch $(uname -m)" # For compilation on macOS/BSD
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock # Common Docker socket path
# export CHROME_EXECUTABLE="$(command -v chromium-browser)" # Find Chrome/Chromium

# ------------------------------------------------------------------------------
# PATH Configuration
# Using Zsh's 'path' array for easier management. Prepending ensures priority.
# ------------------------------------------------------------------------------

# User-specific binary paths
# path=("$HOME/development/spring/bin" $path)
path=("$HOME/.pub-cache/bin" $path) # Dart/Flutter pub cache
path=("$HOME/.local/bin" $path)    # Pip user installs
path=("$HOME/.cargo/bin" $path)    # Rust cargo

# Other application paths
path=("/opt/netbeans/bin" $path)   # Netbeans

# Add standard system paths (if not already present, though usually they are)
# path=("/usr/local/bin" "/usr/bin" "/bin" $path)

# Export the final PATH
export PATH

# ------------------------------------------------------------------------------
# Aliases
# Consider moving custom aliases to $ZSH_CUSTOM/aliases.zsh for better organization
# ------------------------------------------------------------------------------

# LS Aliases
alias ll='ls -alF' # Combine common flags
alias la='ls -A'
alias l='ls -CF'
# alias ls='ls --color=auto' # Often enabled by default or via OMZ themes

# Application Aliases
# alias tor-browser="/opt/tor-browser/Browser/start-tor-browser"
# alias telegram="/opt/Telegram/Telegram"
# alias syncthing="/opt/syncthing/syncthing"
# alias zen="/opt/zen/zen"
# alias flutter="fvm flutter" # If using Flutter Version Manager
# alias brave="brave --password-store=basic"

# Utility Aliases
# alias zshconfig="\$EDITOR ~/.zshrc"
# alias ohmyzsh="\$EDITOR ~/.oh-my-zsh"
alias reload!='source ~/.zshrc && echo Zsh config reloaded'

# Fastfetch Alias (moved execution from startup)
alias ff="fastfetch --logo $HOME/.config/fastfetch/assets/profile.png --logo-width 50 --color red"

# ------------------------------------------------------------------------------
# Shell Features & Plugin Configuration
# ------------------------------------------------------------------------------

# Check if compinit needs to be run explicitly (OMZ usually handles this)
# autoload -Uz compinit && compinit
autoload -U compinit && compinit -u


# zsh-autosuggestions (if installed via package manager)
ZSH_AUTOSUGGEST_SCRIPT="/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [[ -f "$ZSH_AUTOSUGGEST_SCRIPT" ]]; then
    # shellcheck source=/dev/null
    source "$ZSH_AUTOSUGGEST_SCRIPT"
    # Change suggestion color (optional)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# zsh command-not-found handler (if package installed, e.g., command-not-found on Debian/Ubuntu)
ZSH_CMD_NOT_FOUND_SCRIPT="/etc/zsh_command_not_found"
if [[ -f "$ZSH_CMD_NOT_FOUND_SCRIPT" ]]; then
    # shellcheck source=/dev/null
    source "$ZSH_CMD_NOT_FOUND_SCRIPT"
fi

# Starship Prompt - Initialize last for correct prompt setup
# Check if starship command exists before trying to initialize
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Dart CLI Completions
DART_COMPLETION_SCRIPT="/home/rahim/.config/.dart-cli-completion/zsh-config.zsh"
if [[ -f "$DART_COMPLETION_SCRIPT" ]]; then
  # shellcheck source=/dev/null
  source "$DART_COMPLETION_SCRIPT"
fi

# ------------------------------------------------------------------------------
# Startup Commands (Removed from .zshrc)
# ------------------------------------------------------------------------------

# NOTE: 'clear' and 'fastfetch' were removed from direct execution in .zshrc.
# Running commands like these here slows down EVERY new shell instance,
# including non-interactive shells and subshells, which is usually undesirable.

# Options:
# 1. Run them manually when you open a *new* terminal tab/window.
# 2. Create an alias: alias start='clear && fastfetch' and run 'start'.
# 3. Put them in ~/.zprofile if you only want them for LOGIN shells (e.g., when you first log into the system or via SSH).
# 4. Use the fastfetch alias defined above: `ff`

# Example alias:
# alias term-init='clear && ff'

# If you really want fastfetch on every interactive shell start (might still feel slow):
# Add 'ff' as the *very last* line of this file (after starship init).
# 'clear' is generally discouraged as it clears scrollback buffer.

# ------------------------------------------------------------------------------
# End of ~/.zshrc
# ------------------------------------------------------------------------------

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/rahim/.dart-cli-completion/zsh-config.zsh ]] && . /home/rahim/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

wal -i $(swww query | awk -F 'image: ' '{print $2}') &> /dev/null 
wal -R &> /dev/null

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
