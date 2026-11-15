local map = vim.keymap.set

-- Pickers (mini.pick / mini.extra) -------------------------------------------
map("n", "<leader>fo", function()
  MiniExtra.pickers.oldfiles()
end, { desc = "Recent files" })

map("n", "<leader>ff", function()
  MiniExtra.pickers.explorer()
end, { desc = "File explorer" })

map("n", "<leader>fb", function()
  MiniPick.builtin.buffers()
end, { desc = "Buffers" })

-- Editing helpers ------------------------------------------------------------
map(
  "n",
  "<leader>cc",
  "<Cmd>nohlsearch<CR>",
  { desc = "Clear search highlight" }
)
map(
  "n",
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Show diagnostic popup" }
)

-- Terminal & outline ---------------------------------------------------------
map(
  { "n", "t" },
  "<A-t>",
  "<Cmd>ToggleTerm direction=float<CR>",
  { desc = "Toggle floating terminal" }
)
map("n", "<leader>a", "<Cmd>AerialToggle<CR>", { desc = "Toggle outline" })

-- Compile & run (<A-r>) ------------------------------------------------------
-- Each runner returns an optional build command (a list) and the shell command
-- to run in the terminal afterwards.
local runners = {
  cpp = function(file, out)
    local build = { "g++", "-std=c++23", "-Wall", "-Wextra", file, "-o", out }
    return build, vim.fn.shellescape(out)
  end,
  python = function(file)
    return nil, "python " .. vim.fn.shellescape(file)
  end,
}

local function run_in_terminal(cmd)
  require("toggleterm").exec("clear; " .. cmd, 1, nil, nil, "float")
end

map("n", "<A-r>", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    return vim.notify("No file to compile", vim.log.levels.ERROR)
  end

  local runner = runners[vim.bo.filetype]
  if not runner then
    return vim.notify(
      "No runner for filetype: " .. vim.bo.filetype,
      vim.log.levels.WARN
    )
  end

  vim.cmd("silent update") -- run what's in the buffer, not the stale file

  local build, run = runner(file, "/tmp/" .. vim.fn.expand("%:t:r"))
  if not build then
    return run_in_terminal(run)
  end

  vim.system(
    build,
    { text = true },
    vim.schedule_wrap(function(res)
      if res.code ~= 0 then
        return vim.notify(res.stderr, vim.log.levels.ERROR)
      end
      run_in_terminal(run)
    end)
  )
end, { desc = "Compile and run" })
