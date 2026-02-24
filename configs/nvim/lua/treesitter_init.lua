require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "c",
        "cpp",
        "css",
        "rust",
        "python",
        "lua",
        "vim",
        "markdown",
        "doxygen",
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
    },
})
