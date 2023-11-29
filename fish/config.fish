#
# ~/.config/fish/config.fish
#

#
# Environment
#

set -x EDITOR nvim

set -x PATH "$HOME/.local/bin" "$HOME/.cargo/bin" $PATH

#
# Autojump
#
if test -f /usr/share/autojump/autojump.fish
    source /usr/share/autojump/autojump.fish
end

#
# Direnv
#
eval (direnv hook fish)

#
# zellij
#
if set -q ZELLIJ
else
    zellij
end

#
# Pyenv
#

if test -d $HOME/.pyenv/bin
    set -x PYENV_ROOT "$HOME/.pyenv"
    set -x PATH "$PYENV_ROOT/bin" $PATH

    status --is-interactive; and source (pyenv init -|psub)
    status --is-interactive; and source (pyenv virtualenv-init -|psub)
end

alias t thought
alias o xdg-open

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
