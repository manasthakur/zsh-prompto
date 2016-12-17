# Manas's zsh prompt

function ssh_connection() {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "[%{$fg_faint[black]%}%n%{$fg[white]%}@%m%{$reset_color%}] "
    else
        echo " "
    fi
}

function return_status() {
    local return_status="%{$fg[red]%}%(?..👎 )%{$reset_color%}"
    echo $return_status
}

function git_branch() {
    git branch 2>/dev/null | awk '/^\*/ { print "(" $2 ")" }'
}

function bg_jobs() {
    local bg_status="%{$fg[yellow]%}%(1j.↓%j .)"
    echo $bg_status
}

PROMPT='$(ssh_connection)%{$fg[cyan]%}%~ $(bg_jobs)%{$fg[red]%}❯%{$reset_color%} '
RPROMPT='$(return_status)%{$fg[white]%}$(git_branch)%{$reset_color%}'

