reload("user.keymap")
reload("user.options")
reload("user.theme")
reload("user.null-ls")
reload("user.plugins")

lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.highlight.enable = true

-- lvim.colorscheme = "lunar"
lvim.colorscheme = "gruvbox" -- gruvbox/tokyonight-night/tokyonight-moon/tokyonight-storm

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
