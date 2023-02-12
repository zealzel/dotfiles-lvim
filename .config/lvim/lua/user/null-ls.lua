
-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "markdownlint" },
  { command = "hadolint" },
  { command = "jsonlint" },
  { command = "yamllint" },
})


-- Set a formatter.
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  -- { command = "remark" },
  {
    command = "shfmt",
    extra_args = {
      "--indent=2",
      "-bn", --binary-next-line Binary ops like && and | may start a line.
      "-ci", --case-indent Switch cases will be indented.
      "-sr", --space-redirects Redirect operators will be followed by a space.
      -- "-kp", --keep-padding Keep column alignment paddings.
      -- "-fn", --func-next-line Function opening braces are placed on a separate line.
    },
  },
  {
    command = "prettier",
    extra_args = {
      "--no-semi false",
      "--single-quote true",
      "--jsx-single-quote true",
    },
    filetypes = {
      "json",
      "markdown",
      "yaml",
    },
  },
})

