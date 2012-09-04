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

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'wadey/vim-javascript'
Bundle 'tsaleh/vim-supertab'
Bundle 'vim-scripts/tComment'
Bundle 'int3/vim-taglist-plus'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'plasticboy/vim-markdown'
Bundle 'rson/vim-conque'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'tpope/vim-unimpaired'
Bundle 'bmatheny/vim-scala'
Bundle 'mjwall/clj-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'sprsquish/thrift.vim'
Bundle 'git://git.wincent.com/command-t.git'

Bundle 'Puppet-Syntax-Highlighting'
Bundle 'JSON.vim'
Bundle 'IndexedSearch'
Bundle 'guicolorscheme.vim'

command! -nargs=? CommandTRakeMake !sh -c 'cd ~/.vim/bundle/command-t && rake make'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
    :CommandTRakeMake
endif

filetype plugin indent on     " required!
