-- Run build/update steps when vim.pack installs or updates a plugin.
-- This must be registered before the first vim.pack.add call.
vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("UserPack", { clear = true }),
  callback = function(ev)
    local data = ev.data
    if data.spec.name == "nvim-treesitter" and data.kind ~= "delete" then
      if not data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("options")
require("colorscheme")
require("mini")
require("plugins")
require("lsp")
require("keymaps")
