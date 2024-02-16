return {
  n = {
    ["o"] = { "o<esc>", desc = "Add new line without entering input mode" },
    ["O"] = { "O<esc>", desc = "Add new line backwards without entering input mode" },

    ["<leader>Q"] = { ":qa<cr>", desc = "All quit" },

    ["<leader>dfc"] = { ":Telescope dap configurations<cr>", desc = "Show dap configurations" },
    ["cpa"] = {
      ":%y+<cr><cr>",
      desc = "Copy all lines in current buffer to clipboard.",
    },
    -- ["gd"] = { "lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
  },
}
