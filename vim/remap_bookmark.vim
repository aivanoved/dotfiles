let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap <leader>m<space> <Plug>BookmarkToggle
    nmap <leader>mi <Plug>BookmarkAnnotate
    nmap <leader>ma <Plug>BookmarkShowAll
    nmap <leader>mj <Plug>BookmarkNext
    nmap <leader>mk <Plug>BookmarkPrev
    nmap <leader>mc <Plug>BookmarkClear
    nmap <leader>mx <Plug>BookmarkClearAll
    nmap <leader>mkk <Plug>BookmarkMoveUp
    nmap <leader>mjj <Plug>BookmarkMoveDown
    nmap <leader>mg <Plug>BookmarkMoveToLine
endfunction
function! BookmarkUnmapKeys()
    unmap m<space>
    unmap mi
    unmap ma
    unmap mj
    unmap mk
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
    nmap mg
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
