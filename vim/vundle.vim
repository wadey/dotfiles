set nocompatible               " be iMproved
filetype on
filetype off                   " required!

" via http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !rm -rf ~/.vim/bundle
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source ~/.vim/bundles.vim

command! -nargs=? CommandTRakeMake !sh -c 'cd ~/.vim/bundle/command-t && rake make'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
    :CommandTRakeMake
endif

filetype plugin indent on     " required!
