-- Configurations

vim.g.blameLineUseVirtualText = 1
vim.g.blameLineVirtualTextHighlight = 'Comment'
vim.g.blameLineVirtualTextFormat = '%s'
vim.g.blameLineGitFormat = '%cn | %h | %s'
vim.g.blameLineMessageWhenNotYetCommited = 'uncommitted'

-- keybinds

vim.keymap.set('n','Gb', ":ToggleBlameLine<CR>", {})

