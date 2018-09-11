#
# ~/.config/fish/config.fish
#

#
# Environment
#

set -x EDITOR "nvim"

set -x PATH "$HOME/.local/bin" "$HOME/.cargo/bin" $PATH

#
# Autojump
#
if test -f /usr/local/share/autojump/autojump.fish
    source /usr/local/share/autojump/autojump.fish
end

if test -f /usr/share/autojump/autojump.fish
    source /usr/share/autojump/autojump.fish
end

#
# Direnv
#
eval (direnv hook fish)