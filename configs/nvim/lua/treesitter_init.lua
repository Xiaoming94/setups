require('nvim-treesitter.config').setup({
    ensure_installed = {
        "c",
        "cpp",
        "css",
        "ruby",
        "rust",
        "python",
        "lua",
        "vim",
        "markdown",
    },

    sync_install = false,
    auto_install = true,
})
