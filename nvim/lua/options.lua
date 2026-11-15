-- Leader --------------------------------------------------------------------
vim.g.mapleader = " "

-- Line numbers & cursor -----------------------------------------------------
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes" -- always show signcolumn
vim.o.ruler = false -- statusline already shows position

-- Colors & visible characters -----------------------------------------------
vim.o.termguicolors = true
vim.o.list = true -- show whitespace characters
vim.o.listchars = "tab:> ,trail:·,nbsp:␣,extends:…,precedes:…"
vim.o.fillchars = "eob: ,fold:╌"
-- vim.o.wrap = false -- questionable for me

-- Line width ----------------------------------------------------------------
vim.o.textwidth = 80
vim.o.colorcolumn = "+1" -- highlight the column after textwidth

-- Indentation ---------------------------------------------------------------
vim.o.autoindent = true
vim.o.expandtab = true -- spaces instead of tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Search --------------------------------------------------------------------
vim.o.ignorecase = true
vim.o.smartcase = true

-- Editing & files -----------------------------------------------------------
vim.o.clipboard = "unnamedplus" -- use system clipboard
vim.o.undofile = true -- persistent undo
vim.o.shell = "fish"

-- Spell checking ------------------------------------------------------------
vim.o.spell = true
vim.o.spelloptions = "camel"

-- Completion & popup menu ---------------------------------------------------
vim.o.completeopt = "menuone,noselect"
vim.o.pumborder = "single"
vim.o.pumheight = 10
vim.o.pummaxwidth = 100

-- Messages ------------------------------------------------------------------
vim.o.shortmess = "CFOSWaco" -- fewer messages
vim.o.showmode = false -- mode is shown in the statusline

-- Autocmds ------------------------------------------------------------------
local group = vim.api.nvim_create_augroup("UserOptions", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "markdown", "typst", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us", "ru" }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "help",
  callback = function()
    vim.cmd("wincmd T") -- open help in its own tab
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function()
    vim.opt_local.spell = false
  end,
})
