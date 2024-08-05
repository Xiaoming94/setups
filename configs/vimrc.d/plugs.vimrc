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
        " Color previewer
        Plug 'BourgeoisBear/clrzr'

        " Load YCM if there is python3
        if has('python3')
            Plug 'ycm-core/YouCompleteMe'
        endif
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
    Plug 'mhinz/vim-signify'         " Showing edits and diffs
    Plug 'tpope/vim-fugitive'        " Git command integrations
    Plug 'rhysd/conflict-marker.vim' " Visualising Merge conflicts
    
    " Colorschemes
    Plug 'sickill/vim-monokai'
    Plug 'tomasr/molokai'
    Plug 'dracula/vim'
    call  LoadEnvPlugs()

call plug#end()


