vim.g.mapleader = " " -- use space as a leader key
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus" -- system's clipboard
vim.o.textwidth = 80 -- max width
vim.o.colorcolumn = "+1" -- show max width
vim.o.list = true -- visible whitespace characters
vim.o.pumborder = "single" -- border for popup menu
vim.o.pumheight = 10
vim.o.pummaxwidth = 100
vim.o.ruler = false
vim.o.shortmess = "CFOSWaco" -- fewer messages
vim.o.showmode = false -- don't show mode in command line
vim.o.signcolumn = "yes" -- always show signcolumn
-- vim.o.wrap           = false -- questionable for me

-- UI characters
vim.o.fillchars = "eob: ,fold:╌"
vim.o.listchars = "extends:…,nbsp:␣,precedes:…,tab:> "

vim.o.autoindent = true
vim.o.expandtab = true -- spaces instead of tabs
vim.o.tabstop = 2

vim.o.spell = true
vim.o.spelloptions = "camel"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 2
vim.o.undofile = true
vim.o.cursorline = true

vim.o.termguicolors = true
vim.o.completeopt = "menuone,noselect"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "typst", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt.spelllang = { "en_us", "ru" }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd T")
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})
