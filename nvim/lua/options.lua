vim.opt.number = true             -- Line numbers
vim.opt.relativenumber = true     -- Relative line numbers vim.opt.tabstop = 4             -- Tab = 4 spaces
vim.opt.shiftwidth = 4            -- Indent size
vim.opt.expandtab = true          -- Spaces instead of tabs
vim.opt.termguicolors = true      -- True color support
vim.opt.cursorline = true         -- Highlight current line
vim.opt.mouse = 'a'               -- Mouse support
vim.opt.clipboard = 'unnamedplus' -- System clipboard
vim.opt.splitright = true         -- Vertical split to the right
vim.opt.splitbelow = true         -- Horizontal split below
vim.opt.ignorecase = true         -- Case-insensitive search
vim.opt.smartcase = true          -- Case-sensitive if uppercase present

-- enable visible diagnostics for all LSPs
vim.diagnostic.config({
    virtual_text = true, -- inline error text
    signs = true,      -- show icons in gutter
    underline = true,  -- underline bad code
    update_in_insert = false,
    severity_sort = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
