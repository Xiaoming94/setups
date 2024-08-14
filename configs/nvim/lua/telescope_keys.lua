-- Setup Telescope
local telescope = require("telescope")

local telescope_actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-s>"] = telescope_actions.select_vertical,
            },
        },
    },
})

telescope.load_extension("live_grep_args")

-- Keybinds for Telescope

local builtin = require("telescope.builtin")

vim.keymap.set('n', 'Tf', builtin.find_files, {})
vim.keymap.set('n', 'Tg', builtin.live_grep, {})
vim.keymap.set('n', 'Tb', builtin.buffers, {})
vim.keymap.set('n', 'Th', builtin.help_tags, {})
