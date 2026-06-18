-- Local reprobado commands (:Reprobado / :Reprobada). Keymaps live in lua/config/keymaps.lua.
return {
  {
    dir = vim.fn.stdpath("config"),
    name = "vorbis-tools",
    lazy = false,
    config = function()
      require("reprobado").ensure_player()
    end,
  },
  {
    dir = vim.fn.stdpath("config"),
    name = "reprobado",
    lazy = false,
    dependencies = {
      "skywind3000/asyncrun.vim",
      "vorbis-tools",
    },
    config = function()
      require("reprobado").setup()
      require("reprobado").setup_commands()
    end,
  },
}
