local builtin = require('telescope.builtin')
vim.keymap.set('n','fzf', builtin.find_files)
vim.keymap.set('n','<C-p>', builtin.git_files)
vim.keymap.set('n','fzk', builtin.keymaps)

vim.keymap.set('n','fzp', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
