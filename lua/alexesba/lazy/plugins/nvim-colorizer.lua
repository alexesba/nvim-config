return {
  'norcalli/nvim-colorizer.lua',
  ft = { 'sass', 'scss', 'css' },
  opts = {
    'sass', 'scss', 'css'
  },
  config = function(_, opts)
    require('colorizer').setup(opts)
  end
}
