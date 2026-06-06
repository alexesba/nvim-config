return {
  {
    "alexesba/clipring.nvim",
    event = "VeryLazy",
    config = function()
      require("clipring").setup({
        max_entries = 100,
        persist = true,
        open_mapping = "<leader>yh",
      })
    end,
  },
}
