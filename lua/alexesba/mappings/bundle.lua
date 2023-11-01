local map = require('alexesba.utils.map').map

map("n", "<leader>bo", "':Bopen '. expand('<cword>') .'<cr>'", { noremap = true, expr = true })
