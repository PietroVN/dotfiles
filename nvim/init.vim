" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-lua/completion-nvim'
Plug 'cdelledonne/vim-cmake'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Set tabstop to 4 spaces
set tabstop=4

" Tab to space
"set expandtab ts=4 sw=4 ai

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

" Enable number on sidebar
set number

" Enable onedark theme
colorscheme onedark

" Lightline theme
let g:lightline = {
\ 'colorscheme': 'onedark',
\ }

" CMake
let g:cmake_build_dir_location = "./build"

" Autostart NERDtree
autocmd VimEnter * NERDTree

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Disable auto pop-up
let g:completion_enable_auto_popup = 0

" Use tab to trigger auto completion
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

lua << EOF
-- Enable ccls and set-up auto-complete, cmake compilation db directory
require 'lspconfig'.ccls.setup {
	on_attach=require'completion'.on_attach,
	init_options = {
	   compilationDatabaseDirectory = "build/Debug",
	},
}
-- Enable gdscript and set-up auto-complete 
require'lspconfig'.gdscript.setup{
	on_attach=require'completion'.on_attach	
}
EOF
