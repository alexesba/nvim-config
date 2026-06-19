# Development

## Tests

```bash
make test
```

Uses [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) (cloned into `deps/` on first run).

Current coverage:

- `lua/reprobado/init.lua` — setup, play, commands, `ensure_player` (vorbis-tools install paths)
- `lua/utils/cmdPreservePosition.lua` — cursor preserved after commands
- `lua/utils/map.lua` — default `noremap` and option merging
- `lua/utils/local.lua` — overlay load, missing file, and error notification
- `lua/config/autocmds.lua` — command registration, `CopyFullPath`, `CopyRelativePath`

Format commands that shell out to external tools (`FormatSQL`, `FormatJSON`, etc.) are intentionally not unit-tested here.

```bash
make clean   # remove deps/ and .test-state/
```

## CI

GitHub Actions runs `make test` on pull requests targeting `master` and on pushes to `master`. Workflow: [`.github/workflows/ci.yml`](../.github/workflows/ci.yml).

You can also run it manually: **Actions → CI → Run workflow**.
