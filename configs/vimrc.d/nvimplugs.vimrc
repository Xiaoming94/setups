" Session manager
Plug 'rmagatti/auto-session'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

" Programming tools
Plug 'neovim/nvim-lspconfig' " LSP integration for QOL

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/nvim-cmp'

" Vim Airlines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File Explorer like NerdTree
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'

" Nvim specific colorschemes
Plug '0xstepit/flow.nvim'

" Color Preview
Plug 'norcalli/nvim-colorizer.lua'

" Colorpicker

" Markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Minimap
Plug 'wfxr/minimap.vim'
