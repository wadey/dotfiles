#!/bin/sh

SH_FILES="zshrc zsh.d"
BACKUP=shbackup`date +'%Y%m%d-%H%M%S'`
SHDIR=$PWD

if [ ! -d $BACKUP ]; then
    mkdir $BACKUP
fi

for FILE in $SH_FILES; do
    if [ -e "$HOME/.$FILE" ]; then
        echo "backing up ~/.$FILE"
        mv "$HOME/.$FILE" "$BACKUP/$FILE"
    fi
    echo "installing $FILE"
    ln -s "$SHDIR/$FILE" "$HOME/.$FILE"
done
