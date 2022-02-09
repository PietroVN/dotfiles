set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Set tabstop to 4 spaces
set tabstop=4
set shiftwidth=4

" Custom colors
let g:onedark_color_overrides = {
      \ "background":  { "gui": "#fffffff", "cterm": "0", "cterm16": "0" },
      \ "red":         { "gui": "#ff4046",  "cterm": "0", "cterm16": "0" },
      \ "dark_red":    { "gui": "#cf363a",  "cterm": "0", "cterm16": "0" },
      \ "green":       { "gui": "#50ff40",  "cterm": "0", "cterm16": "0" },
      \ "yellow":      { "gui": "#f9ff40",  "cterm": "0", "cterm16": "0" },
      \ "dark_yellow": { "gui": "#bbbf2e",  "cterm": "0", "cterm16": "0" },
      \ "blue":        { "gui": "#4043ff",  "cterm": "0", "cterm16": "0" },
      \ "purple":      { "gui": "#a640ff",  "cterm": "0", "cterm16": "0" },
      \ "cyan":        { "gui": "#40bcff",  "cterm": "0", "cterm16": "0" },
      \ "white":       { "gui": "#c9c9c9",  "cterm": "0", "cterm16": "0" },
      \ "black":       { "gui": "#000000",  "cterm": "0", "cterm16": "0" },
\}

" True color support
set termguicolors

" Disable line break
set nowrap

" Enable number on sidebar
set number

" Set 256 colors
let g:onedark_termcolors = 256

" Enable onedark theme
colorscheme onedark

" Lightline theme
let g:lightline = {
\ 'colorscheme': 'onedark',
\ }

