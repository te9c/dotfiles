-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item(cmp_select)
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, {'i','s'}),
    -- ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-n>"] = cmp.mapping(function (fallback)
        if cmp.visible() then
            cmp.select_next_item(cmp_select)
        elseif luasnip.jumpable(1) then
            luasnip.jump(1)
        else
            fallback()
        end
    end,{'i','s'}),
    ["<C-y>"] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function (client, bufnr)
    local opts = {buffer = bufnr, remap = false, desc = "LSP"}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr,remap = false,desc = "LSP [g]o to [d]efinition"})
    vim.keymap.set("n","K",function() vim.lsp.buf.hover() end, {buffer = bufnr,remap = false,desc = "LSP Get Hover"})
    vim.keymap.set("n","<leader>vws", function () vim.lsp.buf.workspace_symbol() end, {buffer = bufnr,remap = false,desc = "LSP [w]orkspace [s]ymbol"})
    vim.keymap.set("n","<leader>vd",function() vim.diagnostic.open_float() end, {buffer = bufnr,remap = false,desc = "LSP float [d]iagnostic window"})
    vim.keymap.set("n","[d",function() vim.diagnostic.goto_next() end,opts)
    vim.keymap.set("n","]d",function() vim.diagnostic.goto_prev() end,opts)
    vim.keymap.set("n","<leader>vca",function() vim.lsp.buf.code_action() end,{buffer = bufnr,remap = false,desc = "LSP [c]ode [a]ction"})
    vim.keymap.set("n","<leader>vrr",function() vim.lsp.buf.references() end, {buffer = bufnr,remap = false,desc = "LSP find [r]efe[r]ences"})
    vim.keymap.set("n","<leader>vrn",function() vim.lsp.buf.rename() end , {buffer = bufnr,remap = false,desc = "LSP [r]e[n]ame"})
    vim.keymap.set("i","<C-h>",function() vim.lsp.buf.signature_help() end, opts)
    -- vim.keymap.set('n','<C-n>','<Plug>luasnip-jump-next')
    -- vim.keymap.set('n','<C-p>','<Plug>luasnip-jump-prev')
end)
vim.diagnostic.config({float = {source = 'always'}})

lsp.setup()
