-- my options
lvim.builtin.comment.active = true
lvim.builtin.comment.mappings.basic = true
lvim.builtin.comment.mappings.extra = true
lvim.builtin.comment.pre_hook = nil
--
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.modeline = false
vim.opt.timeoutlen = 1000
vim.opt.conceallevel = 2 -- so that links cam be shorten in neog, ref: https://github.com/nvim-neorg/neorg/issues/40#issuecomment-890300243
-- backup = false, -- creates a backup file
-- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
-- cmdheight = 1, -- neovim command line for displaying messages
-- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
-- conceallevel = 0, -- so that `` is visible in markdown files
-- fileencoding = "utf-8", -- the encoding written to a file
-- hlsearch = true, -- highlight all matches on previous search pattern
-- ignorecase = true, -- ignore case in search patterns
-- mouse = "a", -- allow the mouse to be used in neovim
-- pumheight = 10, -- pop up menu height
-- showmode = false, -- we don't need to see things like -- INSERT -- anymore
-- showtabline = 2, -- always show tabs
-- smartcase = true, -- smart case
-- smartindent = true, -- make indenting smarter again
-- splitbelow = true, -- force all horizontal splits to go below current window
-- splitright = true, -- force all vertical splits to go to the right of current window
-- swapfile = false, -- creates a swapfile
-- termguicolors = true, -- set term gui colors (most terminals support this) (This affect the color very much!)
-- timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
-- undofile = true, -- enable persistent undo
-- updatetime = 300, -- faster completion (4000ms default)
-- writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- expandtab = true, -- convert tabs to spaces
-- shiftwidth = 2, -- the number of spaces inserted for each indentation
-- tabstop = 2, -- insert 2 spaces for a tab
-- cursorline = true, -- highlight the current line
-- number = true, -- set numbered lines
-- numberwidth = 4, -- set number column width to 2 {default 4}
-- signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
-- wrap = false, -- display lines as one long line
-- scrolloff = 0, -- is one of my fav
-- sidescrolloff = 8,
-- guifont = "monospace:h17", -- the font used in graphical neovim applications


vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_browser = 'firefox'


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Ref: https://www.reddit.com/r/neovim/comments/zptidv/auto_command_for_persistent_folds/
-- Persistent Folds
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local save_fold = augroup("Persistent Folds", { clear = true })
autocmd("BufWinLeave", {
  pattern = "*.*",
  callback = function()
    vim.cmd.mkview()
  end,
  group = save_fold,
})
autocmd("BufWinEnter", {
  pattern = "*.*",
  callback = function()
    vim.cmd.loadview({ mods = { emsg_silent = true } })
  end,
  group = save_fold,
})

