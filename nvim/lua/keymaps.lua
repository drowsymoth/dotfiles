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
  local ext = vim.fn.expand("%:e")
  local output = "/tmp/" .. vim.fn.expand("%:t:r")

  if file == "" then
    vim.notify("No file to compile", vim.log.levels.ERROR)
    return
  end

  if ext == "cpp" then
    local compile = {
      "g++",
      "-std=c++23",
      file,
      "-o",
      output,
    }

    local result = vim.fn.system(compile)

    if vim.v.shell_error ~= 0 then
      vim.notify(result, vim.log.levels.ERROR)
      return
    end

    local run = vim.fn.shellescape(output)
    require("toggleterm").exec(run, 1, nil, nil, "float")
  elseif ext == "py" then
    local run = string.format("python %s", file)
    require("toggleterm").exec(run, 1, nil, nil, "float")
  else
    vim.notify("That is non of supported files", vim.log.levels.ERROR)
  end
end, { desc = "Compile and run" })

vim.keymap.set(
  "n",
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Show diagnostic popup" }
)
