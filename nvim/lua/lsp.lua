vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

-- What to install ------------------------------------------------------------
local parsers = { "c", "cpp", "rust", "lua", "typst", "latex", "python", "go" }

-- Filetypes (not parser names!) that should start treesitter highlighting
local ts_filetypes =
  { "c", "cpp", "rust", "go", "lua", "typst", "tex", "python" }

local servers = {
  "clangd",
  "rust_analyzer",
  "tinymist",
  "texlab",
  "lua_ls",
  "basedpyright",
  "gopls",
}

local tools = {
  -- language servers
  "clangd",
  "rust-analyzer",
  "tinymist",
  "lua-language-server",
  "texlab",
  "basedpyright",
  "gopls",
  -- formatters
  "clang-format",
  "stylua",
  "typstyle",
  "ruff", -- used by conform's ruff_format
  -- needed to build treesitter parsers
  "tree-sitter-cli",
}

-- Mason (first, so its bin directory is on PATH for everything below) --------
require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = tools,
  auto_update = true,
})

-- Treesitter -----------------------------------------------------------------
require("nvim-treesitter").setup()
require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
  pattern = ts_filetypes,
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf) -- parser may not be built yet
  end,
})

-- LSP ------------------------------------------------------------------------
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      diagnostics = {
        globals = { "MiniPick", "MiniExtra", "MiniStatusline" },
      },
    },
  },
})

vim.lsp.enable(servers)
