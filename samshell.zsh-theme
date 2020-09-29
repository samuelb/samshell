local return_status="%(?:%{$fg_bold[green]%}%?:%{$fg_bold[red]%}%?)"
local prompt_suffix="%{$fg[white]%}➜%{$reset_color%} "

if [[ -z $ZSH_SAMSHELL_KUBECTL_PROMPT ]]; then
    ZSH_SAMSHELL_KUBECTL_PROMPT=true
fi

function kubectl_prompt() {
    if [[ ! -z $ZSH_KUBECTL_PROMPT ]] && $ZSH_SAMSHELL_KUBECTL_PROMPT; then
        echo "%{$FG[111]%}☸ ${ZSH_KUBECTL_PROMPT}"
    fi
}

# by shashankmehta (https://github.com/shashankmehta)
function get_pwd() {
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

function get_venv() {
    if [[ -v VIRTUAL_ENV ]]; then
        echo "🐍 "
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[112]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}± "
ZSH_THEME_GIT_PROMPT_CLEAN=" "

PROMPT='${return_status} %{$fg[blue]%}$(get_pwd)%{$reset_color%} ${prompt_suffix}'
RPROMPT='$(get_venv)$(git_prompt_info)$(kubectl_prompt)%{$reset_color%}'
