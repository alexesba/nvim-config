return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  event        = { "BufReadPre", "BufNewFile" },
  config       = function()
    --[[ local signs = {
      Error = "󰈸",
      Warn = "󰌸",
      Hint = "󱩓",
      Info = ""
    } ]]

    local signs = {
      Error = "",
      Warn = "",
      Hint = "",
      Info = ""
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end
}
