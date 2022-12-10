set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Theme
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

" Lsp / Mason / LSP Status
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'williamboman/mason.nvim'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ???
set completeopt=menu,menuone,noselect

lua<<EOF
	-- Init Mason
	require("mason").setup()

	-- Init LSP Servers
	require'lspconfig'.clangd.setup{}

	  -- Set up nvim-cmp.
  	local cmp = require'cmp'

	cmp.setup({
    	snippet = {
     		-- REQUIRED - you must specify a snippet engine
	      	expand = function(args)
		  	vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
   	     	-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        	-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        	-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      	end,
    	},
    	window = {
      		completion = cmp.config.window.bordered(),
      		documentation = cmp.config.window.bordered(),
    	},
   		mapping = cmp.mapping.preset.insert({
      		['<C-b>'] = cmp.mapping.scroll_docs(-4),
      		['<C-f>'] = cmp.mapping.scroll_docs(4),
      		['<C-Space>'] = cmp.mapping.complete(),
	    	['<C-e>'] = cmp.mapping.abort(),
   	   		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    	}),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  
  -- Enable clangd
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }

EOF

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

