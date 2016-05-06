function fish_prompt --description 'Write out the prompt'

  set -l fish "⋊> "

  set -l normal_color     normal
  set -l success_color    cyan
  set -l error_color      red --bold
  set -l directory_color  brown

  set -l last_status $status

  echo ''

  if not test $last_status -eq 0
    set_color $error_color
  else
    set_color $success_color
  end

  echo -n $fish
  set_color $normal_color

  set_color $directory_color
  echo -n (prompt_pwd)
  set_color $normal_color

  if set -q VIRTUAL_ENV
    set_color -b magenta white
    echo -n -s "(" (basename "$VIRTUAL_ENV") ")"
    set_color $normal_color
  end

  __terlar_git_prompt

  echo -n '$ '
  set_color $normal_color
end
