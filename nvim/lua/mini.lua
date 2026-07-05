MiniDeps.later(function()
  require("mini.pairs").setup()
  require("mini.indentscope").setup()
  require("mini.surround").setup()
  require("mini.icons").setup()
  require("mini.statusline").setup()
  MiniStatusline.section_location = function()
    return ""
  end
  require("mini.pick").setup()
  require("mini.extra").setup()
end)
