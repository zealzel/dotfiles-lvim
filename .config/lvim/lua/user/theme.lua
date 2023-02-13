-- lvim.colorscheme = "lunar"
--
-- lvim.colorscheme = "gruvbox" -- gruvbox/tokyonight-night/tokyonight-moon/tokyonight-storm
vim.opt.background = "dark"
vim.g.gruvbox_contrast_dark = "medium" -- "hard/medium/soft"
-- vim.opt.background = "light"
-- vim.g.gruvbox_contrast_light = "hard" -- "hard/medium/soft"
--
-- vim.cmd.colorscheme "catppuccin-latte"
-- lvim.colorscheme = "catppuccin-frappe"
-- lvim.colorscheme = "catppuccin-macchiato"
-- lvim.colorscheme = "catppuccin-mocha"
--
-- lvim.colorscheme = "deus"

lvim.autocommands = {
  { "ColorScheme", { pattern = { "*" }, command = "highlight NormalFloat guibg=none" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight FloatBorder guibg=none" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight LspSagaDiagnosticHeader guifg=#ffffff gui=bold" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight LspSagaDiagnosticBorder guifg=#ffffff gui=bold" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight LspSagaDiagnosticTruncateLine guifg=#ffffff" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight clear SignColumn" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight GitsignsAdd ctermfg=142 guifg=#b8bb26 guibg=None gui=bold" } },
  { "ColorScheme",
    { pattern = { "*" }, command = "highlight GitsignsChange ctermfg=208 guifg=#fe8019 guibg=None gui=bold" } },
  { "ColorScheme",
    { pattern = { "*" }, command = "highlight GitsignsDelete ctermfg=142 guifg=#fb4934 guibg=None gui=bold" } },
  { "ColorScheme",
    { pattern = { "*" }, command = "highlight GitsignsChangeDelete ctermfg=208 guifg=#fe8019 guibg=None gui=bold" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight DiagnosticSignError guifg=#fb4934 guibg=None gui=bold" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight DiagnosticSignWarn guifg=#fabd2f guibg=None gui=bold" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight DiagnosticSignInfo guifg=#83a598 guibg=None gui=bold" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight DiagnosticSignHint guifg=#8ec07c guibg=None gui=bold" } },
}

-- Remove tilda ~ sign in empty lines
vim.opt.fillchars = { eob = " "}
