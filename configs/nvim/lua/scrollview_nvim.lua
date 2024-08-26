require('scrollview').setup({
    exclude_filetype = { "NvimTree" },
    current_only = true,
    base = 'buffer',
    column = 80,
    signs_on_startup = {'all'},
    diagnostic_severities = {vim.diagnostic.severity.ERROR},
})
