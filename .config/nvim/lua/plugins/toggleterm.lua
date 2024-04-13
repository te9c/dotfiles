return {
  "akinsho/toggleterm.nvim",
  config = function()
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "JJ", [[<C-\><C-n>]], opts)
    end

    vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

    require("toggleterm").setup {
      shell = "/bin/bash",
    }
  end,
}
