-- ==============================================================================
-- Python plugins
-- ==============================================================================
-- vim.g.python3_host_prog = "~/.pyenv/versions/3.10.8/bin/python3.10"


if vim.loop.os_uname().sysname == 'Darwin' then
  -- print("Darwin")
  vim.g.python3_host_prog = "$HOME/.pyenv/shims/python3"
elseif vim.loop.os_uname().sysname == 'Linux' then
  -- print("Linux")
  vim.g.python3_host_prog = "/usr/bin/python3"
end

-- All the treesitter parsers you want to install. If you want all of them, just
-- replace everything with "all".
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

-- Set a formatter.
local formatters = require("lvim.lsp.null-ls.formatters")
-- local formatters = require("lvim.lsp.null_ls.formatters")
formatters.setup({
  {
    command = "black",
    extra_args = { "--fast", "--preview" },
    filetypes = { "python" },
  },
  { command = "shellharden" },
})

-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
-- local linters = require("lvim.lsp.null_ls.linters")
linters.setup({
  {
    command = "ruff",
    extra_args = {
      "--line-length",
      "95",
    },
  },
  {
    command = "flake8",
    filetypes = {
      "python",
    },
    extra_args = {
      "--max-line-length",
      "95",
    },
  },
})

-- TODO: debugpy installed by default
-- Setup dap for python
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
pcall(function()
  require("dap-python").test_runner = "pytest"
end)

-- Magma Setup

-- Image options. Other options:
-- 1. none:     Don't show images.
-- 2. ueberzug: use Ueberzug to display images.
-- 3. kitty:    use the Kitty protocol to display images.
-- vim.g.magma_image_provider = "kitty"
vim.g.magma_image_provider = "none"

-- If this is set to true, then whenever you have an active cell its output
-- window will be automatically shown.
vim.g.magma_automatically_open_output = true

-- If this is true, then text output in the output window will be wrapped.
vim.g.magma_wrap_output = false

-- If this is true, then the output window will have rounded borders.
vim.g.magma_output_window_borders = false

-- The highlight group to be used for highlighting cells.
vim.g.magma_cell_highlight_group = "CursorLine"

-- Where to save/load with :MagmaSave and :MagmaLoad.
-- The generated file is placed in this directory, with the filename itself
-- being the buffer's name, with % replaced by %% and / replaced by %, and
-- postfixed with the extension .json.
vim.g.magma_save_path = vim.fn.stdpath("data") .. "/magma"

-- Mappings
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
lvim.builtin.which_key.vmappings["d"] = {
  name = "Debug",
  s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}

lvim.builtin.which_key.mappings["j"] = {
  name = "Jupyter",
  i = { "<Cmd>MagmaInit<CR>", "Init Magma" },
  d = { "<Cmd>MagmaDeinit<CR>", "Deinit Magma" },
  e = { "<Cmd>MagmaEvaluateLine<CR>", "Evaluate Line" },
  r = { "<Cmd>MagmaReevaluateCell<CR>", "Re evaluate cell" },
  D = { "<Cmd>MagmaDelete<CR>", "Delete cell" },
  s = { "<Cmd>MagmaShowOutput<CR>", "Show Output" },
  R = { "<Cmd>MagmaRestart!<CR>", "Restart Magma" },
  S = { "<Cmd>MagmaSave<CR>", "Save" },
}

lvim.builtin.which_key.vmappings["j"] = {
  name = "Jupyter",
  e = { "<esc><cmd>MagmaEvaluateVisual<cr>", "Evaluate Highlighted Line" },
}

lvim.builtin.which_key.mappings["P"] = {
  name = "Python",
  i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
  d = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
}
