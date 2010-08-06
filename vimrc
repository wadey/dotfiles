set nocompatible            "enable new vim-only features

if version >= 700 
    setlocal nospell spelllang=en_us

    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
                    \   if &omnifunc == "" |
                    \           setlocal omnifunc=syntaxcomplete#Complete |
                    \   endif
    endif
endif

syntax enable               "syntax highlighting
filetype plugin indent on    "filetype specific plugins

set bg=dark                 "for dark background consoles
set tabstop=4               "tab = 4 spaces
set softtabstop=4           "tab = 4 spaces
set shiftwidth=4            "tab = 4 spaces
set backspace=2             "allow 'normal' backspacing
set expandtab               "turn tabs in spaces
set smarttab                "be smart about deleting tab space, etc
set showmatch               "display matching parentheses
set noignorecase            "don't ignore case in searches
set incsearch               "highlight search matches as you type them
set autoindent              "indent to the level of the previous line
set ruler                   "display current position in status line
set showmode                "display the active mode in status line
set showcmd                 "display key commands in status line
"set cindent                "Automatically indent according to 'C' rules
set hlsearch                "highlight search items"
set modeline                "read modeline from files"
set modelines=5             "look for modelines in first 5 lines"

"" wrapping stuff
set display+=lastline       "display the last line, even if it doesnt fit
set showbreak=+             "display '-> ' before wrapped lines
set textwidth=0             "When wrapping is off, break lines at 78 chars

"" TOhtml stuff
let html_use_css=1          "use css in HTML output
let use_xhtml=1             "use xhtml in HTML output

"" miniBufferExplorer stuff
let g:miniBufExplMapWindowNavVim = 1    "map <control> vim navigaiton keys
let g:miniBufExplMapWindowNavArrows = 1 "map <control> arrow keys
let g:miniBufExplMapCTabSwitchBufs = 1  "map <control> tab key
let g:miniBufExplModSelTarget = 1       "because I use taglist as well
"let g:miniBufExplForceSyntaxEnable = 1  "fix a bug with syntax in 6.3.1

"" Folding
set foldmethod=indent       "fold based on identation 
set nofen                   "open all folds initially

set printoptions=paper:letter,number:y

"" some system specific commmands
if has("unix")
    map ;d      :r!date<CR>i:"<ESC>"add@a
    ab  rdate    <ESC>:r!date +\%D<CR>i<BS><ESC>A
    ab  rtime    <ESC>:r!date +\%X<CR>i<BS><ESC>A
elseif has("win32")
    ab  rdate    <ESC>:r!date /T<CR>i<BS><ESC>A
    ab  rtime    <ESC>:r!time /T<CR>i<BS><ESC>A
endif
    

"" toggle margins
map ;L ;on-m
map ;off-m      :set textwidth=0\|map ;L ;on-m<CR>
map ;on-m       :set textwidth=78\|map ;L ;off-m<CR>

" Change <tab>s to spaces
map ;T :retab<CR>

"" GNU readline bindings
map <C-A>   <Home>
map <C-E>   <End>
map <C-F>   <Right>
map <C-B>   <Left>
map <ESC>b  <S-Left>
map <ESC>f <S-Right>

"" F key toggles
map <F7>    :set number!<CR>
map <F8>    :set paste!<CR>
map <F9>    :set wrap!<CR>

map <F10>   :Tlist<CR>
map <F11>   :wa!<CR>:!aspell -c --dont-backup "%"<CR>:e! "%"<CR><CR>
map <F12>   :wa!<CR>:make<CR>

"" smart tab completion
function! Smart_TabComplete()
  let line = getline('.')                         " curline
  let substr = strpart(line, -1, col('.'))      " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
:inoremap <Tab> <C-R>=Smart_TabComplete()<CR>

" The <CR> key should select from completion menu without adding a newline
imap <expr> <CR> pumvisible() ? "<C-Y>" : "<CR>"

if has("autocmd")
    autocmd FileType tex setlocal makeprg=latex\ %
    autocmd FileType tex map <F12>   :wa!<CR>:make<CR><CR>
    "autocmd Filetype c   map <F12>   :wa!<CR>:make<CR>
    "autocmd Filetype cpp map <F12>   :wa!<CR>:make<CR>
endif

set verbose=0

set wildmode=list:longest

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nmap . .`[

" GIT
" set laststatus=2
" set statusline=%<%f[%{GitBranch()}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P

au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim
"au! Syntax javascript source ~/.vim/javascript.vim
