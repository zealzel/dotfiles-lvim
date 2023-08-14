local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

surround.setup {
  keymaps = { -- vim-surround style keymaps
    insert = nil,
    insert_line = nil,
  },
  -- official's default
  -- keymaps = {
  --   insert = "<C-g>s",
  --   insert_line = "<C-g>S",
  --   normal = "ys",
  --   normal_cur = "yss",
  --   normal_line = "yS",
  --   normal_cur_line = "ySS",
  --   visual = "S",
  --   visual_line = "gS",
  --   delete = "ds",
  --   change = "cs",
  -- },
  -- Chris's default
  -- keymaps = { -- vim-surround style keymaps
  --   insert = "<C-g>s",
  --   insert_line = "<C-g>S",
  --   normal = "s",
  --   normal_cur = "ss",
  --   normal_line = "S",
  --   normal_cur_line = "SS",
  --   visual = "s",
  --   visual_line = "gS",
  --   delete = "ds",
  --   change = "cs",
  -- },
}

vim.cmd [[nmap <leader>' siw']]
