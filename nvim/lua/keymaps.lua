vim.keymap.set("n", "<leader>fo", function()
  MiniExtra.pickers.oldfiles()
end, { desc = "Recently opened files" })

vim.keymap.set("n", "<leader>ff", function()
  MiniExtra.pickers.explorer()
end)

vim.keymap.set("n", "<leader>fb", function()
  MiniPick.builtin.buffers()
end)

vim.keymap.set("n", "<leader>cc", "<Cmd>nohlsearch<CR>")

vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if vim.snippet.active({ direction = 1 }) then
    return "<Cmd>lua vim.snippet.jump(1)<CR>"
  else
    return "<Tab>"
  end
end, { expr = true })

vim.keymap.set({ "n", "t" }, "<A-t>", [[<Cmd>ToggleTerm size=10<CR>]])
