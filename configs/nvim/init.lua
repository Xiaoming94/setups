-- Source vanilla vimrc
local vim = vim
vim.cmd("source ~/.vimrc")

-- import plugin configurations
require("init_nvim_tree")

-- Keybinds
vim.keymap.set("n", "<C-g>",
    function()
        vim.cmd("NvimTreeToggle")
    end)
