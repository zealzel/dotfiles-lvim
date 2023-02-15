-- Additional Plugins
lvim.plugins = {

  -- My preferred colorscheme
  "morhetz/gruvbox",
  "ajmwagar/vim-deus",
  { "catppuccin/nvim",       name = "catppuccin" },
  { "arturgoms/moonbow.nvim" },
  -- Syntax aware text-objects, select, move, swap, and peek support.
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- Whenever cursor jumps some distance or moves between windows, it will flash so you can see where it is
  "DanilaMihailov/beacon.nvim",
  -- A Git wrapper so awesome, it should be illegal
  "tpope/vim-fugitive",
  -- continuously updated session files
  "tpope/vim-obsession",
  {
    -- LSP signature hint as you type
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    -- Add/change/delete surrounding delimiter pairs with ease
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    -- 🦘 Interface that makes on-screen navigation quicker and more natural than ever
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
      -- saga.init_lsp_saga({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  -- {
  --   -- TabNine completion engine for hrsh7th/nvim-cmp
  --   "tzachar/cmp-tabnine",
  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  -- },
  -- Seamless tmux/vim navigation (over SSH too!)
  { "sunaku/tmux-navigate" },
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup()
    end,
  },
  -- EditorConfig plugin for Neovim. Global configured in ~/.editorconfig
  "gpanders/editorconfig.nvim",
  -- disables search highlighting when you are done searching and re-enables it when you search again
  "romainl/vim-cool",

  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  -- utilize vim's diff mode. Please refer to :h diff.txt
  -- common usages:
  --    During merge stage, :DiffviewOpen -> 2do (master) or 3do (branch to merge)
  --    Find history of one file, :DiffviewFileHistory %
  "sindrets/diffview.nvim",

  { -- Markdown preview
    -- ref: https://www.reddit.com/r/neovim/comments/10w4u51/comment/j7lpl9u/?utm_source=share&utm_medium=web2x&context=3
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  --================================================
  -- To be added in the future
  --================================================
  {
    "hrsh7th/cmp-nvim-lua",
    config = function()
      require("cmp").setup({})
    end
  },

  "onsails/lspkind.nvim",

  --================================================
  -- Experiments
  --================================================
  "jay-babu/mason-null-ls.nvim",
  -- { not working
  --   "max397574/better-escape.nvim",
  --   config = function()
  --     require("better_escape").setup({})
  --   end
  -- },
  -- To allow copilot to work with cmp. https://github.com/LunarVim/LunarVim/issues/1856
  {
    "github/copilot.vim",
    -- disable = not lvim.builtin.sell_soul_to_devel,
    config = function()
      -- copilot assume mapped
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
    end
  },
  {
    "hrsh7th/cmp-copilot",
    -- disable = not lvim.builtin.sell_soul_to_devel,
    config = function()
      lvim.builtin.cmp.formatting.source_names["copilot"] = "(Cop)"
      table.insert(lvim.builtin.cmp.sources, { name = "copilot" })
    end
  },
  "junegunn/vim-peekaboo",
  "m00qek/baleia.nvim",
  {
    "samodostal/image.nvim",
    config = function()
      require('image').setup {
        render = {
          min_padding = 5,
          show_label = true,
          use_dither = true,
          foreground_color = false,
          background_color = false
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
}

