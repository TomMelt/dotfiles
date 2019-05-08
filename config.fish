# User specific functions
# set -x INNER_TRUNK /nfs/workspaces/rmatrix/ukrmol-in/trunk/bin_wp
# set -x INNER_RELEASE /nfs/workspaces/rmatrix/ukrmol-in/release-branches/release-1.0/bin
# set -x OUTER /nfs/workspaces/rmatrix/ukrmol-out/trunk/bin

function fish_greeting
	echo  connected to: $USER@(hostname)
end

# User specific functions
function g --description 'alias for git'
    git $argv
end
function vi --description 'alias vi for vim -p'
    vim -p $argv
end
function docs
	vi $HOME/rmat/ukrmol-in/release-branches/release-1.0/doc/
end
function profile
	vi $HOME/.config/fish/config.fish
end
function fishreload
	source $HOME/.config/fish/config.fish
end
function mol
	molpro --no-xml-output $argv
end
function l
	ls -l $argv
end

function backup
	echo "backing up $argv to $HOME/Documents/Project/"
	rsync -avh --delete --delete-excluded \
	--exclude-from=$HOME/.rsync_exclude $argv $HOME/Documents/Project/
end

function backup_DRYRUN
	echo "backing up $argv to $HOME/Documents/Project/"
	rsync -avhn --delete --delete-excluded \
	--exclude-from=$HOME/.rsync_exclude $argv $HOME/Documents/Project/
end

function cds
	~/.cdl.sh -s
end

function cdl
	cd (~/.cdl.sh -l)
end

function cdr
	~/.cdl.sh -r
end

function gpp
	git pull; and git push
end

function man --description 'Format and display manual pages'
    set -q man_blink; and set -l blink (set_color $man_blink); or set -l blink (set_color -o red)
    set -q man_bold; and set -l bold (set_color $man_bold); or set -l bold (set_color -o 5fafd7)
    set -q man_standout; and set -l standout (set_color $man_standout); or set -l standout (set_color 949494)
    set -q man_underline; and set -l underline (set_color $man_underline); or set -l underline (set_color -u ef0249)

    set -l end (printf "\e[0m")

    set -lx LESS_TERMCAP_mb $blink
    set -lx LESS_TERMCAP_md $bold
    set -lx LESS_TERMCAP_me $end
    set -lx LESS_TERMCAP_so $standout
    set -lx LESS_TERMCAP_se $end
    set -lx LESS_TERMCAP_us $underline
    set -lx LESS_TERMCAP_ue $end
    set -lx LESS '-R -s'

    set -lx GROFF_NO_SGR yes # fedora

    set -lx MANPATH (string join : $MANPATH)
    if test -z "$MANPATH"
        type -q manpath
        and set MANPATH (command manpath)
    end
    set -l fish_manpath (dirname $__fish_datadir)/fish/man
    if test -d "$fish_manpath" -a -n "$MANPATH"
        set MANPATH "$fish_manpath":$MANPATH
        command man $argv
        return
    end
    command man $argv
end

function qfind --description 'look for any file recursively under $HOME'
    find . -iname "$argv"
end
