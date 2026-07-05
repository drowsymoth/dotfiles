MiniDeps.later(function()
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
  })
end)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "rust", "lua", "typst", "latex", "python" },
  callback = function()
    vim.treesitter.start()
  end,
})

MiniDeps.later(function()
  MiniDeps.add({
    source = "mason-org/mason.nvim",
  })
  MiniDeps.add({
    source = "WhoIsSethDaniel/mason-tool-installer.nvim",
  })
  require("mason").setup()
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
    },
    auto_update = true,
  })
  vim.schedule(function()
    vim.cmd("MasonToolsInstall")
  end)
end)

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = { ".clangd", "compile_commands.json", ".git" },
})
vim.lsp.enable("clangd")

vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml" },
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("tinymist", {
  cmd = { "tinymist" },
  filetypes = { "typst" },
})
vim.lsp.enable("tinymist")

vim.lsp.config("texlab", {
  cmd = { "texlab" },
  filetypes = { "latex" },
})
vim.lsp.enable("texlab")

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})
vim.lsp.enable("lua_ls")

vim.lsp.config("ruff", {
  cmd = { "ruff" },
  filetypes = { "python" },
})
vim.lsp.enable("ruff")
