color twilight

set transparency=1

set guifont=Menlo:h12

" GUI Option to remove the Toolbar (T)
set guioptions-=T

" set guicursor+=a:blinkon0 " Stop cursor blinking

" Use console dialogs when possible
set guioptions+=c

" Number of horizontal lines on the screen
set lines=60

"highlight Normal guibg=grey90
"highlight Cursor guibg=green guifg=NONE
"highlight Constant guibg=grey90
"highlight Special gui=NONE guibg=grey90
"highlight StatusLine gui=bold guifg=white guibg=blue
setlocal cul

macm File.Open\ Tab\.\.\.<Tab>:tabnew key=<D-M-t>
macm File.New\ Tab key=<D-S-t>
nmap <D-t> :CommandT<CR>
