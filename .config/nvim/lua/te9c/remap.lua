vim.g.mapleader = "\\"

vim.keymap.set("n","<C-s>",":w<cr>")
vim.keymap.set("n","<leader>vr",":tabnew ~/.config/nvim/.<cr>",{silent = true})

vim.keymap.set('n',"U",':tabp<cr>',{silent = true})
vim.keymap.set('n','I',':tabn<cr>',{silent = true})

--Easy window navigation
vim.keymap.set("n","<C-h>","<C-w>h")
vim.keymap.set("n","<C-j>","<C-w>j")
vim.keymap.set("n","<C-k>","<C-w>k")
vim.keymap.set("n","<C-l>","<C-w>l")

vim.keymap.set("n","o","o<esc>")
vim.keymap.set("n","O","O<esc>")
vim.keymap.set("n","<space>",":")
vim.keymap.set("i","jj","<esc>")
vim.keymap.set("n","x","\"_x")

vim.keymap.set("n","<leader>d", vim.cmd.Ex)
