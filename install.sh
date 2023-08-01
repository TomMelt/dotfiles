#!/bin/sh

files='.ctags .fdignore .gnuplot .tmux.conf .vimrc .gitconfig .bash_aliases .mpl-style'

echo "(I)nstall or (R)emove?"

read choice

if [ "$choice" = "I" ]
then

    cd $HOME

    echo "Copying dot files to $HOME"
    for i in $files
    do
        dest_file=$HOME/$i
        if [ ! -f "$dest_file" ]; then
            ln -sv $HOME/.dotfiles/$i $dest_file
        fi
    done
    echo "complete"

    if [ -z "$(grep 'source ~/.bash_aliases' $HOME/.bashrc)" ]; then
        echo "[ -f ~/.bash_aliases ] && source ~/.bash_aliases" >> $HOME/.bashrc && \
        echo "adding bash_aliases to ~/.bashrc"
    fi

    echo "Copying .vim to $HOME"
    folder=$HOME/.vim
    if [ -d "$folder" ]; then
        echo "skipping... $folder already exists."
    else
        ln -sv $HOME/.dotfiles/.vim $folder
    fi
    echo "complete"

    echo "Installing vundle submodule..."
    folder=$HOME/.vim/bundle
    if [ -d "$folder" ]; then
        echo "skipping... $folder already exists."
    else
        mkdir -p $folder
        cd $HOME/.dotfiles
        git submodule add -f https://github.com/VundleVim/Vundle.vim.git $folder/Vundle.vim

        echo "run the following to install plugins in vim:"
        echo "$ vim -c PluginInstall"
    fi
    echo "complete"

    echo "installing miniconda"
    folder=$HOME/miniconda3
    if [ -d "$folder" ]; then
        echo "skipping... $folder already exists."
    else
        cd ~
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
        bash Miniconda3-latest-Linux-x86_64.sh -b
        $folder/bin/conda init bash
        $folder/bin/conda config --set auto_activate_base false
    fi
    echo "complete"

    echo "installing fzf"
    folder=$HOME/.fzf
    if [ -d "$folder" ]; then
        echo "skipping... $folder already exists."
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all
    fi
    echo "complete"


elif [ "$choice" = "R" ]
then
    echo "removing dot files from $HOME"
    for i in $files; do rm -vr $HOME/$i ; done
    rm -vr .vim
else
    echo "Option not supported. Please try again."
fi
