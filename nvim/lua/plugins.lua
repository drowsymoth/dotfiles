local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  -- Markdown
  gh("MeanderingProgrammer/render-markdown.nvim"),

  -- Completion
  gh("rafamadriz/friendly-snippets"),
  { src = gh("saghen/blink.cmp"), version = "v1.10.0" },

  -- Formatting
  gh("stevearc/conform.nvim"),

  -- Terminal
  gh("akinsho/toggleterm.nvim"),

  -- TODO highlighting
  gh("nvim-lua/plenary.nvim"),
  gh("folke/todo-comments.nvim"),

  -- Symbol outline
  gh("nvim-tree/nvim-web-devicons"),
  gh("stevearc/aerial.nvim"),

  -- Typst
  {
    src = gh("chomosuke/typst-preview.nvim"),
    version = vim.version.range("1.*"),
  },
})

-- Markdown ------------------------------------------------------------------
require("render-markdown").setup({})

-- Completion ----------------------------------------------------------------
require("blink.cmp").setup({
  keymap = {
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-l>"] = { "accept", "fallback" },
  },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  signature = { enabled = true },
})

-- Formatting ----------------------------------------------------------------
require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    go = { "gofmt" },
    lua = { "stylua" },
    python = { "ruff_format" },
    rust = { "rustfmt" },
    typst = { "typstyle" },
  },
  default_format_opts = { lsp_format = "fallback" },
  format_on_save = { timeout_ms = 1000 },
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
      -- respect a project's .clang-format; otherwise use our own style
      prepend_args = function(_, ctx)
        if
          vim.fs.find(".clang-format", { upward = true, path = ctx.dirname })[1]
        then
          return {}
        end
        return { "--style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}" }
      end,
    },
  },
})

-- Terminal ------------------------------------------------------------------
require("toggleterm").setup({})

-- TODO comments -------------------------------------------------------------
require("todo-comments").setup()

-- Outline -------------------------------------------------------------------
require("aerial").setup({
  attach_mode = "global",
  backends = { "lsp", "treesitter", "markdown", "man" },
  guides = {
    mid_item = "├ ",
    last_item = "└ ",
    nested_top = "│ ",
    whitespace = "  ",
  },
  show_guides = true,
  autojump = false,
  open_automatic = true,
})

-- Typst ---------------------------------------------------------------------
require("typst-preview").setup() -- also downloads the preview binaries
