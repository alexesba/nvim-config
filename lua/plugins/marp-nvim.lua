return {
  "alexesba/marp-nvim",
  ft = "markdown",
  cmd = { "MarpStart", "MarpStop", "MarpToggle", "MarpStatus" },
  build = function(plugin)
    require("marp").install(plugin.dir)
  end,
  opts = {
    preview_browser = "dedicated",
  },
  config = true,
}
