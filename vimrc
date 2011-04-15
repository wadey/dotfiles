set nocompatible            "enable new vim-only features

" Needed on some linux distros.
" see
" http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
"if exists("*pathogen#helptags")
    filetype off 
    call pathogen#helptags()
    call pathogen#runtime_append_all_bundles()
"endif
filetype plugin indent on

syntax enable               "syntax highlighting

set bg=dark                 "for dark background consoles

set tabstop=4               "tab = 4 spaces
set softtabstop=4           "tab = 4 spaces
set shiftwidth=4            "tab = 4 spaces
set expandtab               "turn tabs in spaces
set smarttab                "be smart about deleting tab space, etc

set backspace=2             "allow 'normal' backspacing
set ruler                   "display current position in status line
set autoindent              "indent to the level of the previous line
set laststatus=2
if exists("&relativenumber")
    set relativenumber
endif
if exists("&undofile")
    set undofile
    set undodir=~/.vimundo
endif

set showmatch               "display matching parentheses
set showmode                "display the active mode in status line
set showcmd                 "display key commands in status line
"set showbreak=+             "display '-> ' before wrapped lines

nnoremap / /\v
vnoremap / /\v
set ignorecase              "ignore case in searches
set smartcase
set gdefault
set incsearch               "highlight search matches as you type them
set hlsearch                "highlight search items"

set modeline                "read modeline from files"
set modelines=5             "look for modelines in first 5 lines"

set copyindent              "copy the previous indentation on autoindenting
set hidden                  "hide buffers instead of closing them

"" wrapping stuff
set wrap
set display+=lastline       "display the last line, even if it doesnt fit
set textwidth=0             "When wrapping is off, break lines at 78 chars
set formatoptions=qrn1
if exists("&colorcolumn")
    set colorcolumn=80,81,82
    hi ColorColumn ctermbg=black guibg=grey10
endif

set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git

"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
set listchars=tab:▸\ ,eol:¬

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
if has("mac")
    iab  rtime   <ESC>:r!gdate -R<CR>i<BS><ESC>A
elseif has("unix")
    iab  rtime   <ESC>:r!date -R<CR>i<BS><ESC>A
endif
    

"" toggle margins
map ;L ;on-m
map ;off-m      :set textwidth=0\|map ;L ;on-m<CR>
map ;on-m       :set textwidth=78\|map ;L ;off-m<CR>

" Change <tab>s to spaces
map ;T :retab<CR>

nnoremap j gj
nnoremap k gk

"" GNU readline bindings
map <C-A>   <Home>
map <C-E>   <End>
map <C-F>   <Right>
map <C-B>   <Left>
map <ESC>b  <S-Left>
map <ESC>f <S-Right>

"" F key toggles
map <F7>    :set relativenumber!<CR>
map <F8>    :set paste!<CR>
map <F9>    :set wrap!<CR>

map <F10>   :Tlist<CR>
map <F11>   :wa!<CR>:!aspell -c --dont-backup "%"<CR>:e! "%"<CR><CR>
map <F12>   :wa!<CR>:make<CR>

"" smart tab completion
" function! Smart_TabComplete()
"   let line = getline('.')                         " curline
"   let substr = strpart(line, -1, col('.'))      " from start to cursor
"   let substr = matchstr(substr, "[^ \\t]*$")       " word till cursor
"   if (strlen(substr)==0)                          " nothing to match on empty string
"     return "\\<tab>"
"   endif
"   let has_period = match(substr, '\\.') != -1      " position of period, if any
"   let has_slash = match(substr, '\\/') != -1       " position of slash, if any
"   if (!has_period && !has_slash)
"     return "\\<C-X>\\<C-P>"                         " existing text matching
"   elseif ( has_slash )
"     return "\\<C-X>\\<C-F>"                         " file matching
"   else
"     return "\\<C-X>\\<C-O>"                         " plugin matching
"   endif
" endfunction
" :inoremap <Tab> <C-R>=Smart_TabComplete()<CR>

" The <CR> key should select from completion menu without adding a newline
"imap <expr> <CR> pumvisible() ? "<C-Y>" : "<CR>"
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"let g:SuperTabDefaultCompletionType = "context"

set verbose=0

"set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nmap . .`[

cmap w!! w !sudo tee % >/dev/null

" GIT
" set laststatus=2
" set statusline=%<%f[%{GitBranch()}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P

au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.json set filetype=json

if has("autocmd")
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
endif

" Removes trailing spaces
command TrimWhiteSpace %s/\v\s+$//

if (&t_Co == 256 || &t_Co == 88) && !has('gui_running')
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  runtime! bundle/guicolorscheme/plugin/guicolorscheme.vim
  GuiColorScheme twilight
endif

" Support xterm mouse
set mouse=a
