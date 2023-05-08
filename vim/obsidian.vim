let g:vimsidian_path = $HOME . '/obsidian'
let g:vimsidian_complete_paths = [g:vimsidian_path]
let g:vimsidian_enable_link_stack = 1
let $VIMSIDIAN_PATH_PATTERN = g:vimsidian_path . '/*.md'

let g:vimsidian_use_fzf = 1

function! s:vimsidianNewNoteAtDevDirectory()
  execute ':VimsidianNewNote ' . g:vimsidian_path . '/dev'
endfunction

if executable('fzf')
  let g:vimsidian_use_fzf = 1
endif

augroup vimsidian_augroup
  au!
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sl :VimsidianFdLinkedNotesByThisNote<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sg :VimsidianRgNotesLinkingThisNote<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sm :VimsidianRgNotesWithMatchesInteractive<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> si :VimsidianRgLinesWithMatchesInteractive<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> st :VimsidianRgTagMatches<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> <C-k> :VimsidianMoveToLink<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sk :VimsidianMoveToPreviousLink<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sj :VimsidianMoveToNextLink<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sD :call <SID>vimsidianNewNoteAtDevDirectory()<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sO :VimsidianNewNoteInteractive<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sd :VimsidianDailyNote<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> sf :VimsidianFormatLink<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <buffer> <C-]> :VimsidianMoveToLink<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <silent> <C-t> :VimsidianMoveToPreviousEntryInLinkStack<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <silent> sn :VimsidianMoveToNextEntryInLinkStack<CR>
  au BufNewFile,BufReadPost $VIMSIDIAN_PATH_PATTERN nn <silent> ss :VimsidianLinkStack<CR>
  au WinEnter,BufEnter $VIMSIDIAN_PATH_PATTERN silent! call vimsidian#MatchBrokenLinks()
  au CursorMoved $VIMSIDIAN_PATH_PATTERN silent! call vimsidian#MatchCursorLink()
augroup END
