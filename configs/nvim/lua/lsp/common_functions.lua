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

local peek_definition()
    local params = lsp.util.make_position_params()
    return lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end
