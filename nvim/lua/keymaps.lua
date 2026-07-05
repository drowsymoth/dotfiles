vim.keymap.set("n", "<leader>fo", function()
  MiniExtra.pickers.oldfiles()
end, { desc = "Recently opened files" })

vim.keymap.set("n", "<leader>ff", function()
  MiniExtra.pickers.explorer()
end)

vim.keymap.set("n", "<leader>cc", "<cmd>nohlsearch<CR>")

vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if vim.snippet.active({ direction = 1 }) then
    return "<Cmd>lua vim.snippet.jump(1)<CR>"
  else
    return "<Tab>"
  end
end, { expr = true })
