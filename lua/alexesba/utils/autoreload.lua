local fn = vim.fn

if fn.empty(fn.glob('~/.vimrc')) == 0 then
  vim.cmd [[ so ~/.vimrc ]]
end
