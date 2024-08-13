local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup{
    cmd = {
        "clangd",
        "-j=4",
        "--background-index",
        "--all-scopes-completion",
        "--header-insertion=never",
        "--recovery-ast",
        "--pch-storage=disk",
        "--suggest-missing-includes",
        "--log=info",
        "--clang-tidy",
        "--enable-config"
    },

    capabilities = capabilities
}
