# User specific functions
set -x INNER_TRUNK /nfs/workspaces/rmatrix/ukrmol-in/trunk/bin_wp
set -x INNER_RELEASE /nfs/workspaces/rmatrix/ukrmol-in/release-branches/release-1.0/bin
set -x OUTER /nfs/workspaces/rmatrix/ukrmol-out/trunk/bin

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
	rsync -avh --delete --delete-excluded \
	--exclude-from=$HOME/.rsync_exclude /scratch/tmeltzer/$argv $HOME/Documents/Project/
end

function backup_DRYRUN
	rsync -avhn --delete --delete-excluded \
	--exclude-from=$HOME/.rsync_exclude /scratch/tmeltzer/$argv $HOME/Documents/Project/
end

function cds
	pwd > $HOME/.lastlocation
end

function cdl
	cd (cat $HOME/.lastlocation)
end

function gpp
	git pull; and git push
end

