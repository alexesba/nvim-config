-- Local reprobado commands (:Reprobado / :Reprobada).
return {
  {
    dir = vim.fn.stdpath("config"),
    name = "reprobado",
    lazy = true,
    cmd = { "Reprobado", "Reprobada" },
    keys = {
      {
        "<leader>no",
        function()
          require("reprobado").play("Reprobado.ogg")
        end,
        desc = "Play Reprobado",
      },
      {
        "<leader>na",
        function()
          require("reprobado").play("Reprobada.ogg")
        end,
        desc = "Play Reprobada",
      },
    },
    dependencies = {
      "skywind3000/asyncrun.vim",
    },
    config = function()
      require("reprobado").ensure_player()
      require("reprobado").setup()
      require("reprobado").setup_commands()
    end,
  },
}
