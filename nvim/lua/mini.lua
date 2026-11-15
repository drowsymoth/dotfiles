-- Icons (first, other plugins use them) -------------------------------------
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons() -- plugins that expect nvim-web-devicons get mini.icons instead
MiniIcons.tweak_lsp_kind() -- use mini.icons for LSP completion kinds

-- Editing ---------------------------------------------------------------------
require("mini.pairs").setup()

-- UI --------------------------------------------------------------------------
require("mini.indentscope").setup()

require("mini.statusline").setup()
MiniStatusline.section_location = function()
  return "" -- hide the line:column section
end

-- Pickers ---------------------------------------------------------------------
require("mini.pick").setup()
require("mini.extra").setup()
vim.ui.select = MiniPick.ui_select -- code actions and other prompts use the picker
