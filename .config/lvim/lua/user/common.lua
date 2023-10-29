reload("user.keymap")
reload("user.whichkey")
reload("user.options")
reload("user.null-ls")
reload("user.plugins")
reload("user.surround")
reload("user.comment")
reload("user.theme")

lvim.lsp.installer.setup.ensure_installed = {
  "bashls",
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
    "codelldb",
    "debugpy",
  }
})

lvim.format_on_save = false
-- lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.comment.mappings.basic = false
lvim.builtin.comment.mappings.extra = false

lvim.builtin.telescope.defaults.layout_config.width = 0.7

-- Use :colorscheme xxx to change the colorscheme in real time
-- colorschemes: gruvbox|lunar|catppuccin-latte|catppuccin-frappe|catppuccin-macchiato|catppuccin-mocha|deus|moonbow
-- lvim.colorscheme = "gruvbox"

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
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = { query = "@class.outer", desc = "Next class start" },
      --
      -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
      ["]o"] = "@loop.*",
      -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
      --
      -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
      -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
      ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
      ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
    -- Below will go to either the start or the end, whichever is closer.
    -- Use if you want more granular movements
    -- Make it even more gradual by adding multiple queries and regex.
    goto_next = {
      ["]d"] = "@conditional.outer",
    },
    goto_previous = {
      ["[d"] = "@conditional.outer",
    }
  },

}
-- ts.indent = { disable = { "python" } }

-- tricks in lunarvim
-- # Temporarily disable diagnostics for certain buffer
-- :lua vim.diagnostic.disable()
