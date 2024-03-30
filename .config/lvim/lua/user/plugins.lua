-- Additional Plugins

-- for image.nvim. ref: https://github.com/3rd/image.nvim?tab=readme-ov-file
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

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
    -- {
    --   -- 🦘 Interface that makes on-screen navigation quicker and more natural than ever
    --   "ggandor/leap.nvim",
    --   config = function()
    --     require("leap").add_default_mappings()
    --   end,
    -- },
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
    -- { "adelarsq/vim-devicons-emoji" },
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
    --    navigate to next/prev changes -> ]c / [c
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
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "work",
                    path = "~/vaults/work",
                },
                {
                    name = "personal",
                    path = "~/vaults/personal",
                },
            },
            templates = {
                subdir = "Templates",
                -- date_format = "%Y-%m-%d-%a",
                -- time_format = "%H:%M",
            },
            -- see below for full list of options 👇
        },
    },
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
    -- {
    --   -- https://github.com/mg979/vim-visual-multi/issues/241
    --   "mg979/vim-visual-multi",
    --   branch = "master",
    --   init = function()
    --     vim.g.VM_maps = {
    --       ["Find Under"] = "<c-m>",
    --       -- ["Add Cursor Down"] = '<M>j',
    --       -- ["Add Cursor Up"]   = '<M>k',
    --     }
    --   end,
    -- },
    "nvim-pack/nvim-spectre",
    "kevinhwang91/nvim-bqf",
    -- "christianchiarulli/harpoon",
    "ThePrimeagen/harpoon",
    -- {
    --   "karb94/neoscroll.nvim",
    --   config = function()
    --     require('neoscroll').setup()
    --   end
    -- },
    -- "jay-babu/mason-null-ls.nvim",
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
        "3rd/image.nvim",
        config = function()
            require("image").setup({
                backend = "kitty",
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        -- only_render_image_at_cursor = false,
                        only_render_image_at_cursor = true,
                        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                    },
                    neorg = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        -- only_render_image_at_cursor = false,
                        only_render_image_at_cursor = true,
                        filetypes = { "norg" },
                    },
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 50,
                window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
                -- editor_only_render_when_focused = false,                                  -- auto show/hide images when the editor gains/looses focus
                editor_only_render_when_focused = true,                                   -- auto show/hide images when the editor gains/looses focus
                tmux_show_only_in_active_window = true,                                   -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                -- tmux_show_only_in_active_window = false,                                  -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
            })
        end,

    },
    -- {
    --     "samodostal/image.nvim",
    --     config = function()
    --         require('image').setup {
    --             render = {
    --                 min_padding = 5,
    --                 show_label = true,
    --                 use_dither = true,
    --                 foreground_color = false,
    --                 background_color = false
    --             },
    --             events = {
    --                 update_on_nvim_resize = true,
    --             },
    --         }
    --     end,
    -- },
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
    -- {
    --   'nosduco/remote-sshfs.nvim',
    --   config = function()
    --     require("remote-sshfs").setup({})
    --   end,
    -- },
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function()
            require('neorg').setup {
                configure_parsers = true,
                install_parsers = true,
                load = {
                    ['core.defaults'] = {},
                    -- ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.concealer"] = {
                        config = {
                            folds = true,
                            -- icon_preset = "diamond",
                            icons = {
                                code_block = {
                                    conceal = true,
                                    width = "content",
                                    min_width = 85,
                                },
                                -- ordered = {
                                --     icons = { "item 1.", "[0]", "A.", "a.", "§ 1)", "I.", "i.", "⒈", "⑴", "Ⓐ", "ⓐ" },
                                -- },
                                -- list = {
                                --     icons = { "*", " +", "  -", "   >" },
                                -- },
                            },
                        }
                    },                  -- Adds pretty icons to your documents
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                                tests = "~/vaults/neorg/tests",
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.export"] = {},
                    ["core.export.markdown"] = {},
                    ["core.summary"] = {
                        config = {
                            strategy = "default",
                        },
                    },
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                            name = "[Neorg]",
                        }
                    },
                },
                highlight = { enable = true, },
            }
        end,
    },
    -- {
    --     -- https://www.reddit.com/r/neovim/comments/zxo111/neorg_does_not_install_at_all/
    --     'nvim-neorg/neorg',
    --     ft = 'norg',   -- lazy load on filetype
    --     cmd = 'Neorg', -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
    --     --  (you could also just remove both lazy loading things)
    --     priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
    --     -- build = ":Neorg sync-parsers", -- This is the important bit!
    --     config = function()
    --         require('neorg').setup {
    --             configure_parsers = true,
    --             install_parsers = true,
    --             load = {
    --                 ['core.defaults'] = {},
    --                 -- ["core.concealer"] = {}, -- Adds pretty icons to your documents
    --                 ["core.concealer"] = {
    --                     config = {
    --                         folds = true,
    --                         icon_preset = "diamond"
    --                     }
    --                 },                  -- Adds pretty icons to your documents

    --                 ["core.dirman"] = { -- Manages Neorg workspaces
    --                     config = {
    --                         workspaces = {
    --                             notes = "~/notes",
    --                             tests = "~/vaults/neorg/tests",
    --                         },
    --                         default_workspace = "notes",
    --                     },
    --                 },
    --                 ["core.export"] = {},
    --                 ["core.export.markdown"] = {},
    --                 ["core.summary"] = {
    --                     config = {
    --                         strategy = "default",
    --                     },
    --                 },
    --             },
    --             highlight = { enable = true, },
    --         }
    --     end
    -- },
    {
        "folke/paint.nvim",
        config = function()
            local hlmap = {
                ["^#%s+(.-)%s*$"] = "Operator",
                ["^##%s+(.-)%s*$"] = "Type",
                ["^###%s+(.-)%s*$"] = "String",
                ["^####%s+(.-)%s*$"] = "Constant",
                ["^#####%s+(.-)%s*$"] = "Number",
                ["^######%s+(.-)%s*$"] = "Error",
            }
            local highlights = {}
            for pattern, hl in pairs(hlmap) do
                table.insert(highlights, {
                    filter = { filetype = "markdown" },
                    pattern = pattern,
                    hl = hl,
                })
            end

            local hlmap_norg = {
                ["^%*%s+(.-)%s*$"] = "GruvboxYellow",
                ["^%*%*%s+(.-)%s*$"] = "GruvboxOrange",
                ["^%*%*%*%s+(.-)%s*$"] = "GruvboxPurple",
                ["^%*%*%*%*%s+(.-)%s*$"] = "GruvboxAqua",
                ["^%*%*%*%*%*%s+(.-)%s*$"] = "GruvboxRed",
                ["^%*%*%*%*%*%*%s+(.-)%s*$"] = "GruvboxGreen",
            }
            local highlights_norg = {}
            for pattern, hl in pairs(hlmap_norg) do
                table.insert(highlights_norg, {
                    filter = { filetype = "norg" },
                    pattern = pattern,
                    hl = hl,
                })
            end

            require("paint").setup({
                ---@type PaintHighlight[]
                -- highlights = highlights,
                highlights = highlights_norg,
            })
        end,
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
