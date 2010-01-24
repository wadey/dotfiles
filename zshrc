#!/bin/zsh

autoload -U compinit
autoload colors && colors

setopt extended_glob
for zshrc_snipplet in ~/.zsh.d/S[0-9][0-9]*[^~] ; do
  echo "  ${fg_bold[green]}loading    ${fg_no_bold[default]} ${zshrc_snipplet##*/}"
  source $zshrc_snipplet
done