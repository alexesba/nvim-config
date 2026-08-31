local function rubocop_cmd()
  local root_dir = vim.fs.root(0, { "Gemfile", ".git" })

  if root_dir then
    local result = vim.system(
      { "bundle", "exec", "rubocop", "--version" },
      { cwd = root_dir, text = true }
    ):wait()

    if result.code == 0 then
      return { "bundle", "exec", "rubocop", "--lsp" }
    end
  end

  return { "rubocop", "--lsp" }
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      servers = {
        rubocop = {
          cmd = rubocop_cmd(),
        },
      },
    },
  },
}
