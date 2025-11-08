local cmp = require('cmp')

cmp.setup({

-- window = {
--     completion = cmp.config.window.bordered({
--       winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
--       col_offset = -3,
--       side_padding = 1,
--     }),
--     documentation = cmp.config.window.bordered(),
--   },

snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users
      -- If using luasnip, use: require('luasnip').lsp_expand(args.body)
    end,
},
sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'vsnip' },
},

mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(), -- show completion menu
    ['<C-e>'] = cmp.mapping.abort(),        -- close completion menu
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
  }),
})
