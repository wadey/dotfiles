let mapleader = ","

source ~/.vim/plug.vim

syntax enable               "syntax highlighting

set bg=dark                 "for dark background consoles

set tabstop=4               "tab = 4 spaces
set softtabstop=4           "tab = 4 spaces
set shiftwidth=4            "tab = 4 spaces
set expandtab               "turn tabs in spaces

set number

nnoremap / /\v
vnoremap / /\v
nnoremap Y y$
nnoremap Q gq
set ignorecase              "ignore case in searches
set smartcase
set hlsearch                "highlight search items"

set modeline                "read modeline from files"
set modelines=5             "look for modelines in first 5 lines"

set copyindent              "copy the previous indentation on autoindenting
set hidden                  "hide buffers instead of closing them

"" wrapping stuff
set wrap
set textwidth=0             "When wrapping is off, break lines at 78 chars
set formatoptions=qrn1
set breakindent

color jellybeans

set colorcolumn=80
hi ColorColumn ctermbg=black guibg=grey10

set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc,*.class,.git,node_modules,lib-cov

" use unicode in listchars
" https://github.com/tpope/vim-sensible/pull/58/files
if !has('win32') && &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif

"" Folding
set foldmethod=indent       "fold based on identation 
set nofen                   "open all folds initially

"" some system specific commmands
if has("mac")
    iab  rtime   <ESC>:r!gdate -R<CR>i<BS><ESC>A
elseif has("unix")
    iab  rtime   <ESC>:r!date -R<CR>i<BS><ESC>A
endif

"" toggle margins
nmap ;L ;on-m
nnoremap ;off-m     :set textwidth=0\|nmap ;L ;on-m<CR>
nnoremap ;on-m      :set textwidth=78\|nmap ;L ;off-m<CR>

" Change <tab>s to spaces
nnoremap ;T :retab<CR>

nnoremap j gj
nnoremap k gk

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

"" F key toggles
nnoremap <F7>   :set relativenumber!<CR>
nnoremap <F9>   :set wrap!<CR>

nnoremap <F11>  :wa!<CR>:!aspell -c --dont-backup "%"<CR>:e! "%"<CR><CR>
nnoremap <F12>  :wa!<CR>:make<CR>

let g:SuperTabDefaultCompletionType = "context"

set verbose=0

set list
nnoremap <silent> <leader>s :set list!<CR>
nnoremap <silent> <leader>n :silent :nohlsearch<CR>
nnoremap . .`[

augroup vimrc_autocmds
    autocmd!
    autocmd BufRead,BufNewFile *.thrift set filetype=thrift

    autocmd FileType qf setlocal colorcolumn=0 nolist nocursorline nowrap

    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist

    " http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
augroup END

" Removes trailing spaces
command! TrimWhiteSpace %s/\v\s+$//

" SaveasSamePath saves with new name to same path (all one line)
" via http://vim.1045645.n5.nabble.com/How-to-make-saveas-default-to-original-file-s-directory-td2827361.html
command! -nargs=1 SaveasSamePath exe "saveas " . expand("%:p:h") . "/" . expand("<args>")

" Makes it easy to run a shells
" example: can do ":Node %" to run the current file
command! -nargs=* -complete=file Shell terminal <args>
command! -nargs=* -complete=file Zsh terminal zsh <args>
command! -nargs=* -complete=file Node terminal node <args>
command! -nargs=* -complete=file Python terminal python3 <args>

" use python json to Tidy a file
command! -range=% -nargs=* Json <line1>,<line2>!python3 -m json.tool <args>

" Support xterm mouse
set mouse=a

" A motion for the current match.
" Lets you do "ci/" to change the current match
" via http://stackoverflow.com/a/8697727/544243
vnoremap <silent> i/ :<c-u>call SelectMatch()<cr>
onoremap <silent> i/ :call SelectMatch()<cr>
function! SelectMatch()
    if search(@/, 'bcW')
        norm! v
        call search(@/, 'ceW')
    else
        norm! gv
    endif
endfunction

" For vim-gitgutters
highlight clear SignColumn

if has("unix")
  set directory=~/.vim/swap//
  set backupdir=~/.vim/backup//
  set undodir=~/.vim/undo//
  set undofile
endif

" For vim-airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_c='%{fnamemodify(getcwd(), ":t")} %f%m'
" let g:airline#extensions#tabline#enabled = 1

" vim-go
" au FileType go nmap gd <Plug>(go-def)

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" YouCompleteMe
"let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsListSnippets="<c-s-tab>"

function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
