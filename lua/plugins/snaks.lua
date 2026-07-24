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
            -- Hide colorschemes bundled with Neovim itself ($VIMRUNTIME/colors),
            -- keeping only the ones installed as plugins.
            finder = function(opts, ctx)
              local items = require("snacks.picker.source.vim").colorschemes(opts, ctx)
              local runtime = vim.env.VIMRUNTIME
              return vim.tbl_filter(function(item)
                return not vim.startswith(item.file, runtime)
              end, items)
            end,
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
