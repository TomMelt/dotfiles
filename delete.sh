#!/bin/sh

files='.ctags .gnuplot .latex_template .vim .vimrc'

echo "Enter location of current dot files (or hit Enter for default $HOME)"

read path

if [ -z "$path" ]
then
	echo "removing dot files from $HOME"
	for i in $files; do rm -vr $HOME/$i ; done
else
	echo "removing dot files from $path"
	for i in $files; do rm -vr $path/$i ; done
fi


