#!/bin/sh

files='.ctags .gnuplot .latex_template .vim .vimrc'

echo "Enter a destination for dot files (or hit Enter for default $HOME)"

read path

if [ -z "$path" ]
then
	echo "copying dot files to $HOME"
	for i in $files; do ln -sv ~/.dotfiles/$i $HOME/$i ; done
else
	echo "copying dot files to "$path
	for i in $files; do ln -sv ~/.dotfiles/$i $path/$i ; done
fi


