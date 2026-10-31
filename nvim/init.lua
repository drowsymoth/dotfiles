vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
require("mini.deps").setup()

MiniDeps.now(function()
  require("options")
  require("colorscheme")
end)

require("mini")
require("plugins")
require("lsp")
require("keymaps")
