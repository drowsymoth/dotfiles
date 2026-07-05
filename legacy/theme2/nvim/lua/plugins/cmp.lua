return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',    -- A good event for lazy loading
  dependencies = {
    'hrsh7th/cmp-buffer',   -- buffer completion source
    'hrsh7th/cmp-path',     -- path completion source
    'hrsh7th/cmp-nvim-lsp', -- LSP completion source
    'hrsh7th/vim-vsnip',    -- A snippet engine (vsnip)
    'hrsh7th/cmp-vsnip',    -- vsnip completion source
    'rafamadriz/friendly-snippets',
  }
}
