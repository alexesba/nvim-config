<!-- cSpell: enable -->
# nvim-config

nvim-config: Provides a set of tools used for web development the main goal
behind this repository is to provide an easy way to install in an easy way all
the necessary plugins for neovim and start coding without spending too much time
configuring the plugins manually.

The tools includes in this repository are listed bellow:

## Menu

- [Requirements](#Requirements)
  - [Neovim ~5.0](/neovim/neovim)
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
- [Available Mappings](#available-mappings)
- [Available Commands](#available-commands)
- [Steps to Install](#steps-to-install)
- [Adding customization](#adding-customization)
- [Installing custom plugins](#installing-custom-plugins)

-----

### Available Mappings

- [Fern: File Explorer](/lambdalisue/fern.vim)
  Simple and powerful file explorer for vim and Neovim
  - `<C-p>`: Toggle the Fern File Explorer
    - Mappings within the Fern File Explorer:
      - `o` : Action to Expand or collapse the directories/also open files
      - `<CR>` : Action to Expand or collapse the directories
      - `an` : Action to create a new file or directory: for creating directories
              the end line needs to have the / symbol.
              e.g  New path: my_new_directory/ or
              New path: my_new_file[.extension] Extension could be optional.
              use `an` because `n` is used to go to the next match
      - `d` : Action to delete a file or directory.
      - `c` : Action to Copy the selected files.
      - `m` : Action to move the selected files.
      - `b` : Action to open the file under the cursor in a horizontal split.
      - `v` : Action to open the file under the cursor in a vertical split.
      - `t` : Action to open the file under the cursor in a new tab.
      - `C` : Action to clipboard copy(only works within the Fern buffer).
      - `P` : Action to Paste the copied files into the selected directory.
      - `M` : Action to rename/move the selected file(s).
      - `H` : Action to toggle the hidden files within the Fern panel.
      - `R` : Action to Reload the files without Fern panel.
      - `>` : Action to go into a selected directory
      - `<` : Action to go to the parent directory
- [coc.nvim](/neoclide/coc.nvim):
  Provides intellisense similar to VSCode
  - `<leader>ac`: normal mode open the action menu Enter select the firs option in the list
  - `<C-space>` : coc#refresh()
  - `K`  : to Show documentation in preview window
  - `gd` : calls `<Plug>(coc-definition)`
  - `gy` : calls `<Plug>(coc-type-definition)`
  - `gi` : calls `<Plug>(coc-implementation)`
  - `gr` : calls `<Plug>(coc-references)`
  - `<leader>a`  : normal mode and visual mode calls the `<Plug>(coc-codeaction-selected)`
  - `<leader>fs` : normal monde and visual mode calls the `<Plug>(coc-format-selected)`
  - `<leader>rn` : normal mode calls the action `<Plug>(coc-rename)`
  - `<leader>qf` : normmal mode calls the `<Plug>(coc-fix-current)`
  - `<space>a` : calss `<C-u>CocList diagnostics<cr>` Manage extensions.
  - `<space>e` : calls `<C-u>CocList extensions<cr>` Show commands.
  - `<space>c` : calls `<C-u>CocList commands<cr>` Find symbol of current document
  - `<space>o` : calls `<C-u>CocList outline<cr> ` Search workspace symbols.
  - `<space>s` : calls `<C-u>CocList -I symbols<cr> ` Do default action for next item.
  - `<space>j` : calls `<C-u>CocNext<CR>

- [tomtom/tcomment_vim](/tomtom/tcomment_vim)
  Provides an easy way to comment/uncomment lines or blocks of code
  - `gc{motion}` : Toggle comments (for small comments within one line
                    the &filetype_inline style will be used, if
                    defined)
  - `gc<Count>c{motion}` : Toggle comment with count argument
                      (see |tcomment#Comment()|)
  - `gcc`        : Toggle comment for the current line
  - `<leader>__` : Comment/uncomment the current line
  - `g<{motion}` : Uncomment region
  - `g<c`        : Uncomment the current line
  - `g<b`        : Uncomment the current region as block
  - `g>{motion}` : Comment region
  - `g>c`        : Comment the current line
  - `g>b`        : Comment the current region as block

- [dhruvasagar/vim-table-mode](/dhruvasagar/vim-table-mode)
  - `<Leader>to` : toggle the TableMode
  - `<Leader>rt` : Align the table TableModeRealign
  - `<Leader>tg` : Change the table corner to match the github table format.

- [mbbill/undotree](/mbbill/undotree)
  -`<leader>un` : calls the UndotreeToggle command to show the undotree pane
- Custom mappings:
  - Alt+k: in normal mode moves up the current line under the cursor.
  - Alt+j: in normal mode moves down the current line under the cursor.
  - Alt+k: in visual mode moves the selected lines up
  - Alt+j: in visual mode moves the selected lines down

### Available Commands

- UpdateRepoDotFiles: keep updated your checkout branch(HEAD)
- FormatJSONV: format JSON files using python json.tool
- FormatJSONV2: format JSON files using underscore. to use command you need to
  have installed underscore-cli `npm install -g underscore-cli`
- FormatCss: command to expand ofuscated/minified css files.
- FormatXML: command to expand and format xml files
- FormatSQL: command to format sql files using sqlformat in ubuntu
- FormatSQL2: command to format using a npm package in order to use this command
  make sure you have installed globally: `npm i -g sql-formatter-cli`
- CopyFilePath: command to copy the current file path to the clipboard
- SingleQuotesC: replace all the single quotes with double
  with confirmation
- SingleQuotes: command to replace single quotes with double no confirmation
  required.
- DoubleQuotesC: same as SingleQuotesC but changes single quotes to double quotes
- DoubleQuotes: Same as DoubleQuotes but ask for confirmation
- RemoveExtraEmptyLines: command to cleanup double empty lines and keep only
  one

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
  - match-up is a plugin that lets you highlight,
    navigate, and operate on sets of matching text.
    It extends vim's % key to language-specific words instead of just
    single characters
- [Plug 'airblade/vim-gitgutter'](/airblade/vim-gitgutter)
  - A Vim plugin which shows a git diff in the sign column.
    It shows which lines have been added, modified, or removed.
    You can also preview, stage, and undo individual hunks;
    and stage partial hunks. The plugin also provides a hunk text object.
- [Plug 'dhruvasagar/vim-table-mode'](/dhruvasagar/vim-table-mode)
  - An awesome automatic table creator & formatter allowing one to create neat
    tables as you type.
- [Plug 'dietsche/vim-lastplace'](/dietsche/vim-lastplace)
  - Intelligently reopen files at your last edit position. By default git, svn,
    and mercurial commit messages are ignored because you probably want to type
    a new message and not re-edit the previous one.
- [Plug 'godlygeek/tabular'](/godlygeek/tabular)
  - This plugin aims to make the easy aligments by specific keywords
- [Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }](/iamcco/markdown-preview.nvim)
  - Preview markdown on your modern browser with synchronised scrolling and
    flexible configuration
- [Plug 'kopischke/vim-fetch'](/kopischke/vim-fetch)
  - vim-fetch enables Vim to process line and column jump specifications in file
    paths as found in stack traces and similar output.
    When asked to open such a file, in- or outside Vim or via gF, Vim with
    vim-fetch will jump to the specified line (and column, if given) instead of
    displaying an empty, new file.
- [Plug 'mbbill/undotree'](/mbbill/undotree)
  - The plug-in visualizes undo history and makes it easier to browse and
    switch between different undo branches. You might wonder what is undo
    "branches"? It's a vim feature that allows you to go back to a state when
    it is overwritten by the latest edit.
- [Plug 'mkitt/tabline.vim'](/mkitt/tabline.vim)
  - Configure tab labels within Terminal Vim with a very succinct output.
- [Plug 'terryma/vim-multiple-cursors'](/terryma/vim-multiple-cursors)
  - There have been many attempts at bringing Sublime Text's awesome multiple
    selection feature into Vim, but none so far have been in my opinion a
    faithful port that is simplistic to use, yet powerful and intuitive enough
    for an existing Vim user. vim-multiple-cursors is yet another attempt
    at that.
- [Plug 'tomtom/tcomment_vim'](/tomtom/tcomment_vim)
  - tcomment provides easy to use, file-type sensible comments for Vim. It
    can handle embedded syntax.
- [Plug 'tpope/vim-abolish'](/tpope/vim-abolish)
  - Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
    MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru),
    dash-case (cr-), dot.case (cr.), space case (cr<space>),
    and Title Case (crt) are all just 3 keystrokes away.
  - For more details about this plugin visit the author's page.
- [Plug 'tpope/vim-bundler'](/tpope/vim-bundler)
  - This is a lightweight bag of Vim goodies for Bundler, best accompanied by
    rake.vim and/or rails.vim. Features:
- [Plug 'tpope/vim-eunuch'](/tpope/vim-eunuch)
  - Vim sugar for the UNIX shell commands that need it the most. Features include:
- [Plug 'tpope/vim-fugitive'](/tpope/vim-fugitive)
  - Fugitive is the premier Vim plugin for Git.
    Or maybe it's the premier Git plugin for Vim? Either way, it's "so awesome,
    it should be illegal". That's why it's called Fugitive.
- [Plug 'tpope/vim-repeat'](/tpope/vim-repeat)
  - If you've ever tried using the . command after a plugin map,
    you were likely disappointed to discover it only repeated the last native
    command inside that map, rather than the map as a whole.
    That disappointment ends today. Repeat.vim remaps .
    in a way that plugins can tap into it.
- [Plug 'tpope/vim-surround'](/tpope/vim-surround)
  - Surround.vim is all about "surroundings": parentheses, brackets, quotes,
    XML tags, and more. The plugin provides mappings to easily delete,
    change and add such surroundings in pairs.

### Syntax And Highlight

- [Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] }](/ap/vim-css-color)
  - A very fast, multi-syntax context-sensitive color name highlighter
- [Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support](/cakebaker/scss-syntax.vim)
  - Vim Syntax File for SCSS (Sassy CSS)
- [Plug 'mattn/emmet-vim', { 'for': ['jsx', 'js', 'html', 'haml'] }](/mattn/emmet-vim)
  - emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
- [Plug 'mgechev/vim-jsx'](/mgechev/vim-jsx)
  - Syntax highlighting and indenting for JSX. JSX is a JavaScript syntax
    transformer which translates inline XML document fragments into JavaScript
    objects. It was developed by Facebook alongside React.
- [Plug 'ntpeters/vim-better-whitespace'](/ntpeters/vim-better-whitespace)
  - This plugin causes all trailing whitespace characters to be highlighted.
- [Plug 'pangloss/vim-javascript', { 'for': ['jsx', 'js'] }](/pangloss/vim-javascript)
  - JavaScript bundle for vim, this bundle provides syntax highlighting and
    improved indentation.
- [Plug 'senderle/restoreview'](/senderle/restoreview)
  - This plugin saves and restores your view, preserving cursor positions
    and folds. It's quite simple, but it takes steps to avoid throwing errors
    when views no longer exist or have been changed unexpectedly.
- [Plug 'tpope/vim-cucumber', { 'for': 'feature' }](/tpope/vim-cucumber)
  - This is the development version of Vim's included runtime files for the Ruby
    acceptance testing framework Cucumber. It provides syntax highlighting,
    indenting, and some editing commands.
- [Plug 'tpope/vim-haml', { 'for': 'haml' }](/tpope/vim-haml)
  - This project contains the runtime files for Haml, Sass, and SCSS that ship
    with Vim. You only need it if you want the very latest updates.

### Configuration tools

- [Plug 'alexesba/nrun.vim'](/alexesba/nrun.vim)
- [Plug 'editorconfig/editorconfig-vim'](/editorconfig/editorconfig-vim)
  - This is an EditorConfig plugin for Vim. This plugin can be found on both
    GitHub and Vim online.

### Linter tools

- [Plug 'neoclide/coc.nvim', {'branch': 'release'}](/neoclide/coc.nvim)
  - Make your Vim/Neovim as smart as VSCode.
  - Plugins installed by default in this repository:
  ```vim
    let g:coc_global_extensions = [
          \ 'coc-eslint',
          \ 'coc-json',
          \ 'coc-solargraph',
          \ 'coc-stylelintplus',
          \ 'coc-tsserver',
          \ 'coc-markdownlint',
          \ 'coc-spell-checker',
          \ 'coc-yaml'
          \]
  ```

### Search tools

- [Plug 'lambdalisue/fern.vim'](/lambdalisue/fern.vim)
  - Fern (furn) is a general purpose asynchronous tree viewer written in pure
    Vim script.
- [Plug 'nvim-lua/plenary.nvim'](/nvim-lua/plenary.nvim)
- [Plug 'nvim-lua/popup.nvim'](/nvim-lua/popup.nvim)
  - An implementation of the Popup API from vim in Neovim.
- [Plug 'nvim-telescope/telescope.nvim'](/nvim-telescope/telescope.nvim)
  - telescope.nvim is a highly extendable fuzzy finder over lists. Built on the
    latest awesome features from neovim core. Telescope is centered around
    modularity, allowing for easy customization.

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

  ![image](https://user-images.githubusercontent.com/579793/128131558-77138082-aec9-48cd-93dd-a35f20eb9d6c.png?)

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

-----

## Adding Customization

There is a way to customize the vim appearance. by following the steps listed
bellow:

```sh
Step:1 Open/create the following file under your home directory.
vim ~/.vimrc

# Now you can start adding your own configuration.

# e.g: changing the default colorscheme

#    | name              | background light | background dark |
#    |-------------------|------------------|-----------------|
#    | OceanicNext       | false            | false           |
#    | gruvbox           | true             | true            |
#    | materialbox       | true             | true            |
#    | scheakur          | true             | true            |
#    | OceanicNextLight  | false            | false           |
#    | vim-monokai-tasty | false            | false           |
#    | PaperColor        | true             | true            |
#    | codedark          | false            | false           |

# There is a special configuration for the colorscheme ayu, for this color 
# you will need to choose only one from the following list.

#    | colorscheme | ayucolor |
#    |-------------|----------|
#    | ayu         | light    |
#    | ayu         | mirage   |
#    | ayu         | dark     |

# let ayucolor="light"  " for light version of theme
# let ayucolor="mirage" " for mirage version of theme
# let ayucolor="dark"   " for dark version of theme

# colorscheme ayu -> if you decide to go with the ayu scheme

# for other color scheme with background ligth choose only one of the next commands
# set background=light
# set background=dark

# then set your colorscheme variable e.gruvbox

let ayucolor=light
colorscheme ayu
```

## Installing custom plugins

```sh
# create the .plug.vim file under your home directory
vim ~/.plug.vim

# And add the plugins you want.

#e.g

Plug 'Yggdroot/indentLine'

# After that call the command

:Reload
:PlugInstall

# And that's it. you have done with the installation.
```
