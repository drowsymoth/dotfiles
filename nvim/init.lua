vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
-- vim.pack.add({ "https://github.com/zenbones-theme/zenbones.nvim" })
require("mini.deps").setup()

MiniDeps.now(function()
  require("options")
  require("colorscheme")
  -- vim.cmd.colorscheme("minispring")
end)

require("mini")
require("plugins")
require("lsp")
require("keymaps")
