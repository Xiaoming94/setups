local CH = {}

local function setup_cyberdream()
    require("cyberdream").setup({
        transparent = true,
        colors = {
            bg = "#0a1c3f",
        }
    })
end

local function setup_synthweave()
    require("synthweave").setup({
        transparent = false,
        palette = {
            bg0 = "#2b1335"
        },
    })
end

function CH.set_colorscheme(colorscheme)
    if (colorscheme == "cyberdream") then
        setup_cyberdream()
    end

    if (colorscheme == "synthweave") then
        setup_synthweave()
    end

    vim.cmd.colorscheme(colorscheme)
end

return CH
