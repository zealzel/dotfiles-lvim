-- Additional Plugins

lvim.plugins = {

    -- My preferred colorscheme
    "morhetz/gruvbox",
    "ajmwagar/vim-deus",
    { "catppuccin/nvim",       name = "catppuccin" },
    { "arturgoms/moonbow.nvim" },
    -- Syntax aware text-objects, select, move, swap, and peek support.
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter", },
        -- javascript issues ref: https://www.reddit.com/r/lunarvim/comments/1bakcz2/how_to_use_text_objects_from_the/
        commit = "55e13ca"
    },
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
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump(
                        {
                            search = {
                                mode = function(str)
                                    return "\\<" .. str
                                end,
                            },
                        }
                    )
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
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
            { "nvim-treesitter/nvim-treesitter" },
        }
    },
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
    "sindrets/diffview.nvim",

    {
        -- Markdown preview
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
            require("cmp").setup()
        end
    },

    "onsails/lspkind.nvim",

    --================================================
    -- Experiments
    --================================================
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    "junegunn/vim-easy-align",
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    },
    { -- This plugin
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },
    { -- The task runner we use
        "stevearc/overseer.nvim",
        commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1
            },
        },
    },
    -- https://betterprogramming.pub/lunarvim-debugging-testing-python-code-fa84f804c469
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
    "Vimjas/vim-python-pep8-indent",
    {
        -- Selenium-automated Jupyter Notebook that is synchronised with NeoVim in real-time.
        "kiyoon/jupynium.nvim",
        build = "pip3 install --user .",
        -- build = "conda run --no-capture-output -n jupynium pip install .",
        -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
    },
    "hrsh7th/nvim-cmp",       -- optional, for completion
    "rcarriga/nvim-notify",   -- optional
    "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
    "nvim-pack/nvim-spectre",
    "kevinhwang91/nvim-bqf",
    "ThePrimeagen/harpoon",
    {
        "jay-babu/mason-null-ls.nvim",
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",
                    "black",
                    "ruff",
                }
            })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        config = function()
            require("mason-nvim-dap").setup()
        end,
        opts = {
            handlers = {}
        },
    },
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
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
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
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }
}
