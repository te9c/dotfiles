return {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
        ensure_installed = { 'coreclr' },
        handlers = {
            function(config)
                -- all sources with no handler get passed here

                -- Keep original functionality
                require('mason-nvim-dap').default_setup(config)
            end,
        }
    }
}
