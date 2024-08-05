" Programming tools
Plug 'neovim/nvim-lspconfig' " LSP integration for QOL

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
