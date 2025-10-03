-- Code snippet stolen from https://rust-analyzer.github.io/manual.html#vimneovim
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('rust_analyzer', {
    --    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    overrideCommand = {
                        "cargo",
                        "check",
                        "--message-format=json",
                    }
                },
                features = {
                    ssr,
                },
                loadOutDirsFromCheck = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    },
    capabilities = capabilities,
})

vim.lsp.enable('rust_analyzer')
