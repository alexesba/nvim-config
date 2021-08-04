# nvim-config

Steps to install:
<!-- Zero width character is used to put extra blank lines before and after code -->

<h3>

```sh

git clone git@github.com:alexesba/nvim-config.git ~/.config/nvim && cd ~/.config/nvim


# or 

git clone https://github.com/alexesba/nvim-config.git ~/.config/nvim && cd ~/.config/nvim

# then run the following command to install all dependencies

./install.sh
```

</h3>

## Plugins used in this repository

- **ColorSchemes**

```vim
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'mkarmona/materialbox'
Plug 'morhetz/gruvbox'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'scheakur/vim-scheakur'
Plug 'tomasiser/vim-code-dark'
```

- **Vim enhancers**

```vim
Plug 'andymass/vim-matchup'
Plug 'airblade/vim-gitgutter'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dietsche/vim-lastplace'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'kopischke/vim-fetch'
Plug 'mbbill/undotree'
Plug 'mkitt/tabline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
```

- **syntax and highlight**

```vim
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'mattn/emmet-vim', { 'for': ['jsx', 'js', 'html', 'haml'] }
Plug 'mgechev/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript', { 'for': ['jsx', 'js'] }
Plug 'senderle/restoreview'
Plug 'tpope/vim-cucumber', { 'for': 'feature' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
```

- **Configuration tools:**

```vim
Plug 'alexesba/nrun.vim'
Plug 'editorconfig/editorconfig-vim'
```

- **Linter and development tools:*

```vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```

- **Search tools:**

```vim
Plug 'lambdalisue/fern.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
```

