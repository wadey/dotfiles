#!/bin/sh

SH_FILES="zshrc zsh.d gitconfig vimrc ackrc"
BACKUP="backups/`date +'%Y%m%d-%H%M%S'`"
SHDIR=$PWD

if [ ! -d $BACKUP ]; then
    mkdir -p $BACKUP
fi

for FILE in $SH_FILES; do
    if [ -e "$HOME/.$FILE" ]; then
        echo "backing up ~/.$FILE"
        mv "$HOME/.$FILE" "$BACKUP/$FILE"
    fi
    echo "installing $FILE"
    ln -s "$SHDIR/$FILE" "$HOME/.$FILE"
done
