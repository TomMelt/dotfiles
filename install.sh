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

    echo "Installing vim plug..."
    dest_file=$HOME/.vim/autoload/plug.vim
    if [ -f "$dest_file" ]; then
        echo "skipping... $dest_file already exists."
    else
        mkdir -p $HOME/.vim/autoload
        curl -fLo $HOME/.vim/autoload/plug.vim \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "run the following to install plugins in vim:"
        echo "$ vim -c PlugInstall"
    fi
    echo "complete"

    echo "installing lsps..."
    for lsp in pylsp fortls
    do
        folder=$HOME/.vim/$lsp
        if [ -d "$folder" ]; then
            echo "skipping... $folder already exists."
        else
            python3 -m venv $folder
            source ${folder}/bin/activate
            if [ "$lsp" = "fortls" ]
            then
                pip install fortls
            elif [ "$lsp" = "pylsp" ]
            then
                pip install "python-lsp-server[all]" "black==24.3.0" "flake8==7.0.0"
            fi
        fi
    done
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
    rm -vr $HOME/.vim
else
    echo "Option not supported. Please try again."
fi
