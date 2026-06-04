# Neovim configuration (LazyVim)

Personal Neovim setup based on [LazyVim](https://github.com/LazyVim/LazyVim), managed with [lazy.nvim](https://github.com/folke/lazy.nvim). It extends the LazyVim starter with custom plugins, editor options, Telescope mappings, colorscheme persistence, and workflow commands for Ruby, SQL, JSON, and more.

For LazyVim’s built-in features and default keymaps, see the [LazyVim documentation](https://lazyvim.github.io).

## Requirements

- Neovim **≥ 0.11.2** (LuaJIT build)
- Git **≥ 2.19.0**
- A [Nerd Font](https://www.nerdfonts.com/) (icons in UI plugins)
- Optional CLI tools used by custom commands: `python3`, `sqlformat`, `underscore`, `ogg123` (audio commands), etc.

## Installation

### Automated (recommended)

From a clone of this repo:

```bash
git clone https://github.com/alexesba/nvim-config.git
cd nvim-config
chmod +x install.sh
./install.sh
```

The script will:

1. Check for `git` and Neovim (install Neovim via Homebrew/apt/pacman/dnf if missing)
2. Back up an existing `~/.config/nvim` to `~/.config/nvim.bak.<timestamp>`
3. Symlink this repo to `~/.config/nvim`
4. Run `nvim --headless "+Lazy! sync"` to install all plugins
5. Open Neovim

One-liner (clone + install, no local repo):

```bash
git clone --depth 1 https://github.com/alexesba/nvim-config.git /tmp/nvim-config \
  && /tmp/nvim-config/install.sh
```

Environment variables (optional):

| Variable | Default | Purpose |
| --- | --- | --- |
| `INSTALL_DIR` | `~/.config/nvim` | Where config is installed |
| `REPO_URL` | `https://github.com/alexesba/nvim-config.git` | Clone URL when not run from repo |

### Manual

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/alexesba/nvim-config.git ~/.config/nvim
cd ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
nvim
```

Run `:Lazy` to check plugin status, `:Lazy sync` to install or update plugins, and `:LazyExtras` to manage LazyVim extras.

## What’s included

### Base stack

- **LazyVim** — IDE-style defaults (LSP, formatting, linting, treesitter, which-key, etc.)
- **lazy.nvim** — plugin manager
- **Leader key** — `,` (comma), set in `lua/config/options.lua`

### LazyVim extras (`lazyvim.json`)

| Extra | Purpose |
| --- | --- |
| `ai.copilot` | GitHub Copilot integration |
| `ai.copilot-chat` | Copilot Chat |
| `coding.mini-surround` | Surround text with pairs (brackets, quotes, etc.) |

### Custom plugins (`lua/plugins/`)

| Plugin | Role |
| --- | --- |
| `telescope.nvim` | Fuzzy finder (files, grep, buffers, colorschemes, keymaps) |
| `oil.nvim` | File explorer (default explorer; Neo-tree / mini.files disabled) |
| `luatab.nvim` | Tab line UI |
| `noice.nvim` | Rounded LSP hover/signature borders (cmdline/messages left to defaults) |
| `vim-dadbod` + UI | Database connections and SQL buffers |
| `tpope/vim-abolish`, `vim-bundler` | Ruby/refactor helpers |
| `markdown-preview.nvim` | Live Markdown preview in browser |
| `asyncrun.vim` | Run shell commands asynchronously |
| `sainnhe/sonokai` | Sonokai colorscheme (lazy-loaded) |
| `colorscheme-persist` | Remember last colorscheme across sessions |

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
- **Colorschemes** — default Tokyo Night (moon); last pick restored on startup (Telescope or `:colorscheme`); fallback Tokyo Night if saved theme fails

Saved theme path: `~/.local/state/nvim/last-colorscheme`

## Usage

### Telescope

| Key | Action |
| --- | --- |
| `,ff` | Find files (ignores `node_modules`, `.git`) |
| `,fg` | Live grep |
| `,fk` | Grep word under cursor |
| `,fb` | Buffers |
| `,fh` | Help tags |
| `,fc` | Colorscheme picker (preview enabled; choice is persisted) |
| `,fm` | Keymaps |

`:ColorScheme` also opens the colorscheme picker.

### Colorschemes

1. `,fc` or `:ColorScheme` — pick a theme in Telescope.
2. Or `:colorscheme <name>` (e.g. `sonokai`, `tokyonight`).
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

### Markdown

| Key | Action |
| --- | --- |
| `,mp` | Toggle Markdown preview (`markdown` / `md` buffers) |

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
| `,1` … `,9`, `,0` | Go to tab 1–9 / last tab |

### Config

| Key / command | Action |
| --- | --- |
| `:OpenConfig` | Edit `$MYVIMRC` |
| `:Reload` | Source config |
| `,fef` | Format whole buffer (`gg=G`) |
| `,cf` | Copy full file path to clipboard |

### Custom commands (`:command`)

Formatting and cleanup: `FormatJSON`, `FormatJSONV2`, `FormatCss`, `FormatSQL`, `FormatSQLV2`, `FormatXML`, `RemoveEmptyLines`, `RemoveExtraEmptyLines`, `CleanWhiteSpaces`, `ConvertTabToSpaces`, `AddLineNumbers`, `RemoveLineBreak`

Quotes / Ruby: `DoubleQuotes`, `SingleQuotes`, `DoubleQuotesC`, `SingleQuotesC`, `HashNewSyntax`, `HashOldSyntax`, `UpdateRubyHashesByLines`, `UnscapeDoubleQuotes`

Paths: `CopyFullPath`, `CopyRelativePath`

Misc: `ShowHiName` (highlight group under cursor), `Reprobado` / `Reprobada` (audio; needs `ogg123`)

Use `:command` or Telescope `,fm` to discover more.

### Other custom normal-mode maps

| Key | Action |
| --- | --- |
| `,no` / `,na` | Play Reprobado / Reprobada sound |
| `,rp` | Start substitute for word under cursor |
| `Y` | Yank to end of line |
| `Esc` | Clear search highlight |

LazyVim’s own maps (LSP, windows, etc.) still apply — press `,` and wait for which-key, or check [LazyVim keymaps](https://www.lazyvim.org/keymaps).

## Project layout

```
├── install.sh            # Automated install + plugin sync + launch nvim
├── init.lua              # Entry: loads config.lazy
├── lazyvim.json          # LazyVim extras and version metadata
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # lazy.nvim + LazyVim bootstrap
│   │   ├── options.lua   # vim options, leader, UI prefs
│   │   ├── keymaps.lua   # Custom keymaps
│   │   ├── autocmds.lua  # Autocmds + user commands
│   │   └── colorscheme.lua  # Persist/load theme helpers
│   ├── plugins/          # Plugin specs (one file per concern)
│   └── utils/            # Shared helpers (map, functions, etc.)
└── README.md
```

Add or override plugins by creating files under `lua/plugins/`; they are imported automatically from `lua/config/lazy.lua`.

## Customization

- **Change default colorscheme behavior** — `lua/plugins/colorscheme-persist.lua`, `lua/config/colorscheme.lua`
- **Add plugins** — new `lua/plugins/<name>.lua` returning a lazy spec table
- **Toggle LazyVim extras** — `:LazyExtras` or edit `lazyvim.json`
- **Disable a plugin** — `enabled = false` in a spec, or `lua/plugins/disabled.lua`

## Links

- [LazyVim docs](https://lazyvim.github.io)
- [lazy.nvim docs](https://lazy.folke.io)
- [LazyVim starter](https://github.com/LazyVim/starter)
