#!/bin/sh

files='.ctags .gnuplot .tmux.conf .vim .vimrc .gitconfig .bash_aliases'

echo "(I)nstall or (R)emove?"

read choice

if [ "$choice" = "I" ]
then
	# install dot files
	#==================
	echo "Copying dot files to $HOME"
	for i in $files; do ln -sv ~/.dotfiles/$i $HOME/$i ; done

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
else
	echo "Option not supported. Please try again."
fi
