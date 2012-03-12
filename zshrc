#!/bin/zsh

autoload -U compinit
autoload colors && colors

echo_msg() {
  local color=$1; shift
  local header=$1; shift

  if [ "$TERM_PROGRAM" != "DTerm" ]; then
      echo "  ${fg_bold[$color]}$header${fg_no_bold[default]}  $*"
  fi
}

echo_warn() { echo_msg yellow WARN $* }

setopt extended_glob
for zshrc_snipplet in ~/.zsh.d/S[0-9][0-9]*[^~] ; do
  echo_msg green loading ${zshrc_snipplet##*/}
  source $zshrc_snipplet
done
