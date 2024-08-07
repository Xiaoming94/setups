-- Keybinds for Telescope

local builtin = require("telescope.builtin")

vim.keymap.set('n', 'Tf', builtin.find_files, {})
vim.keymap.set('n', 'Tg', builtin.live_grep, {})
vim.keymap.set('n', 'Tb', builtin.buffers, {})
vim.keymap.set('n', 'Th', builtin.help_tags, {})
