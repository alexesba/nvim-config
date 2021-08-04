<!-- cSpell: enable -->
# nvim-config

nvim-config: Provides a set of tools used for web development the main goal
behind this repository is to provide an easy way to install in an easy way all
the necessary plugins for neovim and start coding without spending too much time
configuring the plugins manually.

The tools includes in this repository are listed bellow:

## Menu

- [Requirements](#Requirements)
  - [Neovim](/neovim/neovim)
  - [git](https://git-scm.com/)
- [Plugins included?](#plugins-included)
  - [Color Schemes](#color-schemes) A set of colorschemes that are pleasant for the eyes
    - [OceanicNext](#oceanicnext)
    - [OceanicNextLight](#oceanicnextlight)
    - [codedark](#codedark)
    - [vim-monokai-tasty](#vim-monokai-tasty)
    - [PaperColor - background=dark](#paper-color-dark)
    - [PaperColor - background=light](#paper-color-light)
    - [Materialbox - background=dark](#paper-color-dark)
    - [Materialbox - background=light](#paper-color-light)
    - [gruvbox - background=dark](#gruvbox-dark)
    - [gruvbox - background=light](gruvbox-light)
  - [Vim enhancers](#vim-enhancers)
  - [Syntax and highlight](#syntax-and-highlight)
  - [Configuration tools](#configuration-tools)
  - [Linter tools](#linter-tools)
  - [Search tools](#search-tools)
- [Steps to Install](#steps-to-install)

-----

### Color schemes

- [Plug 'NLKNguyen/papercolor-theme'](/NLKNguyen/papercolor-theme)
- [Plug 'mhartington/oceanic-next'](/mhartington/oceanic-next)
- [Plug 'mkarmona/materialbox'](/mkarmona/materialbox)
- [Plug 'morhetz/gruvbox'](/morhetz/gruvbox)
- [Plug 'patstockwell/vim-monokai-tasty'](/patstockwell/vim-monokai-tasty)
- [Plug 'scheakur/vim-scheakur'](/scheakur/vim-scheakur)
- [Plug 'tomasiser/vim-code-dark'](/tomasiser/vim-code-dark)

### Vim enhancers

- [Plug 'andymass/vim-matchup'](/andymass/vim-matchup)
- [Plug 'airblade/vim-gitgutter'](/airblade/vim-gitgutter)
- [Plug 'dhruvasagar/vim-table-mode'](/dhruvasagar/vim-table-mode)
- [Plug 'dietsche/vim-lastplace'](/dietsche/vim-lastplace)
- [Plug 'godlygeek/tabular'](/godlygeek/tabular)
- [Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }](/iamcco/markdown-preview.nvim)
- [Plug 'kopischke/vim-fetch'](/kopischke/vim-fetch)
- [Plug 'mbbill/undotree'](/mbbill/undotree)
- [Plug 'mkitt/tabline.vim'](/mkitt/tabline.vim)
- [Plug 'terryma/vim-multiple-cursors'](/terryma/vim-multiple-cursors)
- [Plug 'tomtom/tcomment_vim'](/tomtom/tcomment_vim)
- [Plug 'tpope/vim-abolish'](/tpope/vim-abolish)
- [Plug 'tpope/vim-bundler'](/tpope/vim-bundler)
- [Plug 'tpope/vim-eunuch'](/tpope/vim-eunuch)
- [Plug 'tpope/vim-fugitive'](/tpope/vim-fugitive)
- [Plug 'tpope/vim-repeat'](/tpope/vim-repeat)
- [Plug 'tpope/vim-surround'](/tpope/vim-surround)

### Syntax And Highlight

- [Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }](/ap/vim-css-color)
- [Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support](/cakebaker/scss-syntax.vim)
- [Plug 'mattn/emmet-vim', { 'for': ['jsx', 'js', 'html', 'haml'] }](/mattn/emmet-vim)
- [Plug 'mgechev/vim-jsx'](/mgechev/vim-jsx)
- [Plug 'ntpeters/vim-better-whitespace'](/ntpeters/vim-better-whitespace)
- [Plug 'pangloss/vim-javascript', { 'for': ['jsx', 'js'] }](/pangloss/vim-javascript)
- [Plug 'senderle/restoreview'](/senderle/restoreview)
- [Plug 'tpope/vim-cucumber', { 'for': 'feature' }](/tpope/vim-cucumber)
- [Plug 'tpope/vim-haml', { 'for': 'haml' }](/tpope/vim-haml)

### Configuration tools

- [Plug 'alexesba/nrun.vim'](/alexesba/nrun.vim)
- [Plug 'editorconfig/editorconfig-vim'](/editorconfig/editorconfig-vim)

### Linter tools

- [Plug 'neoclide/coc.nvim', {'branch': 'release'}](/neoclide/coc.nvim)

### Search tools

- [Plug 'lambdalisue/fern.vim'](/lambdalisue/fern.vim)
- [Plug 'nvim-lua/plenary.nvim'](/nvim-lua/plenary.nvim)
- [Plug 'nvim-lua/popup.nvim'](/nvim-lua/popup.nvim)
- [Plug 'nvim-telescope/telescope.nvim'](/nvim-telescope/telescope.nvim)

#### ColorSchemes

##### OceanicNext

![image](https://user-images.githubusercontent.com/579793/128119587-1896ec68-9967-4bb2-b376-da39e6f4b7b1.png)

##### OceanicNextLight

![image](https://user-images.githubusercontent.com/579793/128119705-13d6706a-d43a-4b93-8b7f-be6749942c70.png)

-----

##### codedark

![image](https://user-images.githubusercontent.com/579793/128131780-20c19cc1-dc29-4df8-90bc-ebe12c6ddce6.png)

-----

##### vim-monokai-tasty

![image](https://user-images.githubusercontent.com/579793/128130441-c21d6d39-93bc-499a-b63b-31bd0fa8125d.png)

-----

##### PaperColor dark

![image](https://user-images.githubusercontent.com/579793/128130701-6bf305c7-9d94-4c9a-8262-7db4472fb043.png)

##### aperColor light

![image](https://user-images.githubusercontent.com/579793/128130748-91ff1110-d581-4ddb-9194-34e71c0a0849.png)

-----

##### materialbox dark

![image](https://user-images.githubusercontent.com/579793/128131432-e174edae-bb96-4845-9929-75bf733d3851.png)

#### materialbox light

![image](https://user-images.githubusercontent.com/579793/128131087-5f5da7d7-e54b-47af-9de8-d165e777007e.png)

-----

#### gruvbox dark

  ![image](https://user-images.githubusercontent.com/579793/128131534-548255d1-d06d-4559-9093-1ad97d1bdad3.png)

#### gruvbox light

  ![image](https://user-images.githubusercontent.com/579793/128131558-77138082-aec9-48cd-93dd-a35f20eb9d6c.png)

  -----

## Steps to install
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

