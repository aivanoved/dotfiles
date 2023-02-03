" air-line
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_theme='sonokai'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#cursormode#enabled = 1
let g:cursormode_color_map = {
\ "nlight": '#000000',
\ "ndark": '#BBBBBB',
\ "i": g:airline#themes#{g:airline_theme}#palette.insert.airline_a[1],
\ "R": g:airline#themes#{g:airline_theme}#palette.replace.airline_a[1],
\ "v": g:airline#themes#{g:airline_theme}#palette.visual.airline_a[1],
\ "V": g:airline#themes#{g:airline_theme}#palette.visual.airline_a[1],
\ "\<C-V>": g:airline#themes#{g:airline_theme}#palette.visual.airline_a[1],
\ }


let g:airline#extensions#hunks#coc_git = 1

let g:airline#extensions#zoomwintab#enabled = 1

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
