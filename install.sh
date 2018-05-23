#!/bin/sh

files='.ctags .gnuplot .latex_template .vim .vimrc .gitconfig'

echo "Enter a destination for dot files (or hit Enter for default $HOME)"

read path

if [ -z "$path" ]
then
	echo "copying dot files to $HOME"
	for i in $files; do ln -sv ~/.dotfiles/$i $HOME/$i ; done
	ln -sv ~/.dotfiles/config.fish $HOME/.config/fish/config.fish
else
	echo "copying dot files to "$path
	for i in $files; do ln -sv ~/.dotfiles/$i $path/$i ; done
	ln -sv ~/.dotfiles/config.fish $path/.config/fish/config.fish
fi


