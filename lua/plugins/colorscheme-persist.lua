local persist = require("config.colorscheme")

return {
  {
    "LazyVim/LazyVim",
    opts = function()
      local scheme = persist.get()
      if not scheme then
        return {}
      end
      return {
        colorscheme = function()
          if not persist.apply(scheme) then
            persist.fallback()
          end
        end,
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          if vim.g.colors_name then
            persist.save(vim.g.colors_name)
          end
        end,
      })
    end,
  },
}
