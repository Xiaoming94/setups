" Plugins
function! LoadEnvPlugs()
    if filereadable(expand("~/.vimrc.d/specific.plugs.vimrc"))
        source ~/.vimrc.d/specific.plugs.vimrc
    endif
endfunction

call plug#begin()
    " NERDTree
    Plug 'preservim/nerdtree'

    " i3 syntax highlighting
    Plug 'PotatoesMaster/i3-vim-syntax'

    " autoclose
    Plug 'jiangmiao/auto-pairs'
    
    " Syntax highlighting for different programming languages
    Plug 'elzr/vim-json'
 
    " Colorschemes
    Plug 'sickill/vim-monokai'
    Plug 'tomasr/molokai'
    call  LoadEnvPlugs()

call plug#end()

