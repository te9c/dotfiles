return {
    "nvim-treesitter/nvim-treesitter",
    config = function(plugin, opts)
        require("plugins.configs.nvim-treesitter")(plugin, opts)

        require("nvim-treesitter.configs").setup({
            auto_install = true,
            indent = {
                enable = true,
                disable = { "cpp", "lua" },
            },
        })
    end,
}
