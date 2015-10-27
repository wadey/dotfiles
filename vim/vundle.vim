set nocompatible               " be iMproved
filetype on
filetype off                   " required!

" via http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !rm -rf ~/.vim/bundle
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

source ~/.vim/bundles.vim

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

filetype plugin indent on     " required!
