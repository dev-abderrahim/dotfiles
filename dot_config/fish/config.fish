# ~/.config/fish/config.fish

# Hide the default greeting message
set fish_greeting

# -----------------------------------------------------------------------------
# Environment Variables
# -----------------------------------------------------------------------------
# Set Neovim as the default reader for man pages
#set -gx MANPAGER 'nvim +Man!'

# Add local binaries to the path if the directory exists
if test -d "$HOME/.local/bin"
    fish_add_path "$HOME/.local/bin"
end

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
# Use a more modern 'ls' command
alias ls 'eza --icons'
alias la 'eza -lA --icons' # list all, long format
alias lt 'eza --tree --level=2 --icons' # tree view

# Improved clear command
alias clear "printf '\033[2J\033[3J\033[1;1H'"

# -----------------------------------------------------------------------------
# Startup Commands & Plugins
# -----------------------------------------------------------------------------
# This block should be at the very end of your config file.

# Restore Pywal colors from cache on startup
# The '-R' flag is faster than regenerating from the image every time.
#command -q wal && wal -R &> /dev/null
#[ -e $HOME/.cache/wal/sequences ] && cat $HOME/.cache/wal/sequences

# Initialize Starship prompt
command -q starship && starship init fish | source
