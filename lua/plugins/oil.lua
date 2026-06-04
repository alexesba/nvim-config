return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    default_file_explorer = true,
  },
  -- Optional dependencies
  dependencies = { "nvim-web-devicons" },
  cmd = { "Exp", "Explore", "Explorer" },
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open Parent Directory",
      noremap = true,
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    vim.api.nvim_create_user_command("Explorer", function()
      require("oil").open()
    end, { desc = "Open Current Directory" })

    vim.api.nvim_create_user_command("Explore", function()
      require("oil").open()
    end, { desc = "Open Current Directory" })

    vim.api.nvim_create_user_command("Exp", function()
      require("oil").open()
    end, { desc = "Open Current Directory" })
  end,
  -- Open directory when using nvim .
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if arg and vim.fn.isdirectory(arg) == 1 then
          vim.cmd("Oil " .. arg)
        end
      end,
    })
  end,
}
