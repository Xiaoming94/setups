-- Source vanilla vimrc
local vim = vim

vim.cmd("source ~/.vimrc")

-- import plugin configurations
require("init_nvim_tree")
require("colorizer_init")
require("auto_session_init")
require("minimap_init")
require("telescope_keys")
require("nvim_cmp_init")

-- LSP stuff 
require("lsp/common_functions")
require("lsp/clangd_conf")
require("lsp/rust_analyzer_conf")
require("lsp/lua_lsp_conf")


-- set tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set g options
vim.g.airline_powerline_fonts=1

-- Keybinds

vim.cmd("colorscheme flow")

