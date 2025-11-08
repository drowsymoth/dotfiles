return {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    opts = { styel = "dark", },
    config = function()
        vim.cmd.colorscheme("gruvbox")
    end,
}
