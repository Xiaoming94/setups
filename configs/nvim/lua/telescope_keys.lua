-- Setup Telescope
local telescope = require("telescope")

local telescope_actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-s>"] = telescope_actions.select_vertical,
                ["<C-x>"] = telescope_actions.select_horizontal,
            },
        },
    },
    extensions = {
        live_grep_args = {
            auto_quoting = false,
            -- keybinds
            mappings = {
                i = {
                },
            },
        },
    },
})

telescope.load_extension("live_grep_args")

-- Keybinds for Telescope

local builtin = require("telescope.builtin")

vim.keymap.set('n', 'Tf', builtin.find_files, {})
vim.keymap.set('n', 'Tgn', builtin.live_grep, {})
vim.keymap.set("n", 'Tga', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
vim.keymap.set('n', 'Tb', builtin.buffers, {})
vim.keymap.set('n', 'Th', builtin.help_tags, {})
vim.keymap.set('n', 'Tli', builtin.lsp_implementations, {})
vim.keymap.set('n', 'Tld', builtin.lsp_definitions, {})
vim.keymap.set('n', 'Tlr', builtin.lsp_references, {})
