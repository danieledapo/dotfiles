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
    source /usr/share/autojump/autojump.fish
end

#
# Direnv
#
eval (direnv hook fish)

#
# Byobu
#

# N.B. the terminal emulator should run the shell as the login shell in order to
# have this check pass

status is-login
and status is-interactive
and exec byobu-launcher

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
