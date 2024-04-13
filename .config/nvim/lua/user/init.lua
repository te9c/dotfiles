return {
    updater = require("user.updater"),

    -- colorscheme = "moonfly",
    colorscheme = "catppuccin-mocha",
    -- colorscheme = "desert",
    -- colorscheme = "catppuccin",
    -- colorscheme = "astrodark",

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
        virtual_text = true,
        underline = true,
    },

    lsp = require("user.lsp"),

    -- Configure require("lazy").setup() options
    lazy = {
        defaults = { lazy = true },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
            },
        },
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        require("user.autocmds")

        require("notify").setup({
            background_colour = "#1a1b26"
        })

        -- Try Hard features:
        -- vim.g.diagnostics_mode = 0
        -- vim.g.cmp_enabled = false
    end,
}
