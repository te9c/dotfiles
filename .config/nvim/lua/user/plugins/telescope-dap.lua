return {
    {
        "nvim-telescope/telescope-dap.nvim",
        name = "telescope-dap",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require('telescope').load_extension('dap')
        end,
        enabled = true,
    }
}
