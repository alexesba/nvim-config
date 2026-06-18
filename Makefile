nvim_path ?= nvim
plenary_dir := deps/plenary.nvim

.PHONY: test deps clean

deps:
	@mkdir -p deps
	@test -d $(plenary_dir) || git clone --depth=1 https://github.com/nvim-lua/plenary.nvim $(plenary_dir)

test: deps
	@$(nvim_path) --headless --noplugin -u tests/minimal_init.lua \
		"+lua require('plenary.test_harness').test_directory('tests', { minimal_init = './tests/minimal_init.lua', sequential = true }); vim.cmd('qa!')"

clean:
	rm -rf deps .test-state
