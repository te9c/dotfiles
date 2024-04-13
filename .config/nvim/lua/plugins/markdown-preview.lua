return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  build = "cd app && yarn install",
  config = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      desc = "Set markdown preview mappings when entering *.md file",
      pattern = { "*.md" },
      callback = function()
        vim.keymap.set("n", "<leader>m", "<Plug>MarkdownPreviewToggle", { desc = "Toggle markdown preview" })
      end,
    })
  end,
  -- lazy = true
}
