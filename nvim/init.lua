vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
require("mini.deps").setup()

MiniDeps.now(function()
  require("options")
  vim.cmd.colorscheme("minispring")
end)

require("mini")
require("plugins")
require("lsp")
require("keymaps")
