local toggleterm = prequire("toggleterm")

if (toggleterm) then
  toggleterm.setup({
    open_mapping = [[<c-\>]],
  })
end
