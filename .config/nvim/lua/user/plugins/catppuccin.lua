return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            -- transparent_background = true,
            flavour = "mocha",
            -- custom_highlights = function(colors)
            --     return {
            --         CursorLine = { fg = colors.none, bg = colors.none }
            --     }
            -- end
        })
    end,
}
