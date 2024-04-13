return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim",
    },
    -- config = function(plugin, opts)
    --     require("plugins.configs.lspconfig")(plugin, opts)
    --
    --     local lspconfig = require("lspconfig")
    --
    --     lspconfig.omnisharp.setup({
    --         cmd = { "/usr/local/bin/OmniSharp-stdio" },
    --         enable_roslyn_analyzers = true,
    --         organize_imports_on_format = true,
    --         enable_import_completion = true,
    --         handlers = {
    --             ["textDocument/definition"] = require("omnisharp_extended").handler,
    --         },
    --     })
    -- end,
}
