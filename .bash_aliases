alias vi='vim'

alias bashreload='source $HOME/.bashrc'
alias profile='vim $HOME/.bashrc'
alias prettypath='echo $PATH | sed "s/:/\n/g" | sort | uniq -c'

alias updatekeys='eval "$(tmux show-environment -s)"'

# Have less display colours
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;46;38m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;35m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
export MANPAGER='less -sigR'

# better default less
alias less='less -igR'

# better default grep
alias gg='grep -inIPR'

# docker specific
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=10000                   # big big history
export HISTFILESIZE=10000               # big big history

# better history searching
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

shopt -s direxpand # expand ENV vars on tab complete - stops annoying prefix of \ e.g. \$HOME

export FZF_DEFAULT_COMMAND=""
export FZF_CTRL_T_COMMAND=""
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_DEFAULT_OPTS='-e'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

okular_terminal () {
    okular $@ > /dev/null 2>&1
}

jupyter_terminal () {
    jupyter-notebook $@ > /dev/null 2>&1
}

zm () {
    sudo zfs load-key "$1" && sudo zfs mount "$1"
}

qf () {
    find . -name "$1"
}


gploop () {
    for i in $@
    do
        gnuplot -pc $i
    done
}

switch_display () {
    case "$DISPLAY" in
        *localhost*) export DISPLAY=":0" ;;
        *) export DISPLAY="localhost:10.0" ;;
    esac
    echo "DISPLAY = $DISPLAY"
}

# fuzzy grep using fzf
gf() {
    local file
    local line

    read -r file line <<<"$(grep -inIPR "$@" | fzf -0 -1 | awk -F: '{print $1, $2}')"

    if [[ -n $file ]]
    then
        vim $file +$line
    fi
}
