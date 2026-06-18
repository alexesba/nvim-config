local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h")

vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.rtp:prepend(root)

local plenary = root .. "/deps/plenary.nvim"
if vim.fn.isdirectory(plenary) == 1 then
  vim.opt.rtp:append(plenary)
end
