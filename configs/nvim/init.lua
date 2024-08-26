-- Source vanilla vimrc
local vim = vim

vim.cmd("source ~/.vimrc")

-- import plugin configurations
require("init_nvim_tree")
require("colorizer_init")
require("auto_session_init")
--- require("minimap_init")
require("telescope_keys")
require("nvim_cmp_init")
require("markdown_render_init")
require("gitsigns_init")

-- LSP stuff 
require("lsp/common_functions")
require("lsp/clangd_conf")
require("lsp/rust_analyzer_conf")
require("lsp/lua_lsp_conf")
require("lsp/pyright_conf")


-- set tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set g options
vim.g.airline_powerline_fonts=1

-- Keybinds

-- colorscheme
require("colorscheme_helper").set_colorscheme("synthweave")

