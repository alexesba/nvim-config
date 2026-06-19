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
- `lua/utils/functions.lua` — in-buffer transforms (tabs, quotes, hashes, whitespace) and external-tool command wiring

Format helpers that shell out to OS tools are covered by contract tests (mocked `vim.cmd` / `cmdPreservePosition`), not by running the binaries in CI:

| Command / function | External tool |
|--------------------|---------------|
| `FormatXML` | `python3` (`xml.dom.minidom`) |
| `FormatSQL` | `sqlformat` |
| `FormatSQLV2` | `sql-formatter-cli` |
| `RemoveExtraEmptyLines` | `cat` |
| `FormatJSON` / `FormatJSONV2` (autocmds) | `python3`, `underscore` |

Install these locally when you use the commands; CI only verifies the Neovim side dispatches the expected filter.

- `lua/utils/local.lua` — overlay load, missing file, and error notification
- `lua/config/autocmds.lua` — command registration, `CopyFullPath`, `CopyRelativePath`

```bash
make clean   # remove deps/ and .test-state/
```

## CI

GitHub Actions runs `make test` on pull requests targeting `master` and on pushes to `master`. Workflow: [`.github/workflows/ci.yml`](../.github/workflows/ci.yml).

You can also run it manually: **Actions → CI → Run workflow**.
