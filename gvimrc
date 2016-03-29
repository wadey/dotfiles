"color jellybeans
"hi User1 guifg=#90ff90 guibg=#333333 " Fugitive

set transparency=1

"set guifont=Menlo:h12
"set guifont=Source\ Code\ Pro\ Semibold:h12
"set guifont=Source\ Code\ Pro:h12
"set guifont=Fira\ Code:h12
set guifont=Hasklig:h12

set macligatures

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

macmenu File.Open\ Tab\.\.\.<Tab>:tabnew key=<D-M-t>
macmenu File.New\ Tab key=<D-S-t>
macmenu File.Print key=<nop>
nmap <D-t> :CtrlP<CR>
nmap <D-p> :CtrlP<CR>
nmap <D-P> :CtrlPMRU<CR>
