-- Source vanilla vimrc
local vim = vim

vim.cmd("source ~/.vimrc")

-- import plugin configurations
require("init_nvim_tree")
require("colorizer_init")
require("auto_session_init")

-- LSP stuff 
require("lsp/clangd_conf")


-- set tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set g options
vim.g.airline_powerline_fonts=1

-- Keybinds
vim.keymap.set("n", "<C-g>",
    function()
        vim.cmd("NvimTreeToggle")
    end)

vim.cmd("colorscheme flow")
 
