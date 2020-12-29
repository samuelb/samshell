typeset -gr __samshell_return_status="%(?:%{$fg_bold[green]%}%?:%{$fg_bold[red]%}%?)"
typeset -gr __samshell_prompt_suffix="%{$fg[white]%}➜%{$reset_color%} "

if [[ -z $ZSH_SAMSHELL_KUBECTL_PROMPT ]]; then
    ZSH_SAMSHELL_KUBECTL_PROMPT=true
fi

function __samshell_kubectl_prompt() {
    if [[ ! -z $ZSH_KUBECTL_PROMPT ]] && $ZSH_SAMSHELL_KUBECTL_PROMPT; then
        echo "%{$FG[111]%}☸ ${ZSH_KUBECTL_PROMPT}"
    fi
}

# by shashankmehta (https://github.com/shashankmehta)
function __samshell_get_pwd() {
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

function __samshell_get_venv() {
    if [[ -v VIRTUAL_ENV ]]; then
        echo "🐍 "
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[112]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}± "
ZSH_THEME_GIT_PROMPT_CLEAN=" "

PROMPT='${__samshell_return_status} %{$fg[blue]%}$(__samshell_get_pwd)%{$reset_color%} ${__samshell_prompt_suffix}'
RPROMPT='$(__samshell_get_venv)$(git_prompt_info)$(__samshell_kubectl_prompt)%{$reset_color%}'
