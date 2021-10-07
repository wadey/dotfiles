"color jellybeans
"hi User1 guifg=#90ff90 guibg=#333333 " Fugitive

" GUI Option to remove the Toolbar (T)
" set guioptions-=T

" set guicursor+=a:blinkon0 " Stop cursor blinking

" Use console dialogs when possible
" set guioptions+=c

set guioptions=gecm

" Number of horizontal lines on the screen
set lines=60

"highlight Normal guibg=grey90
"highlight Cursor guibg=green guifg=NONE
"highlight Constant guibg=grey90
"highlight Special gui=NONE guibg=grey90
"highlight StatusLine gui=bold guifg=white guibg=blue
setlocal cul

if has("gui_macvim")
    "set guifont=Menlo:h12
    "set guifont=Source\ Code\ Pro\ Semibold:h12
    "set guifont=Source\ Code\ Pro:h12
    "set guifont=Fira\ Code:h12
    "set guifont=Hasklig:h12
    "set macligatures
    set guifont=Source\ Code\ Pro:h12
    set transparency=1

    macmenu File.Open\ Tab\.\.\.<Tab>:tabnew key=<D-M-t>
    macmenu File.New\ Tab key=<D-S-t>
    macmenu File.Print key=<nop>
    nmap <D-t> :CtrlP<CR>
    nmap <D-p> :CtrlP<CR>
    nmap <D-P> :CtrlPMRU<CR>
else
    set guifont=Source\ Code\ Variable\ 12

    if has("clipboard")
        " CTRL-X and SHIFT-Del are Cut
        "vnoremap <C-S-X> "+x
        vnoremap <S-Del> "+x

        " CTRL-C and CTRL-Insert are Copy
        "vnoremap <C-S-C> "+y
        vnoremap <C-Insert> "+y

        " CTRL-V and SHIFT-Insert are Paste
        map <C-M-V>           "+gP
        map <S-Insert>              "+gP

        "cmap <C-S-V>          <C-R>+
        cmap <S-Insert>             <C-R>+
    endif

    " Pasting blockwise and linewise selections is not possible in Insert and
    " Visual mode without the +virtualedit feature.  They are pasted as if they
    " were characterwise instead.
    " Uses the paste.vim autoload script.
    " Use CTRL-G u to have CTRL-Z only undo the paste.

    if 1
        exe 'inoremap <script> <C-M-V> <C-G>u' . paste#paste_cmd['i']
        exe 'vnoremap <script> <C-M-V> ' . paste#paste_cmd['v']
    endif

    imap <S-Insert>         <C-M-V>
    vmap <S-Insert>         <C-M-V>

    nmap <C-M-P> :CtrlPMRU<CR>
endif
