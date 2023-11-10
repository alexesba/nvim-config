return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = { "BufReadPre", "BufNewFile" },
  keys = { "cs", "ds", "cS", "yS", "yss", "ySs", "ySS", "S", "gS", "dsf", "csf" },
  opts = {},
  config = function(_, opts)
    require("nvim-surround").setup(opts)
  end
}
