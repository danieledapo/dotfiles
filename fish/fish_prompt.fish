source ~/tokyonight/extras/fish/tokyonight_storm.fish

set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showupstream informative

set -g __fish_git_prompt_char_dirtystate '*'
set -g __fish_git_prompt_char_stateseparator
set -g __fish_git_prompt_char_untrackedfiles …
set -g __fish_git_prompt_char_upstream_ahead ' +'
set -g __fish_git_prompt_char_upstream_behind ' -'
set -g __fish_git_prompt_char_upstream_prefix

set -g __fish_git_prompt_color_branch yellow
set -g __fish_git_prompt_color_cleanstate green
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_untrackedfiles normal


function fish_prompt
    set -l symbol " λ "
    set -l code $status

    set_color $fish_color_comment
    printf (prompt_pwd)
    set_color $fish_color_normal
    printf (fish_git_prompt " %s")

    if test "$code" != 0
        set_color red
    end
    set_color $fish_color_comment
    printf "$symbol"
    set_color normal
    echo ""
end


function fish_right_prompt
    printf (set_color $fish_color_comment)(date +%H(set_color yellow):(set_color $fish_color_comment)%M(set_color yellow):(set_color $fish_color_comment)%S)(set_color normal)
end
