return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false,
      },
      picker = {
        sources = {
          colorschemes = {
            -- WSL + Kitty/Alacritty can fire spurious WinEnter events; keep picker open.
            auto_close = false,
          },
        },
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
