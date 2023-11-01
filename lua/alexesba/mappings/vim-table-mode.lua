local map = require('alexesba.utils.map').map

-- Toggle TableMode: Plug 'dhruvasagar/vim-table-mode'
map("n", "<Leader>to", ":TableModeToggle<CR>", { noremap = true, silent = true })
map("n", "<Leader>tr", ":TableModeRealign<CR>", { noremap = true, silent = true })
map("n", "<Leader>tg", ":TableModeToggleGithubTable<CR>", { noremap = true, silent = true })
