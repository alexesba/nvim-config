local telescope = prequire('telescope')

if (telescope) then
  telescope.setup({
    pickers = {
      colorscheme = {
        enable_preview = true
      }
    }
  })
end
