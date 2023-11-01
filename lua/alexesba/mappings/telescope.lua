local map = require('alexesba.utils.map').map

map("n", "<leader>ff",
  ":lua require('telescope.builtin').find_files({file_ignore_patterns = {'node_modules/*', '.git/**'} })<CR>", {
  noremap = true,
  silent = true
})
map('n', '<leader>fk', "<cmd>lua require('telescope.builtin').grep_string()<cr>", { silent = true, noremap = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
map("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", { noremap = true })
map("n", "<leader>fm", "<cmd>Telescope keymaps<cr>", { noremap = true })
