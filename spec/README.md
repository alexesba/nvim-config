# Development

## Tests

```bash
make test
```

Uses [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) (cloned into `deps/` on first run).

Current coverage:

- `lua/reprobado/init.lua` — setup, play, commands, `ensure_player` (vorbis-tools install paths)
- `lua/utils/cmdPreservePosition.lua` — cursor preserved after commands
- `lua/utils/map.lua` — default `noremap` and merged caller options
- `lua/utils/require_tool.lua` — missing-tool detection with OS-specific install hints
- `lua/utils/format.lua` — conform formatter dispatch for SQL/JSON/XML commands
- `lua/utils/functions.lua` — in-buffer transforms and external-tool command wiring

Format helpers that shell out to OS tools are covered by contract tests (mocked `vim.cmd` / `cmdPreservePosition`), not by running the binaries in CI:

| Command / function | External tool |
|--------------------|---------------|
| `FormatXML` | `python3` (`xml.dom.minidom`) |
| `FormatSQL` / `FormatSQLFormatter` | `sqlformat`, `sql-formatter-cli` (via conform) |
| `FormatXML` | `python3` (via conform) |
| `RemoveExtraEmptyLines` | `cat` |

Install these locally when you use the commands. If a tool is missing, Neovim notifies you with the install command to run (e.g. `pip3 install sqlparse`). CI verifies both the install hints and the expected filter wiring.

- `lua/utils/local.lua` — overlay load, missing file, and error notification
- `lua/config/autocmds.lua` — command registration, `CopyFullPath`, `CopyRelativePath`

```bash
make clean   # remove deps/ and .test-state/
```

## CI

GitHub Actions runs `make test` on pull requests targeting `master` and on pushes to `master`. Workflow: [`.github/workflows/ci.yml`](../.github/workflows/ci.yml).

You can also run it manually: **Actions → CI → Run workflow**.
