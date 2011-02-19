#!/bin/sh

SH_FILES="zshrc zsh.d gitconfig gitignore vimrc vim gvimrc ackrc screenrc ctags"
BACKUP="backups/`date +'%Y%m%d-%H%M%S'`"
SHDIR=$PWD

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
