" " cSpell:disable
call plug#begin('~/.vim/plugged')
"{{ colorSchemes: light and dark themes
Plug 'sainnhe/sonokai'
"}}}

"{{ Vim Editor enhancers:
Plug 'dhruvasagar/vim-table-mode'
Plug 'dietsche/vim-lastplace'
Plug 'godlygeek/tabular'
Plug 'kopischke/vim-fetch'
Plug 'mkitt/tabline.vim'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
"}}}

"{{ Configuration tools:
Plug 'alexesba/nrun.vim'
Plug 'editorconfig/editorconfig-vim'
"}}
"
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'hrsh7th/nvim-compe'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'


if !empty(glob("~/.plug.vim"))
  so ~/.plug.vim
endif
call plug#end()


lua << EOT
  vim.opt.number = true
  vim.opt.wrap = false
  vim.opt.hidden = false
  vim.opt.signcolumn = 'yes'
  vim.opt.termguicolors = true
  vim.g.mapleader = ","
EOT

lua require('config.nvimtree')
so ~/.config/nvim/vim-files/config/nerd_tree.vim
so ~/.config/nvim/vim-files/mappings/nerd_tree.vim
so ~/.config/nvim/vim-files/mappings/telescope.vim

let sonokai_style = 'atlantis'
colorscheme sonokai
