-- Plugins will be downloaded under the specified directory.
vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')

-- Theme
vim.fn['plug#']( 'itchyny/lightline.vim' )
vim.fn['plug#']( 'joshdick/onedark.vim' )

-- TreeSitter
vim.fn['plug#']( 'nvim-treesitter/nvim-treesitter' )
--, { ['do'] = vim.fn['plug#']( ':TSUpdate' ) } )

-- List ends here. Plugins become visible to Vim after this call.
vim.fn['plug#end']()

-- Set tabstop to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Custom colors
vim.g.onedark_color_overrides = {
      background =  { gui = "#fffffff", cterm = "0", cterm16 = "0" },
      red =         { gui = "#ff4046",  cterm = "0", cterm16 = "0" },
      dark_red =    { gui = "#cf363a",  cterm = "0", cterm16 = "0" },
      green =       { gui = "#50ff40",  cterm = "0", cterm16 = "0" },
      yellow =      { gui = "#f9ff40",  cterm = "0", cterm16 = "0" },
      dark_yellow = { gui = "#bbbf2e",  cterm = "0", cterm16 = "0" },
      blue =        { gui = "#4043ff",  cterm = "0", cterm16 = "0" },
      purple =      { gui = "#a640ff",  cterm = "0", cterm16 = "0" },
      cyan =        { gui = "#40bcff",  cterm = "0", cterm16 = "0" },
      white =       { gui = "#c9c9c9",  cterm = "0", cterm16 = "0" },
      black =       { gui = "#000000",  cterm = "0", cterm16 = "0" },
}

-- True color support
vim.opt.termguicolors = true

-- Disable line break
vim.opt.wrap = false

-- Enable number on sidebar
vim.opt.number = true

-- Set 256 colors
vim.g.onedark_termcolors = 256

-- Enable onedark theme
vim.cmd('colorscheme onedark')

-- Lightline theme
vim.g.lightline = {
    colorscheme = 'onedark'
}

