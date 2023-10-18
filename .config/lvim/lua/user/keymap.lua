local opts = { noremap = true, silent = true }

-- my keymappings
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.api.nvim_set_keymap('i', '<C-s>', '<esc>:w<cr>', {})
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<s-tab>"] = ":bprevious<cr>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["Z"] = "za"
-- toggleterm
lvim.keys.visual_mode["<leader>ts"] = ":lua vim.cmd [[ToggleTermSendVisualSelection ]] <cr>"
lvim.keys.normal_mode["<leader>ts"] = "<cmd>ToggleTermSendCurrentLine<cr>"

-- tips for Replace a word with yanked text.
-- ref: https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
-- ref: https://www.reddit.com/r/neovim/comments/v7s1ts/comment/ibmhb9n/?utm_source=share&utm_medium=web2x&context=3
lvim.keys.visual_mode["p"] = { '""p:let @"=@0<CR>', opts }


lvim.keys.normal_mode["<C-g>"] = ":vertical :Git <CR>"
lvim.keys.normal_mode["<leader>D"] = ":DiffviewOpen <CR>"
lvim.keys.normal_mode["<leader>C"] = ":DiffviewClose <CR>"
--
-- lvim.keys.normal_mode["<leader>gh"] = ":Git hist<CR>"
-- lvim.keys.normal_mode["<leader>gl"] = ":Git log<CR>"
-- lvim.keys.normal_mode["<leader>grb"] = ":Git rebase<Space>"
-- lvim.keys.normal_mode["<leader>grbc"] = ":Git rebase --continue<CR>"
-- lvim.keys.normal_mode["<leader>grba"] = ":Git rebase --abort<CR>"

-- ToggleTerm TermExec
-- lvim.keys.normal_mode["<leader>ts"] = ":2TermExec cmd='spt'<CR>"

-- keymap('n', '<enter>', 'za', opts)
-- lvim.keys.normal_mode["<enter>"] = { "za", opts }
-- lvim.keys.normal_mode["<CR>"] = { "za", opts }
