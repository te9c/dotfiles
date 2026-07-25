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

local function toggle_keymap()
    if vim.opt.keymap:get() == "" then
        vim.opt.keymap = "russian-programmers-dvorak"
        print('ru')
    else
        vim.opt.keymap = ""
        print('en')
    end
end

vim.keymap.set({'n', 'i'}, '<C-l>', toggle_keymap, { desc = "toggle between russian and english keymaps" })
