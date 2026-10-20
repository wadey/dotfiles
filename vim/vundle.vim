set nocompatible               " be iMproved

" Auto-install vim-plug if not present
let data_dir = expand('~/.vim')
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

source ~/.vim/bundles.vim

call plug#end()
