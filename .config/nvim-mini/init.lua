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

vim.keymap.set('n', 'o', 'o<esc>')
vim.keymap.set('n', 'O', 'O<esc>')

