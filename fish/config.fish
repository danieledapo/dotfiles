#
# ~/.config/fish/config.fish
#

#
# Environment
#

set -x EDITOR "vim"
set -x GOPATH "$HOME/dev/go"

set -x PATH "$GOPATH/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" $PATH

#
# Autojump
#
if test -f $HOME/.autojump/share/autojump/autojump.fish
    . $HOME/.autojump/share/autojump/autojump.fish
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


#
# Install fundle
#
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

#
# Fish completions
#
fundle plugin 'brgmnn/fish-docker-compose'
