let g:ale_disable_lsp = 1

let g:ale_set_signs = 0


let g:ale_fixers= {
\   'python': [
\       'add_blank_lines_for_python_control_statements',
\       'autoflake',
\       'autoimport',
\       'black',
\       'isort',
\
\   ],
\   '*': [
\       'remove_trailing_lines',
\       'trim_whitespace',
\   ],
\}
let g:ale_fix_on_save = 1

let g:ale_rust_cargo_use_clippy = 1

let g:ale_hover_cursor = 0
let g:ale_cursor_detail = 1
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
