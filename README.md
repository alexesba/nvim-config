# Neovim configuration (LazyVim)

Personal Neovim setup based on [LazyVim](https://github.com/LazyVim/LazyVim), managed with [lazy.nvim](https://github.com/folke/lazy.nvim). It extends LazyVim with third-party plugins, local overrides, colorscheme persistence, and workflow commands for Ruby, SQL, JSON, and more.

For LazyVim’s built-in features and default keymaps, see the [LazyVim documentation](https://lazyvim.github.io).

## Requirements

- Neovim **≥ 0.11.2** (LuaJIT build)
- Git **≥ 2.19.0**
- A [Nerd Font](https://www.nerdfonts.com/) (icons in UI plugins)
- Optional CLI tools used by custom commands: `python3`, `sqlformat`, `underscore`, `ogg123` (audio commands), etc.

## Installation

Use `install.sh` — it checks dependencies, backs up any existing config, installs into `~/.config/nvim`, syncs plugins, and opens Neovim.

There are **three ways** to install (the script picks the right one automatically):

| Situation | What `./install.sh` does |
| --- | --- |
| **`curl \| bash`** | **clone** — clones into `~/.config/nvim` |
| **Clone into `~/.config/nvim`**, then `./install.sh` | **ready** — config is already in place; only syncs plugins (no backup, no symlink) |
| **Clone elsewhere** (e.g. `~/Projects/nvim-config`), then `./install.sh` | **link** — symlinks `~/.config/nvim` → that folder |

### Option 1 — One command (`curl`)

```bash
curl -fsSL https://raw.githubusercontent.com/alexesba/nvim-config/master/install.sh | bash
```

Clones into `~/.config/nvim`, syncs plugins, opens Neovim.

### Option 2 — Clone directly into `~/.config/nvim`

```bash
git clone https://github.com/alexesba/nvim-config.git ~/.config/nvim
cd ~/.config/nvim
./install.sh
```

The repo is already where Neovim expects it. The script detects **ready** mode: it does **not** move or symlink your config, only runs plugin sync and opens Neovim.

### Option 3 — Clone anywhere else, then `./install.sh`

```bash
git clone https://github.com/alexesba/nvim-config.git ~/Projects/nvim-config
cd ~/Projects/nvim-config
./install.sh
```

Uses **link** mode: symlinks `~/.config/nvim` → your clone. Good if you keep the repo under `~/Projects` (or similar) and edit it there.

**Rule of thumb:** if you run `./install.sh` from inside the repo, the script checks whether that folder **is** `~/.config/nvim` (ready) or should be **linked** to it (link).

### What the script does

1. Check for `git` and Neovim (install Neovim via Homebrew/apt/pacman/dnf if missing)
2. Back up existing `~/.config/nvim` to `~/.config/nvim.bak.<timestamp>`
3. **clone** or **link** as above
4. Ask for your `<leader>` key when run interactively (default `,`; skipped if `leader.local.lua` already exists)
5. Seed `options.local.lua` and `keymaps.local.lua` from examples if missing (never overwrites existing files)
6. Run `nvim --headless "+Lazy! sync"` to install plugins
7. Open Neovim

```bash
./install.sh --help   # usage and environment variables
```

| Variable | Default | Purpose |
| --- | --- | --- |
| `INSTALL_DIR` | `~/.config/nvim` | Neovim config path |
| `REPO_URL` | `https://github.com/alexesba/nvim-config.git` | Clone URL (**clone** mode) |
| `REPO_BRANCH` | `master` | Branch to clone |
| `INSTALL_MODE` | auto (`ready` / `link` / `clone`) | Force `clone` or `link` |
| `MAPLEADER` | `,` | Leader key when install is non-interactive (`curl \| bash`) |
| `FORCE_LEADER` | — | Set to `1` to choose leader again during install |
| `FORCE_LOCAL` | — | Set to `1` to re-copy `options.local.lua` / `keymaps.local.lua` from examples |

After install: `:Lazy`, `:Lazy sync`, `:LazyExtras`.

**Clone without `install.sh`?** Defaults work out of the box (`<leader>` is `,`). Run `nvim --headless "+Lazy! sync" +qa` once, then copy any `*.local.lua.example` to `*.local.lua` to customize (those files are gitignored).

## What’s included

### Base stack

- **LazyVim** — IDE-style defaults (LSP, formatting, linting, treesitter, which-key, etc.)
- **lazy.nvim** — plugin manager
- **Leader key** — `<leader>` (default: `,` comma). Override in `lua/config/leader.local.lua` (gitignored)

### LazyVim extras (`lazyvim.json`)

| Extra | Purpose |
| --- | --- |
| `ai.copilot` | GitHub Copilot integration |
| `ai.copilot-chat` | Copilot Chat |
| `coding.mini-surround` | Surround text with pairs (brackets, quotes, etc.) |

### Third-party plugins (not part of LazyVim)

These are added under `lua/plugins/` and are **not** shipped with LazyVim by default. LazyVim’s own stack (LSP, Treesitter, Snacks picker, Tokyo Night, etc.) is documented in the [LazyVim docs](https://www.lazyvim.org/plugins).

| Plugin | Config file | Why it’s here |
| --- | --- | --- |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | `oil.lua` | Default file explorer (Neo-tree / mini.files / Snacks explorer disabled) |
| [luatab.nvim](https://github.com/alvarosevilla95/luatab.nvim) | `luatab.lua` | Tab line UI (bufferline disabled) |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | `markdown_preview.lua` | Live Markdown preview in the browser |
| [vim-dadbod](https://github.com/tpope/vim-dadbod) + [UI](https://github.com/kristijanhusak/vim-dadbod-ui) + completion | `dadbod.lua` | SQL database connections and query buffers |
| [vim-abolish](https://github.com/tpope/vim-abolish) | `tpope.lua` | Case and variant word operations (`cr*` maps) |
| [vim-bundler](https://github.com/tpope/vim-bundler) | `tpope.lua` | Jump to gems from `Gemfile` (`gf` in Ruby buffers) |
| [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim) | `reprobado.lua` | Background jobs for `:Reprobado` / `:Reprobada` audio |
| [vim-fetch](https://github.com/kopischke/vim-fetch) | `vim-fetch.lua` | Preserve file cursor position across reloads |
| [clipring.nvim](https://github.com/alexesba/clipring.nvim) | `clipring.lua` | Persistent yank/clipboard history ring |

#### oil.nvim

- Replaces LazyVim’s default file trees as the primary explorer.
- `-` opens the parent directory; `:Explorer` / `:Explore` / `:Exp` open Oil in the current directory.
- `nvim .` opens Oil when you pass a directory on the command line.

#### markdown-preview.nvim

- **Requires a one-time build:** lazy.nvim runs `cd app && npx --yes yarn` on install.
- Loads only for `markdown` / `md` filetypes.
- `<leader>mp` toggles the browser preview (`MarkdownPreviewToggle`).
- Preview does not auto-start or auto-close (`mkdp_auto_start` / `mkdp_auto_close` are off).

#### vim-dadbod stack

- `:DBUI` opens the database UI; `:DBUIToggle`, `:DBUIAddConnection`, `:DBUIFindBuffer` are also available.
- SQL completion loads in `sql` / `mysql` / `plsql` buffers via `vim-dadbod-completion`.
- Connection strings and UI layout follow vim-dadbod-ui defaults (Nerd Font icons enabled).

#### tpope (Ruby workflow)

- **vim-abolish** — case and abbreviation helpers on `crs`, `crm`, `crc`, `cru`, `cr-`, `cr.`.
- **vim-bundler** — `gf` on a gem name in a Ruby buffer jumps to the bundled gem (may overlap with LazyVim git/maps; only active in `ruby` filetype).

#### reprobado (local audio commands)

- `:Reprobado` / `:Reprobada` play Ogg files from `sounds/` via `ogg123` and [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim).
- Logic lives in `lua/reprobado/init.lua`; lazy spec in `lua/plugins/reprobado.lua` (loads on command or `<leader>no` / `<leader>na`).
- Depends on [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim); installs `ogg123` when missing (Homebrew / apt / pacman / dnf / zypper).

#### clipring.nvim

- `<leader>yh` opens the yank history picker.
- Ring is persisted across sessions (`persist = true`, up to 100 entries).

### LazyVim overrides (tweaks, not new plugins)

| File | What it changes |
| --- | --- |
| `snaks.lua` | Disables Snacks file explorer (Oil is used instead); custom Snacks picker keys (`<leader>fg`, `<leader>fk`) |
| `noice.lua` | Rounded LSP hover borders only; cmdline/messages/popupmenu stay on Vim defaults |
| `lsp.lua` | Disables diagnostic virtual text (float on `CursorHold` in `autocmds.lua`) |
| `autosave-colorscheme.lua` | Saves/restores last colorscheme via [autosave-colorscheme.nvim](https://github.com/alexesba/autosave-colorscheme.nvim) |
| `disabled.lua` | Turns off `bufferline.nvim`, `neo-tree.nvim`, `mini.files` |

### Disabled LazyVim plugins

- `bufferline.nvim`
- `neo-tree.nvim`
- `mini.files`
- Snacks file explorer (Oil is used instead)

### Editor behavior (highlights)

- Line numbers + relative numbers, 81-column guide, rounded floating window borders
- Arrow keys disabled in Normal / Insert / Visual (use `hjkl`)
- Search centering (`n` / `N` with `zz`), better `J` join, undo breakpoints in Insert
- **Diagnostics** — virtual text off; float opens on `CursorHold` (see `lua/plugins/lsp.lua`, `lua/config/autocmds.lua`)
- **Colorschemes** — default Tokyo Night (moon); last pick restored on startup (`:ColorScheme`, `<leader>uC`, or `:colorscheme`); fallback Tokyo Night if saved theme fails

Saved theme path: `~/.local/state/nvim/last-colorscheme`

## Usage

### Snacks picker (LazyVim)

Common maps from the default Snacks picker extra:

| Key | Action |
| --- | --- |
| `<leader><space>` | Find files (project root) |
| `<leader>ff` | Find files (project root) |
| `<leader>fg` | Live grep (project root; custom — overrides LazyVim’s git-files on this key) |
| `<leader>sg` | Live grep (project root; LazyVim default) |
| `<leader>sG` | Live grep (cwd) |
| `<leader>fk` | Grep word under cursor / visual selection (project root) |
| `<leader>sw` | Same as `<leader>fk` (LazyVim default key) |
| `<leader>fb` / `<leader>,` | Buffers |
| `<leader>fc` | Find config file |
| `<leader>sk` | Keymaps |
| `<leader>sh` | Help pages |

Press `<leader>` and wait for which-key for the full list.

### Colorschemes

1. `<leader>uC` or `:ColorScheme` — pick a theme in Snacks (live preview, works on empty buffers).
2. Or `:colorscheme <name>` (e.g. `tokyonight`).
3. Restart Neovim — your last theme is restored automatically.

To reset persistence:

```bash
rm -f ~/.local/state/nvim/last-colorscheme
```

### File explorer (Oil)

| Key / command | Action |
| --- | --- |
| `-` | Open parent directory |
| `:Explorer`, `:Explore`, `:Exp` | Open Oil in current directory |

### Clipboard history (Clipring)

| Key | Action |
| --- | --- |
| `<leader>yh` | Open yank/clipboard history picker |

### Markdown

| Key | Action |
| --- | --- |
| `<leader>mp` | Toggle Markdown preview (`markdown` / `md` buffers) |

### Database (Dadbod)

| Command | Action |
| --- | --- |
| `:DBUI` | Database UI |
| `:DBUIToggle` | Toggle UI |
| `:DBUIAddConnection` | Add connection |
| `:DBUIFindBuffer` | Find SQL buffer |

### Tabs

| Key | Action |
| --- | --- |
| `<leader>1` … `<leader>9`, `<leader>0` | Go to tab 1–9 / last tab |

### Config

| Key / command | Action |
| --- | --- |
| `<leader>l` | Lazy plugin manager (`:Lazy`) |
| `<leader>yp` | Copy full file path to clipboard |
| `<leader>yr` | Copy file path relative to project root (cwd fallback) |
| `<leader>cf` | Format (LazyVim / conform) |
| `<leader>fc` | Find config file (Snacks picker) |

Restart Neovim after structural config changes (lazy.nvim does not fully reload on `:source`). While editing Lua config, `:LazyDev` adds LSP and tooling for plugin development.

### Custom commands (`:command`)

Formatting and cleanup: `FormatJSON`, `FormatCss`, `FormatSQL`, `FormatSQLFormatter` (`FormatSQLV2` alias), `FormatXML`, `RemoveEmptyLines`, `RemoveExtraEmptyLines`, `CleanWhiteSpaces`, `ConvertTabToSpaces`, `AddLineNumbers`, `RemoveLineBreak`

Quotes / Ruby: `DoubleQuotes`, `SingleQuotes`, `DoubleQuotesC`, `SingleQuotesC`, `HashNewSyntax`, `HashOldSyntax`, `UpdateRubyHashesByLines`, `UnscapeDoubleQuotes`

Paths: `CopyFullPath`, `CopyRelativePath`

Misc: `ShowHiName` (highlight group under cursor), `Reprobado` / `Reprobada` (audio; see `lua/reprobado/`)

Use `:command` or Snacks `<leader>sk` to browse keymaps and discover more.

### Other custom normal-mode maps

| Key | Action |
| --- | --- |
| `<leader>no` / `<leader>na` | Play Reprobado / Reprobada sound |
| `<leader>rp` | Start substitute for word under cursor |
| `Y` | Yank to end of line |
| `Esc` | Clear search highlight |

LazyVim’s own maps (LSP, windows, etc.) still apply — press `<leader>` and wait for which-key, or check [LazyVim keymaps](https://www.lazyvim.org/keymaps).

## Project layout

```
├── install.sh            # Automated install + plugin sync + launch nvim
├── init.lua              # Entry: loads config.lazy
├── lazyvim.json          # LazyVim extras and version metadata
├── sounds/               # Reprobado / Reprobada .ogg files
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # lazy.nvim + LazyVim bootstrap
│   │   ├── options.lua   # vim options + loads leader/options .local.lua
│   │   ├── keymaps.lua   # Custom keymaps + loads keymaps.local.lua
│   │   ├── leader.local.lua.example
│   │   ├── options.local.lua.example
│   │   ├── keymaps.local.lua.example
│   │   ├── autocmds.lua  # Autocmds + user commands
│   ├── plugins/          # Plugin specs (one file per concern)
│   ├── reprobado/        # Local :Reprobado / :Reprobada commands
│   └── utils/
│       └── local.lua       # dofile loader for gitignored *.local.lua overlays
└── README.md
```

Add or override plugins by creating files under `lua/plugins/`; they are imported automatically from `lua/config/lazy.lua`.

## Customization

### Personal settings (`.local.lua` overlays)

Tracked defaults live in `lua/config/options.lua` and `lua/config/keymaps.lua`. Put **your** machine-specific changes in gitignored `*.local.lua` files so `git pull` never conflicts with your personal prefs.

#### How it works

`lua/utils/local.lua` provides a small loader used by the config:

```lua
require("utils.local").load("options")  -- dofile lua/config/options.local.lua if it exists
```

- Looks for `lua/config/<name>.local.lua` under your Neovim config directory (`stdpath("config")`).
- Missing files are skipped silently (no error).
- Syntax or runtime errors in a `.local.lua` file show a `vim.notify` warning; Neovim still starts with repo defaults.

#### Files and load order

| Gitignored file | Example template | When it loads | Typical contents |
| --- | --- | --- | --- |
| `leader.local.lua` | `leader.local.lua.example` | Early in `options.lua`, right after default `vim.g.mapleader` | `vim.g.mapleader`, `vim.g.maplocalleader` |
| `options.local.lua` | `options.local.lua.example` | End of `options.lua`, after all repo `vim.opt` / `vim.g` | `vim.opt.*`, `vim.g.*`, plugin globals |
| `keymaps.local.lua` | `keymaps.local.lua.example` | End of `keymaps.lua`, after repo keymaps | `map(...)` calls via `utils.map` |

Leader loads **before** other `vim.g` settings in `options.lua` so your leader key is set early. Options and keymaps load **last** so your values override repo defaults.

All three paths are listed in `.gitignore` — they stay on your machine only.

#### Setup

**With `install.sh`** (recommended on first install):

1. Prompts for `<leader>` and writes `leader.local.lua` (skipped if the file already exists).
2. Copies `options.local.lua.example` → `options.local.lua` and `keymaps.local.lua.example` → `keymaps.local.lua` only when those files are missing.

**Manually** (clone without `install.sh`, or add overlays later):

```bash
cp lua/config/leader.local.lua.example lua/config/leader.local.lua   # optional; default leader is ,
cp lua/config/options.local.lua.example lua/config/options.local.lua
cp lua/config/keymaps.local.lua.example lua/config/keymaps.local.lua
```

Then edit the `.local.lua` files. Restart Neovim after changes (lazy.nvim does not fully hot-reload structural config).

#### Examples

`leader.local.lua`:

```lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
```

`options.local.lua`:

```lua
vim.opt.relativenumber = false
vim.opt.colorcolumn = "100"
vim.opt.wrap = true
```

`keymaps.local.lua`:

```lua
local map = require("utils.map").map
map("n", "<leader>x", "<cmd>echo 'my map'<cr>", { noremap = true, silent = true })
```

#### Forcing a reset

`install.sh` **never overwrites** existing local files. To regenerate from examples:

| Goal | Command |
| --- | --- |
| Re-prompt for leader | `FORCE_LEADER=1 ./install.sh` |
| Re-copy options/keymaps templates | `FORCE_LOCAL=1 ./install.sh` |
| Both | `FORCE_LEADER=1 FORCE_LOCAL=1 ./install.sh` |

`FORCE_LOCAL` only affects `options.local.lua` and `keymaps.local.lua`; leader still uses `FORCE_LEADER`.

### Other customization

- **Change default colorscheme behavior** — `lua/plugins/autosave-colorscheme.lua` ([autosave-colorscheme.nvim](https://github.com/alexesba/autosave-colorscheme.nvim))
- **Add plugins** — new `lua/plugins/<name>.lua` returning a lazy spec table
- **Toggle LazyVim extras** — `:LazyExtras` or edit `lazyvim.json`
- **Disable a plugin** — `enabled = false` in a spec, or `lua/plugins/disabled.lua`

## Links

- [LazyVim docs](https://lazyvim.github.io)
- [lazy.nvim docs](https://lazy.folke.io)
- [LazyVim starter](https://github.com/LazyVim/starter)
