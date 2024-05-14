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

    pyenv init - | source
end

alias t thought
alias o xdg-open

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
