local set = vim.opt
set.number = true
set.cp = false
set.hidden = true
set.expandtab = true
set.backup = false
set.wrap = false
set.writebackup = false
set.autoindent = true
set.hlsearch = true
set.incsearch = true
set.showmatch = true
set.backspace = { 'indent','eol','start' }
set.laststatus = 2
set.ruler = true
set.listchars = {
  eol = '$',
  extends = '>',
  precedes = '<',
  tab = '>-',
  trail = '~'
}
set.swapfile = true
set.synmaxcol = 150
set.cursorline = true
set.signcolumn = 'yes'
set.termguicolors = true

set.diffopt:append { 'vertical' }

vim.g.mapleader = ","

vim.g.table_mode_corner = '+'
vim.g.enable_italic_font = 1
vim.inccommand='nosplit'
vim.opt.colorcolumn = '81'

function OnAttach(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<A-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<A-p>', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '<A-n>', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer=bufnr,
    callback = function()
      local opts = {
        focusable = false,
        scope = 'line',
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',  -- show source in diagnostic popup window
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
