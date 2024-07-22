return {
  "nvim-neotest/neotest",
  dependencies = {
    "olimorris/neotest-rspec",
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-plenary",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-plenary"),
        require('neotest-rspec'),
      }
    })
  end,
  keys = {
    { '<leader>rt', function() require("neotest").run.run() end, noremap = true, silent = true },
    { '<leader>rf', function() require("neotest").run.run(vim.fn.expand("%")) end, noremap = true, silent = true },
    { '<leader>ra', function() require("neotest").run.run(vim.fn.getcwd() .. "/spec") end, noremap = true, silent = true },
    { '<leader>ro', function() require("neotest").output.open() end, noremap = true, silent = true },
    { '<leader>os', function() require("neotest").summary.toggle() end, noremap = true, silent = true },
  }
}
