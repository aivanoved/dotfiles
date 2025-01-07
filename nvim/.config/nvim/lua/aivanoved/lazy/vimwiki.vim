let usual = {}
let usual.path = '$HOME/vimwiki'
let usual.syntax = 'markdown'
let usual.ext = '.md'

let obsidian_dev = {}
let obsidian_dev.path = '$HOME/obsidian/dev'
let obsidian_dev.syntax = 'markdown'
let obsidian_dev.ext = '.md'

let obsidian_personal = {}
let obsidian_personal.path = '$HOME/obsidian/personal'
let obsidian_personal.syntax = 'markdown'
let obsidian_personal.ext = '.md'

let obsidian_work = {}
let obsidian_work.path = '$HOME/obsidian/work'
let obsidian_work.syntax = 'markdown'
let obsidian_work.ext = '.md'

let g:vimwiki_list = [usual, obsidian_dev, obsidian_personal, obsidian_work]

let g:vimwiki_global_ext = 0
