MiniDeps.now(function()
  MiniDeps.add({
    source = "nvim-treesitter/nvim-treesitter",
  })
  require("nvim-treesitter").setup()
  require("nvim-treesitter").install({
    "c",
    "cpp",
    "rust",
    "lua",
    "typst",
    "latex",
    "python",
    "sql",
  })

  MiniDeps.add({
    source = "neovim/nvim-lspconfig",
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "rust", "lua", "typst", "latex", "python", "sql" },
    callback = function()
      vim.treesitter.start()
    end,
  })

  MiniDeps.add({
    source = "mason-org/mason.nvim",
  })
  require("mason").setup()

  vim.lsp.enable(
    "clangd",
    "rust_analyzer",
    "tinymist",
    "texlab",
    "lua_ls",
    "ruff",
    "sqls"
  )
end)

MiniDeps.later(function()
  MiniDeps.add({
    source = "WhoIsSethDaniel/mason-tool-installer.nvim",
  })
  require("mason-tool-installer").setup({
    ensure_installed = {
      "clangd",
      "clang-format",
      "rust-analyzer",
      "tinymist",
      "lua-language-server",
      "stylua",
      "texlab",
      "tree-sitter-cli",
      "typstyle",
      "ruff",
      "sqls",
    },
    auto_update = true,
  })
  vim.schedule(function()
    vim.cmd("MasonToolsInstall")
  end)
end)
