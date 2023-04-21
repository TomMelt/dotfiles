alias vi='vim -p'
alias paper='cd /home/melt/Dropbox/univerzita_karlova/Papers/CoupledHartreeFock/tex/; \
    okular_terminal paper.pdf &'

alias bashreload='source $HOME/.bashrc'
alias profile='vim $HOME/.bashrc'
alias prettypath='echo $PATH | sed "s/:/\n/g" | sort | uniq -c'

alias updatekeys='eval "$(tmux show-environment -s)"'

# docker specific
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

alias meld='singularity run /home/t/tm412/singularity-images/meld/meld.sif meld'

export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=10000                   # big big history
export HISTFILESIZE=10000               # big big history

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export FZF_DEFAULT_COMMAND=""
export FZF_CTRL_T_COMMAND=""
export FZF_ALT_C_COMMAND="fd --type d"

okular_terminal () {
    okular $@ > /dev/null 2>&1
}

jupyter_terminal () {
    jupyter-notebook $@ > /dev/null 2>&1
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

# better default grep
alias gg='grep -inIPR'

# switch dev env for projects
dev-env () {

    module purge > /dev/null
    module load git/2.35.2 cmake/3.21.2 melt-custom > /dev/null
    project="$1"
    compiler="$2"

    case "$project" in
        fusion*) case "$compiler" in
            intel) module load intel/compilers/18 hdf5/intel/1.8.21 json-fortran/intel/8.3.0          > /dev/null ;;
            gnu)   module load hdf5/gcc/1.8.21 blas/gcc/3.6.0 lapack/gcc/3.6.1 json-fortran/gcc/8.3.0 > /dev/null ;;
            *) echo "option not supported" ;;
        esac ;;
        ulirs) module load idl/idl82; conda activate;;
        *) echo "option not supported" ;;
    esac

    module list
}
