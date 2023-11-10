function ConfigItalicFonts()
  if (vim.fn.exists("g:enable_italic_font") and vim.g.enable_italic_font == 1) then
    vim.api.nvim_set_hl(0, 'TabLineSel', { ctermfg = 114, ctermbg = 237, bold = true, fg = '#99c794', bg = '#343d46' })
    vim.api.nvim_set_hl(0, 'Comment', { italic = true })
    vim.api.nvim_set_hl(0, 'Constant', { italic = true })
    vim.api.nvim_set_hl(0, 'PreProc', { italic = true })
    vim.api.nvim_set_hl(0, 'Special', { italic = true })
    vim.api.nvim_set_hl(0, 'Statement', { italic = true })
    vim.api.nvim_set_hl(0, 'Type', { italic = true })
    vim.api.nvim_set_hl(0, 'Keyword', { italic = true })
    vim.api.nvim_set_hl(0, 'jsImport', { italic = true })
    vim.api.nvim_set_hl(0, 'jsThis', { italic = true })
    vim.api.nvim_set_hl(0, 'jsSuper', { italic = true })
    vim.api.nvim_set_hl(0, 'cucumberWhen', { italic = true })
    vim.api.nvim_set_hl(0, 'cucumberThen', { italic = true })
    vim.api.nvim_set_hl(0, 'GruvboxAqua', { italic = true })
    vim.api.nvim_set_hl(0, 'GruvboxOrange', { italic = true })
  end
end

function PlayAudio(file)
  local audio_dir = vim.fn.stdpath('config') .. '/lua/alexesba/ogg-files/'
  local file_path = 'ogg123 ' .. audio_dir .. file
  vim.api.nvim_call_function('asyncrun#run', { '!', '', file_path })
end
