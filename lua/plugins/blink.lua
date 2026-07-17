return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- Keep LazyVim preset ("enter"): <Up>/<Down>, <C-n>/<C-p>, <CR>, etc.
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
    },
  },
}
