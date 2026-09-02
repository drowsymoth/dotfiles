MiniDeps.later(function()
  MiniDeps.add({
    source = "stevearc/oil.nvim",
  })
  require("oil").setup()
end)

MiniDeps.later(function()
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
end)

MiniDeps.later(function()
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
end)

MiniDeps.later(function()
  MiniDeps.add({
    source = "akinsho/toggleterm.nvim",
  })
  require("toggleterm").setup()
end)

MiniDeps.later(function()
  MiniDeps.add({
    source = "vyfor/cord.nvim",
  })
  require("cord").setup()
end)
