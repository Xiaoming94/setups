-- Source vanilla vimrc
local vim = vim
local o = vim.opt

vim.cmd("source ~/.vimrc")

-- import plugin configurations
require("init_nvim_tree")

-- set g options
vim.g.airline_powerline_fonts=1

-- Keybinds
vim.keymap.set("n", "<C-g>",
    function()
        vim.cmd("NvimTreeToggle")
    end)

vim.cmd("colorscheme dracula")
