return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false,
      },
    },
    keys = {
      {
        "<leader>fg",
        LazyVim.pick("live_grep"),
        desc = "Live grep (Root Dir)",
      },
      {
        "<leader>fk",
        LazyVim.pick("grep_word"),
        desc = "Grep word under cursor (Root Dir)",
        mode = { "n", "x" },
      },
    },
  },
}
