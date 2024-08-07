vim.g.minimap_width = 10

-- Setting Keybindings for showing the minimap for 
vim.keymap.set("n", "<C-m>", -- Ctrl + M
    function()
        vim.cmd("MinimapToggle")
    end)
