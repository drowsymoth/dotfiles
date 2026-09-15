MiniDeps.now(function()
  MiniDeps.add({
    source = "zenbones-theme/zenbones.nvim",
    depends = { "rktjmp/lush.nvim" },
  })
  vim.cmd.colorscheme("zenbones")
end)
