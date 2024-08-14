local CH = {}

local function setup_cyberdream()
    require("cyberdream").setup({
        transparent = true,
        colors = {
            bg = "#0a1c3f",
        }
    })
end

function CH.set_colorscheme(colorscheme)
    if (colorscheme == "cyberdream") then
        setup_cyberdream()
    end
    vim.cmd("colorscheme " .. colorscheme)
end

return CH
