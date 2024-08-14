local lsp = vim.lsp

-- Code snippet stolen from neovim documentation

vim.api.nvim_create_autocmd("LspAttach",{
    callback = function(args)
        local bufnr = args.buf
        local client = lsp.get_client_by_id(args.data.client_id)
        if client.supports_method("textDocument/completion") then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.supports_method("textDocument/definition") then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end
        vim.keymap.set('n', '<C-p>', function()
            vim.lsp.buf.hover()
        end)
    end
})

vim.api.nvim_create_autocmd("LspDetach", {
    callback = function(args)
        local client = lsp.get_client_by_id(args.data.client_id)
        -- PlaceHolders??
        vim.cmd("setlocal tagfunc< omnifunc<")
    end
})
