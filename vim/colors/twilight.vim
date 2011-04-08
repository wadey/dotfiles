" Maintainer: Yoshimasa NIWA<niw@disense.com>
" Last Change: 14 Jun 2006
" w/ Modifications by Wade Simmons

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="twilight"

hi Normal         guifg=#F8F8F8           guibg=#141414
hi Cursor         guifg=#F8F8F8           guibg=#A7A7A7
hi CursorIM       guifg=#F8F8F8           guibg=#5F5A60
hi Directory      guifg=#8F9D6A           guibg=#141414
hi ErrorMsg       guifg=#CF6A4C           guibg=#420E09
hi VertSplit      guifg=#AC885B           guibg=#FFFFFF
hi Folded         guifg=#F9EE98           guibg=#494949
hi IncSearch      guifg=#000000           guibg=#CF6A4C
hi LineNr         guifg=#7587A6           guibg=#000000
hi ModeMsg        guifg=#CF7D34           guibg=#E9C062
hi MoreMsg        guifg=#CF7D34           guibg=#E9C062
hi NonText        guifg=#D2A8A1           guibg=#141414
hi Question       guifg=#7587A6           guibg=#0E2231
hi Search         guifg=#420E09           guibg=#CF6A4C
hi SpecialKey     guifg=#CF7D34           guibg=#141414
hi StatusLine     guifg=#0E2231           guibg=#8693A5
hi StatusLineNC   guifg=#7587A6           guibg=#F8F8F8
hi Title          guifg=#8B98AB           guibg=#0E2231
hi Visual         guifg=#0E2231           guibg=#AFC4DB
hi WarningMsg     guifg=#CF6A4C           guibg=#420E09
hi WildMenu       guifg=#AFC4DB           guibg=#0E2231

"Syntax hilight groups

hi Comment        guifg=#8F9D6A
hi Constant       guifg=#CF6A4C
hi String         guifg=#8F9D6A
hi Character      guifg=#E9C062
hi Number         guifg=#9B859D
hi Boolean        guifg=#CF6A4C
hi Float          guifg=#562D56
hi Identifier     guifg=#9B703F
hi Function       guifg=#9B5C2E
hi Statement      guifg=#CF7D34
hi Conditional    guifg=#9B703F
hi Repeat         guifg=#F0E68C
hi Label          guifg=#E9C062
hi Operator       guifg=#CF6A4C
hi Keyword        guifg=#E9C062
hi Exception      guifg=#F0E68C
hi PreProc        guifg=#8B864E
hi Include        guifg=#8B864E
hi Define         guifg=#FFF68F
hi Macro          guifg=#9B703F
hi PreCondit      guifg=#CDC673
hi Type           guifg=#CDC673
hi StorageClass   guifg=#D2B48C
hi Structure      guifg=#B8860B
hi Typedef        guifg=#CDC673
hi Special        guifg=#CD5C5C
hi SpecialChar    guifg=#B8860B
hi Tag            guifg=#BDB76B
hi Delimiter      guifg=#B8860B
hi SpecialComment guifg=#FFF8DC
hi Debug          guifg=#A52A2A
hi Underlined     guifg=#Cf6A4C
hi Ignore         guifg=#494949
hi Error          guifg=#CF6A4C    guibg=#420E09
hi Todo           guifg=#7587A6    guibg=#0E2231
hi Pmenu          guifg=#141414    guibg=#CDA869
hi PmenuSel       guifg=#F8F8F8    guibg=#9B703F
hi PmenuSbar      guibg=#DAEFA3
hi PmenuThumb     guifg=#8F9D6A

hi NonText        guibg=#1A1A1A
hi CursorLine     guibg=#1A1A1A
hi ColorColumn    guibg=#1A1A1A
