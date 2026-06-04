return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- rounded border on hover (K) and signature help
      },
      -- disable cmdline and message takeover
      cmdline = { enabled = false },
      messages = { enabled = false },
      popupmenu = { enabled = false },
    },
  },
}
