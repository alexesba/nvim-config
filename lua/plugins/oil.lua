return {
  "stevearc/oil.nvim",
  lazy = false,

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  init = function()
    -- Disable netrw so Oil becomes the default file explorer.
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,

  opts = {
    default_file_explorer = true,
  },

  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open parent directory",
    },
  },

  config = function(_, opts)
    local oil = require("oil")

    oil.setup(opts)

    local function open_dir(opts)
      oil.open(opts.args ~= "" and opts.args or nil)
    end

    vim.api.nvim_create_user_command("Explore", open_dir, {
      nargs = "?",
      complete = "dir",
      desc = "Open directory in Oil",
    })

    vim.api.nvim_create_user_command("Explorer", open_dir, {
      nargs = "?",
      complete = "dir",
      desc = "Open directory in Oil",
    })

    vim.api.nvim_create_user_command("Exp", open_dir, {
      nargs = "?",
      complete = "dir",
      desc = "Open directory in Oil",
    })
  end,
}
