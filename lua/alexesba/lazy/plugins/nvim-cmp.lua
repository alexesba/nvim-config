return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    -- { 'hrsh7th/cmp-cmdline' },
    {
      'dcampos/nvim-snippy',
      dependencies = {
        'dcampos/cmp-snippy',
        'honza/vim-snippets'
      }
    },
  },
  config = function()
    -- vim.o.completeopt = 'menuone,noselect'
    local cmp = require('cmp')

    local snippy = require('snippy')

    cmp.setup({
      completion = {
        completeopt = 'menuone,noselect',
      },
      snippet = {
        expand = function(args)
          snippy.expand_snippet(args.body)
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
        ['<CR>'] = cmp.mapping {
          i = cmp.mapping.confirm { select = true },
        },
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'snippy' },
        { name = 'path' },
      }, {
        {
          name = 'buffer',
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        }
      })
    })
  end
}
