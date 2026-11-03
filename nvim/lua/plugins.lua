MiniDeps.later(function()
  MiniDeps.add({
    source = "MeanderingProgrammer/render-markdown.nvim",
    depends = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
  })
  require("render-markdown")

  MiniDeps.add({
    source = "saghen/blink.cmp",
    depends = { "rafamadriz/friendly-snippets" },
    checkout = "v1.10.0",
  })
  require("blink.cmp").setup({
    keymap = {
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-l>"] = { "accept", "fallback" },
    },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
  })

  MiniDeps.add({
    source = "stevearc/conform.nvim",
  })
  require("conform").setup({
    formatters_by_ft = {
      rust = { "rustfmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      lua = { "stylua" },
      typst = { "typstyle" },
      python = { "ruff" },
    },
    formatters = {
      stylua = {
        prepend_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
          "--column-width",
          "80",
        },
      },
      clang_format = {
        prepend_args = {
          "--style={IndentWidth: 4, UseTab: Never}",
        },
      },
    },
    format_on_save = true,
  })

  MiniDeps.add({
    source = "akinsho/toggleterm.nvim",
  })
  require("toggleterm").setup({})

  MiniDeps.add({
    source = "folke/todo-comments.nvim",
    depends = { "nvim-lua/plenary.nvim" },
  })
  require("todo-comments").setup()
end)

MiniDeps.now(function()
  MiniDeps.add({
    source = "chomosuke/typst-preview.nvim",
  })
  require("typst-preview")
end)
