require('render-markdown').setup({
    file_types = { 'markdown', 'quatro' },
    render_modes = { 'n', 'c' },
    code = {
        enabled = true,
        sign = true,
        style = 'full',
        highlight = 'RenderMarkdownCode',
        hgihlight_inline = 'RenderMarkdownCodeInline',
    },
})
