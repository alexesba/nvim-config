return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  keys = {
    {
      'th', function ()
        require('harpoon.ui').toggle_quick_menu()
      end,
      noremap = true
    },
    {
      'hk', function ()
        require('harpoon.ui').nav_prev()
      end,
      noremap = true
    },

    {
      'hj', function ()
        require('harpoon.ui').nav_next()
      end,
      noremap = true
    },
    {
      'hx', function ()
        require('harpoon.mark').add_file()
      end,
      noremap = true
    }
  }
}
