local lsp = vim.lsp

local function preview_location_callback(_, method, result)
    if result == nil or vim.tbl_isempty(result) then
        lsp.log.info(method, 'No location found')
        return nil
    end
    if vim.tbl_islist(result) then
        lsp.util.preview_location(result[1])
    else
        lsp.util.preview_location(result)
    end
end

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
