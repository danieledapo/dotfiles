#
# ~/.config/fish/config.fish
#

#
# Environment
#

set -x EDITOR nvim

set -x PATH "$HOME/.local/bin" "$HOME/.cargo/bin" $PATH

#
# zoxide
#
zoxide init fish | source

#
# Direnv
#
direnv hook fish | source

if test (uname) = Darwin
    alias o open
else
    alias o xdg-open
end
