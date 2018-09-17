#!/bin/sh

files='.ctags .gnuplot .latex_template .tmux.conf .vim .vimrc .gitconfig'
tpm=~/.tmux/plugins/tpm

echo "(I)nstall or (R)emove?"

read choice

if [ "$choice" = "I" ]
then
	# check if tpm exists before trying to gitclone
	#==============================================
	if [ -d $tpm ]
	then
		echo "Tmux package manager exists already... skipping."
	else
		echo "Downloading tmux package manager from github."
		git clone https://github.com/tmux-plugins/tpm $tpm
	fi

	# install dot files
	#==================
	echo "Copying dot files to $HOME"
	for i in $files; do ln -sv ~/.dotfiles/$i $HOME/$i ; done
	ln -sv ~/.dotfiles/config.fish $HOME/.config/fish/config.fish

	# setup vundle submodule
	#=======================
	echo "Installing vundle submodule..."
	cd ~/.vim/bundle/Vundle.vim/
	git submodule init
	git submodule update

	cd ~/.dotfiles
	echo "complete"

elif [ "$choice" = "R" ]
then
	# remove dot files
	#==================
	echo "removing dot files from $HOME"
	for i in $files; do rm -ivr $HOME/$i ; done
	rm -ivr $HOME/.config/fish/config.fish
else
	echo "Option not supported. Please try again."
fi
