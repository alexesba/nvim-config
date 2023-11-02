<!-- **cSpell**: enable -->
# Overview

> nvim-config: Provides a set of tools used for web development the main goal
behind this repository is to provide an easy way to install in an easy way all
the necessary plugins for Neovim and start coding without spending too much time
configuring the plugins manually.

- [Requirements](#Requirements)
  - [Neovim ~9.0](/neovim/neovim)
  - [git](https://git-scm.com/)
- [Color Schemes](#color-schemes) A set of colorschemes that are pleasant for the eyes
- [Plugins](#plugins)
- [Installtion](#installation)

-----

### Custom Commands
- **UpdateRepoDotFiles**: keep updated your checkout branch(HEAD)
- **FormatJSONV**: format JSON files using python json.tool
- **FormatJSONV2**: format JSON files using underscore. to use command you need to
  have installed underscore-cli `npm install -g underscore-cli`
- **FormatCss**: command to expand ofuscated/minified css files.
- **FormatXML**: command to expand and format xml files
- **FormatSQL**: command to format sql files using sqlformat in ubuntu
- **FormatSQL2**: command to format using a npm package in order to use this command
  make sure you have installed globally: `npm i -g sql-formatter-cli`
- **CopyFilePath**: command to copy the current file path to the clipboard
- **SingleQuotesC**: replace all the single quotes with double
  with confirmation
- **SingleQuotes**: command to replace single quotes with double no confirmation
  required.
- **DoubleQuotesC**: same as SingleQuotesC but changes single quotes to double quotes
- **DoubleQuotes**: Same as DoubleQuotes but ask for confirmation
- **RemoveExtraEmptyLines**: command to cleanup double empty lines and keep only
  one

### Color schemes

- [embark-theme/vim](http://github.com/embark-theme/vim)
- [folke/tokyonight.nvim](http://github.com/folke/tokyonight.nvim)
- [mhartington/oceanic-next](http://github.com/mhartington/oceanic-next)
- [rafamadriz/neon](http://github.com/rafamadriz/neon)
- [rakr/vim-one](http://github.com/rakr/vim-one)
- [sainnhe/edge](http://github.com/sainnhe/edge)
- [sainnhe/gruvbox-material](http://github.com/sainnhe/gruvbox-material)
- [sainnhe/sonokai](http://github.com/sainnhe/sonokai)
- [savq/melange-nvim](http://github.com/savq/melange-nvim)
- [shatur/neovim-ayu](http://github.com/shatur/neovim-ayu)
- [yonlu/omni.vim](http://github.com/yonlu/omni.vim)


### Plugins
- [AndrewRadev/tagalong.vim](http://github.com/AndrewRadev/tagalong.vim)
- [JoosepAlviste/nvim-ts-context-commentstring](http://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [aca/marp.nvim](http://github.com/aca/marp.nvim)
- [akinsho/toggleterm.nvim](http://github.com/akinsho/toggleterm.nvim)
- [alexesba/nrun.vim](http://github.com/alexesba/nrun.vim)
- [alvarosevilla95/luatab.nvim](http://github.com/alvarosevilla95/luatab.nvim)
- [andymass/vim-matchup](http://github.com/andymass/vim-matchup)
- [antoinemadec/FixCursorHold.nvim](http://github.com/antoinemadec/FixCursorHold.nvim)
- [b3nj5m1n/kommentary](http://github.com/b3nj5m1n/kommentary) 
- [brymer-meneses/grammar-guard.nvim](http://github.com/brymer-meneses/grammar-guard.nvim)
- [dhruvasagar/vim-table-mode](http://github.com/dhruvasagar/vim-table-mode)
- [dietsche/vim-lastplace](http://github.com/dietsche/vim-lastplace)
- [editorconfig/editorconfig-vim](http://github.com/editorconfig/editorconfig-vim)
- [godlygeek/tabular](http://github.com/godlygeek/tabular)
- [hrsh7th/cmp-buffer](http://github.com/hrsh7th/cmp-buffer)
- [hrsh7th/cmp-cmdline](http://github.com/hrsh7th/cmp-cmdline)
- [hrsh7th/cmp-nvim-lsp](http://github.com/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/cmp-path](http://github.com/hrsh7th/cmp-path)
- [hrsh7th/nvim-cmp](http://github.com/hrsh7th/nvim-cmp)
- [iamcco/markdown-preview.nvim](http://github.com/iamcco/markdown-preview.nvim)
- [juanchanco/vim-jbuilder](http://github.com/juanchanco/vim-jbuilder)
- [kopischke/vim-fetch](http://github.com/kopischke/vim-fetch)
- [kyazdani42/nvim-tree.lua](http://github.com/kyazdani42/nvim-tree.lua)
- [kyazdani42/nvim-web-devicons](http://github.com/kyazdani42/nvim-web-devicons)
- [lewis6991/gitsigns.nvim](http://github.com/lewis6991/gitsigns.nvim)
- [mattn/emmet-vim](http://github.com/mattn/emmet-vim) 
- [mg979/vim-visual-multi](http://github.com/mg979/vim-visual-multi)
- [neovim/nvim-lspconfig](http://github.com/neovim/nvim-lspconfig)
- [norcalli/nvim-colorizer.lua](http://github.com/norcalli/nvim-colorizer.lua)
- [nvim-lua/popup.nvim](http://github.com/nvim-lua/popup.nvim) 
- [nvim-telescope/telescope.nvim](http://github.com/nvim-telescope/telescope.nvim)
- [nvim-treesitter/nvim-treesitter](http://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter/nvim-treesitter-textobjects](http://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [rgroli/other.nvim](http://github.com/rgroli/other.nvim)
- [rorymckinley/vim-rubyhash](http://github.com/rorymckinley/vim-rubyhash)
- [shmup/vim-sql-syntax](http://github.com/shmup/vim-sql-syntax)
- [skywind3000/asyncrun.vim](http://github.com/skywind3000/asyncrun.vim)
- [tpope/vim-abolish](http://github.com/tpope/vim-abolish)
- [tpope/vim-bundler](http://github.com/tpope/vim-bundler)
- [tpope/vim-dispatch](http://github.com/tpope/vim-dispatch)
- [tpope/vim-eunuch](http://github.com/tpope/vim-eunuch)
- [tpope/vim-fugitive](http://github.com/tpope/vim-fugitive)
- [tpope/vim-repeat](http://github.com/tpope/vim-repeat)
- [tpope/vim-surround](http://github.com/tpope/vim-surround)
- [wbthomason/packer.nvim](http://github.com/wbthomason/packer.nvim)
- [weilbith/nvim-code-action-menu](http://github.com/weilbith/nvim-code-action-menu)
- [williamboman/mason-lspconfig.nvim](http://github.com/williamboman/mason-lspconfig.nvim)
- [williamboman/mason.nvim](http://github.com/williamboman/mason.nvim)
- [windwp/nvim-ts-autotag](http://github.com/windwp/nvim-ts-autotag)

## Installation
<!-- Zero width character is used to put extra blank lines before and after code -->

<h3>

```sh
# STEP 1:

# installing neovim

# depening on your SO one of the following commands will help you with that:

# Linux:
sudo apt update && sudo apt install neovim

# macosx:

brew update && brew install neovim

# Step 2:
git clone git@github.com:alexesba/nvim-config.git ~/.config/nvim
        \ && cd ~/.config/nvim


# or in case you have the ssh-keys:

git clone https://github.com/alexesba/nvim-config.git
         \ ~/.config/nvim
         \ && cd ~/.config/nvim

# Step 3: Then run the following commands within the ~/.config/nvim directory

# make sure you check out the right tag version.

 git checkout tags/vx.x.x  -b vx.x.x

./install.sh

```

</h3>

### Optional Installation

```sh
# If you want to use the "live grep" option for Telescope, then you need to make
# sure that the "rg" command is installed in your system.

# To check if you have rg execute the command below.

which rg

# If you don't have it you have to install it in order to be able to use the
# "live grep" feature.

brew install rg
```
