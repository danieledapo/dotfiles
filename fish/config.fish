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
if test -f /usr/share/autojump/autojump.fish
    . /usr/share/autojump/autojump.fish
end

#
# Virtualfish
#
eval (python -m virtualfish auto_activation)

#
# Direnv
#
if test -x $HOME/.local/bin/direnv
    eval (direnv hook fish)
end
