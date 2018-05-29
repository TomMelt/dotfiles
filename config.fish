# User specific functions
function g --description 'alias for git'
    git $argv
end
function vi --description 'alias vi vim'
    vim $argv
end
function docs
	vim $HOME/rmat/ukrmol-in/release-branches/release-1.0/doc/
end
function sshleg
	ssh ucaptme@legion.rc.ucl.ac.uk
end
function profile
	vim $HOME/.config/fish/config.fish
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
	rsync -avh --delete --exclude-from=$HOME/.rsync_exclude /scratch/tmeltzer/NO $HOME/Documents/Project/
end
function backup_DRYRUN
	rsync -avhn --delete --exclude-from=$HOME/.rsync_exclude /scratch/tmeltzer/NO $HOME/Documents/Project/
end

function cds
	pwd > $HOME/.lastlocation
end

function cdl
	cd (cat $HOME/.lastlocation)
end
