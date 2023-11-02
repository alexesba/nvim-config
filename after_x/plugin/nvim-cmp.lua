vim.o.completeopt = "menuone,noselect"

local cmp = prequire("cmp")

if(cmp) then
  cmp.setup({
      snippet = {
        expand = function(args)
          require('snippy').expand_snippet(args.body) -- For `snippy` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping {
          i = cmp.mapping.confirm { select = true },
        },
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
      }, {
        {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
      }
      })
    })
end
