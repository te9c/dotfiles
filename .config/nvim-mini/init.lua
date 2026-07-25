vim.cmd("syntax enable")

vim.cmd.colorscheme("desert")

vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.cindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 2
vim.opt.guicursor = 'n-c-v:block-nCursor'
vim.opt.foldcolumn = "auto"
vim.opt.showmode = false

vim.keymap.set('n', 'o', 'o<esc>')
vim.keymap.set('n', 'O', 'O<esc>')

vim.opt.keymap = "russian-programmers-dvorak"
vim.opt.iminsert = 0

local function toggle_keymap()
    if vim.opt.iminsert:get() == 1 then
        vim.opt.iminsert = 0
        print('en')
    else
        vim.opt.iminsert = 1
        print('ru')
    end

    if vim.api.nvim_get_mode().mode == 'i' then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-^>', true, false, true), 'n', false)
    end
end
vim.keymap.set({'n', 'i'}, '<C-l>', toggle_keymap, { desc = "toggle between russian and english keymaps" })
