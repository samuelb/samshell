PROMPT='${return_status} %{$fg[blue]%}$(get_pwd)%{$reset_color%} ${prompt_suffix}'
RPROMPT='$(git_prompt_info) %{$FG[111]%}☸ ${ZSH_KUBECTL_PROMPT}%{$reset_color%}'

local return_status="%(?:%{$fg_bold[green]%}%?:%{$fg_bold[red]%}%?)"

local prompt_suffix="%{$fg[white]%}➜%{$reset_color%} "

# by shashankmehta (https://github.com/shashankmehta)
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[112]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}±"
ZSH_THEME_GIT_PROMPT_CLEAN=""
