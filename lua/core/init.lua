vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        -- common packages start
        use "jiangmiao/auto-pairs"
        use "vim-airline/vim-airline"
        use "bling/vim-bufferline"
        use "qpkorr/vim-bufkill"
        use "vim-airline/vim-airline-themes"
        use "preservim/nerdtree"
        use "preservim/nerdcommenter"
        use "Yggdroot/indentLine"
        use "rafi/awesome-vim-colorschemes"
        use "tpope/vim-surround"
        use "easymotion/vim-easymotion"
        use "Xuyuanp/nerdtree-git-plugin"
        use "tpope/vim-fugitive"
        -- common packages end

        -- frontend packages start
        use "prettier/vim-prettier"
        use "mattn/emmet-vim"
        use "maxmellon/vim-jsx-pretty"
        use "sheerun/vim-polyglot" -- syntax highlight
        -- frontend packages end


        use "svermeulen/vimpeccable"
        use "nvim-lua/plenary.nvim"
        use "nvim-treesitter/nvim-treesitter"
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            requires = {{"nvim-lua/plenary.nvim"}}
        }

        use {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v1.x",
            requires = {
                {"neovim/nvim-lspconfig"},
                {"williamboman/mason.nvim"},
                {"williamboman/mason-lspconfig.nvim"},
                {"jose-elias-alvarez/null-ls.nvim"},
                {"MunifTanjim/eslint.nvim"},
                {"hrsh7th/nvim-cmp"},
                {"hrsh7th/cmp-nvim-lsp"},
                {"hrsh7th/cmp-buffer"},
                {"hrsh7th/cmp-path"},
                {"saadparwaiz1/cmp_luasnip"},
                {"hrsh7th/cmp-nvim-lua"},
                {"L3MON4D3/LuaSnip"},
                {"rafamadriz/friendly-snippets"}
            }
        }

        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup(
                    {
                        signs = {
                           add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                           change = {
                              hl = "GitSignsChange",
                              text = "│",
                              numhl = "GitSignsChangeNr",
                              linehl = "GitSignsChangeLn",
                           },
                           delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                           topdelete = {
                              hl = "GitSignsDelete",
                              text = "‾",
                              numhl = "GitSignsDeleteNr",
                              linehl = "GitSignsDeleteLn",
                           },
                           changedelete = {
                              hl = "GitSignsChange",
                              text = "~",
                              numhl = "GitSignsChangeNr",
                              linehl = "GitSignsChangeLn",
                           },
                           untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                        },
                        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                        numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
                        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
                        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                        watch_gitdir = {
                            interval = 1000,
                            follow_files = true
                        },
                        attach_to_untracked = true,
                        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                        current_line_blame_opts = {
                            virt_text = true,
                            virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
                            delay = 1,
                            ignore_whitespace = false
                        },
                        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                        sign_priority = 6,
                        update_debounce = 100,
                        status_formatter = nil, -- Use default
                        max_file_length = 40000, -- Disable if file is longer than this (in lines)
                        preview_config = {
                            -- Options passed to nvim_open_win
                            border = "single",
                            style = "minimal",
                            relative = "cursor",
                            row = 0,
                            col = 1
                        },
                        yadm = {
                            enable = false
                        }
                    }
                )
            end
        }


        require('core/options')
        require('core/keymap')
        require('lsp')
        vim.cmd("colorscheme onedark")
        vim.cmd("syntax enable")
        vim.g.mapleader = ","

        local null_ls = require("null-ls")
        local eslint = require("eslint")

        null_ls.setup()

        eslint.setup({
          bin = 'eslint_d', -- or `eslint_d`
          code_actions = {
            enable = true,
            apply_on_save = {
              enable = true,
              --types = { "directive", "problem", "suggestion", "layout" },
            },
            disable_rule_comment = {
              enable = true,
              location = "separate_line", -- or `same_line`
            },
          },
          diagnostics = {
            enable = true,
            report_unused_disable_directives = false,
            run_on = "type", -- or `save`
          },
        })


    end
)

