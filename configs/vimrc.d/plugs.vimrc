" Plugins
function! LoadEnvPlugs()
    if filereadable(expand("~/.vimrc.d/specific.plugs.vimrc"))
        source ~/.vimrc.d/specific.plugs.vimrc
    endif
endfunction

function! LoadNvimPlugs()
    source ~/.vimrc.d/nvimplugs.vimrc
endfunction

call plug#begin()
    " NERDTree

    if has('nvim')
        call LoadNvimPlugs()
    else
        Plug 'preservim/nerdtree'
    endif

    " i3 syntax highlighting
    Plug 'PotatoesMaster/i3-vim-syntax'

    " autoclose
    Plug 'jiangmiao/auto-pairs'

    " hyprland syntax
    Plug 'theRealCarneiro/hyprland-vim-syntax'

    " Syntax highlighting for different programming languages
    Plug 'elzr/vim-json'

    " Git integration
    Plug 'vim-denops/denops.vim'
    Plug 'tennashi/gitsign.vim'
    
    Plug 'tpope/vim-fugitive'

    " Colorschemes
    Plug 'sickill/vim-monokai'
    Plug 'tomasr/molokai'
    call  LoadEnvPlugs()

call plug#end()


