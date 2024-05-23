return {
  "akinsho/toggleterm.nvim",
  opts = function(_, opts)
    vim.keymap.set("t", "JJ", [[<C-\><C-n>]])
    opts.shell = "/bin/bash"
  end,
}
