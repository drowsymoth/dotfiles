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

vim.keymap.set({ "n", "t" }, "<A-t>", [[<Cmd>ToggleTerm direction=float<CR>]])

vim.keymap.set("n", "<A-r>", function()
  local file = vim.fn.expand("%:p")
  local output = "/tmp/" .. vim.fn.expand("%:t:r")

  local cmd = string.format(
    "g++ -std=c++23 %s -o %s && %s",
    vim.fn.shellescape(file),
    vim.fn.shellescape(output),
    vim.fn.shellescape(output)
  )
  require("toggleterm").exec(cmd, 1, nil, nil, "float")
end)

vim.keymap.set(
  "n",
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Show diagnostic popup" }
)
