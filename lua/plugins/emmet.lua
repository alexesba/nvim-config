return {
  'olrtg/nvim-emmet',
  ft = { "html", "css", "javascript", "typescript", "xml", "javascriptreact", "typescriptreact", "eruby" }, -- Add more filetypes as needed
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
  end
}
