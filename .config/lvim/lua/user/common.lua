reload("user.keymap")
reload("user.options")
reload("user.null-ls")
reload("user.plugins")
reload("user.theme")

lvim.lsp.installer.setup.ensure_installed = {
  "bash-language-server",
}

require("mason-null-ls").setup({
  ensure_installed = {
    "stylua",
    "jq",
    "shellharden",
    "shfmt",
    "prettier",
    "black",
    "flake8",
    "jsonlint",
    "yamllint",
  }
})

lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.highlight.enable = true

-- Use :colorscheme xxx to change the colorscheme in real time
-- colorschemes: gruvbox|lunar|catppuccin-latte|catppuccin-frappe|catppuccin-macchiato|catppuccin-mocha|deus|moonbow
-- lvim.colorscheme = "gruvbox"
lvim.colorscheme = "gruvbox"

-- Setup Treesitter textobjects
-- ref: https://github.com/LunarVim/LunarVim/issues/2730
local ts = lvim.builtin.treesitter
ts.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    },
  },
  swap = {
    enable = false,
    -- swap_next = textobj_swap_keymaps,
  },
}
