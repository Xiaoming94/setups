-- Configurations

vim.g.blameLineUseVirtualText = 1
vim.g.blameLineVirtualTextHighlight = 'Comment'
vim.g.blameLineVirtualTextFormat = '%s'
vim.g.blameLineGitFormat = '%cn | %h | %ar | %s'
vim.g.blameLineMessageWhenNotYetCommited = 'uncommitted'

-- keybinds

vim.keymap.set('n', 'Gb', ":ToggleBlameLine<CR>", {})
