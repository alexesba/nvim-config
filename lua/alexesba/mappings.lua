local map = require('utils.map').map
-- nvimtree
map(
"n",
"<C-p>",
":NvimTreeFindFileToggle!<CR>", {
  silent = true,
  noremap = true
});

-- Telescope
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files({file_ignore_patterns = {'node_modules/*', '.git/**'} })<CR>", {
  noremap = true
})
map('n', '<leader>fk', "<cmd>lua require('telescope.builtin').grep_string()<cr>", { silent = true, noremap = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",{ noremap = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
map("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", { noremap = true })
map("n", "<leader>fm", "<cmd>Telescope keymaps<cr>", { noremap = true })

-- Bundle Open
map("n", "<leader>bo", "':Bopen '. expand('<cword>') .'<cr>'", { noremap = true, expr = true })

-- Toggle TableMode: Plug 'dhruvasagar/vim-table-mode'
map("n",  "<Leader>to", ":TableModeToggle<CR>", { noremap = true, silent = true })
map("n",  "<Leader>tr", ":TableModeRealign<CR>", { noremap = true, silent = true })
map("n",  "<Leader>tg", ":TableModeToggleGithubTable<CR>", { noremap = true, silent = true })

 -- 2.- CUSTOM MAPPINGS: {{{
 -- Format all the file from the first line to the end
map("n", "<leader>fef",  ":normal! gg=G``<CR>", { noremap = true, silent = true })
map("n",  "<Esc>", ":noh<CR>", { noremap = true, silent = true });

map("n", "<leader>1", ":tabn 1<cr>", { noremap = true, silent = true })
map("n", "<leader>2", ":tabn 2<cr>", { noremap = true, silent = true })
map("n", "<leader>3", ":tabn 3<cr>", { noremap = true, silent = true })
map("n", "<leader>4", ":tabn 4<cr>", { noremap = true, silent = true })
map("n", "<leader>5", ":tabn 5<cr>", { noremap = true, silent = true })
map("n", "<leader>6", ":tabn 6<cr>", { noremap = true, silent = true })
map("n", "<leader>7", ":tabn 7<cr>", { noremap = true, silent = true })
map("n", "<leader>8", ":tabn 8<cr>", { noremap = true, silent = true })
map("n", "<leader>9", ":tabn 9<cr>", { noremap = true, silent = true })
map("n", "<leader>0", ":tabn 0<cr>", { noremap = true, silent = true})

map("n", "<leader>no", ":Reprobado<CR>", { silent = true })
map("n", "<leader>na", ":Reprobada<CR>", { silent = true })

-- Remove newbie crutches in Normal Mode
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("n", "<Up>", "<Nop>")
map("n", "Q", "<Nop>")

-- Disable Arrow keys in Insert mode
map("i","<up>", "<nop>")
map("i","<down>", "<nop>")
map("i","<left>", "<nop>")
map("i","<right>", "<nop>")

-- Disable Arrow keys in Visual Mode
map("v", "<Down>", "<Nop>")
map("v", "<Left>", "<Nop>")
map("v","<Right>", "<Nop>")
map("v", "<Up>", "<Nop>")

map("n", "<leader>cf", ":CopyFullPath<CR>:echo \"File path copied!\"<CR>");

-- Copy from cursor to the end of the line
map("n", "Y", "y$")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Undo break points
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "-", "-<C-g>u")
map("i", "_", "_<C-g>u")
map("i", ":", ":<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")

-- Jumplist Mutations:
map("n", "k", "(v:count > 5 ? \"m'\". v:count : \"\"). 'k'", { expr = true, silent = true })
map("n", "j", "(v:count > 5 ? \"m'\". v:count : \"\"). 'j'", { expr = true, silent = true })

-- auto complete menu
map("n", "<leader>ac", ":CodeActionMenu<CR>", { silent = true })

map("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
