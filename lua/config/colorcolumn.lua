local columnLimit = vim.api.nvim_create_augroup(
"columnLimit", { clear = true }
)
local cLimit = 81;
local pattern = string.format("%%<%sv.%%>%sv", cLimit + 1, cLimit)
vim.api.nvim_create_autocmd(
{ "BufRead", "BufEnter" },
{ pattern = "*", command=[[highlight columnLimit ctermfg=Red guibg=Red]]}
)

local pattern2 = string.format("let w:m1=matchadd(%'ColumnLimit%', %s, -1)", pattern)
vim.api.nvim_create_autocmd(
{ "BufRead", "BufEnter" },
{pattern = "*", command= pattern2}
)
