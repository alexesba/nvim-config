local map = require('alexesba.utils.map').map
map(
  "n",
  "<C-p>",
  ":NvimTreeFindFileToggle!<CR>", {
    silent = true,
    noremap = true
  });
