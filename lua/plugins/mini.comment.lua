return {
  'echasnovski/mini.comment',
  opts  = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
        end,
      }
  },
  config = function(_, opts)
    require('mini.comment').setup(opts)
  end,
  event = "BufReadPost"
}
