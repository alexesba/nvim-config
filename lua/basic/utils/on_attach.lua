local function on_attach(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', "<cmd>Telescope lsp_definitions<cr>", bufopts)
  vim.keymap.set('n', 'gi', "cmd>Telescope lsp_implementations<cr>", bufopts)
  vim.keymap.set('n', 'gt', "cmd>Telescope lsp_type_definitions<cr>", bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>h', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
  -- vim.keymap.set('n', '<space>td', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        scope = 'line',
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always', -- show source in diagnostic popup window
        prefix = ' '
      }

      if not vim.b.diagnostics_pos then
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2]) and
          #vim.diagnostic.get() > 0
      then
        vim.diagnostic.open_float(nil, opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end
  })
end

return on_attach
