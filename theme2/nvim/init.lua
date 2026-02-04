-- Set the path where lazy.nvim will be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Check if lazy.nvim is installed; if not, clone it
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Use the stable branch
    lazypath,
  })
end

-- Add lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazypath)

-- Require and setup lazy.nvim
require("lazy").setup({
  -- This is where you will add your plugins later.
  -- For now, we use a structured approach by importing a 'plugins' directory.
  { import = "plugins" },
}, {
  -- Optional: Configure the colorscheme to use while installing plugins
  checker_startup = true,
  change_detection = {
    notify = false,
  },
})

require('cmp_config')
require('options')
require('lsp')

vim.opt.pumheight = 10
vim.opt.pumwidth = 50
