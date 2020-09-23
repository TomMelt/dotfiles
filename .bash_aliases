alias vi='vim -p'
alias paper='cd /home/melt/Dropbox/PhD/Jonathan/Papers/super_elastic/tex; \
    okular paper.pdf > /dev/null 2>&1 &'
alias bashreload='source $HOME/.bashrc'
alias profile='vim $HOME/.bashrc'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
complete -o bashdefault -o default -F _fzf_path_completion vimdiff okular \
    gnuplot xmgrace gdb

export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=10000                   # big big history
export HISTFILESIZE=10000               # big big history

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

okular_terminal () {
    okular $@ > /dev/null 2>&1
}

jupyter_terminal () {
    jupyter-notebook $@ > /dev/null 2>&1
}
