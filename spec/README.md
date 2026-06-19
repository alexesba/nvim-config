# Development

## Tests

```bash
make test
```

Uses [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) (cloned into `deps/` on first run).

Current coverage:

- `lua/reprobado/init.lua` — setup, play edge cases, commands, `ensure_player`
- `lua/utils/local.lua` — missing overlay file is a no-op

```bash
make clean   # remove deps/ and .test-state/
```

## CI

GitHub Actions runs `make test` on pull requests targeting `master` and on pushes to `master`. Workflow: [`.github/workflows/ci.yml`](../.github/workflows/ci.yml).

You can also run it manually: **Actions → CI → Run workflow**.
