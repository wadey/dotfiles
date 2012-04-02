#!/bin/sh

SH_FILES="zshrc zsh gitconfig gitignore vimrc vim gvimrc ackrc screenrc ctags"
BACKUP="backups/`date +'%Y%m%d-%H%M%S'`"
SHDIR=$PWD

if [[ ! -d ~/.oh-my-zsh ]]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

for FILE in $SH_FILES; do
    if [ -e "$HOME/.$FILE" ]; then
        if [ -L "$HOME/.$FILE" ]; then
            echo "not backing up ~/.$FILE, it is a symlink -> `readlink $HOME/.$FILE`"
            rm "$HOME/.$FILE"
        else
            echo "backing up ~/.$FILE"
            mkdir -p $BACKUP
            mv "$HOME/.$FILE" "$BACKUP/$FILE"
        fi
    fi
    echo "installing $FILE"
    ln -s "$SHDIR/$FILE" "$HOME/.$FILE"
done

(cd $HOME/.vim && ./update)
mkdir -p ~/.vimundo
