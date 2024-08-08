
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait
        }
    end

    api.config.mappings.default_on_attach()
    
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,           opts('help'))
    vim.keymap.set('n', '<C-s>', api.node.open.vertical,         opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-i>', api.node.open.horizontal,       opts('Open: Horizontal Split'))

end

-- Enable Nvim-tree
require("nvim-tree").setup({
    on_attach = my_on_attach,

    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

-- Keybinds for nvimTree
vim.keymap.set('n', '<C-g>t',
    function()
        vim.cmd("NvimTreeToggle")
    end)

vim.keymap.set('n', '<C-g>f',
    function()
        vim.cmd("NvimTreeFindFile")
    end)
