vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim" -- package manager



        use "rafi/awesome-vim-colorschemes" -- color schemes

        use "vim-airline/vim-airline" -- status bar
        use "vim-airline/vim-airline-themes" --status bar theme
        use "bling/vim-bufferline" -- tab bar
        use "qpkorr/vim-bufkill"

        use "preservim/nerdtree" -- file exploer
        use "preservim/nerdcommenter" -- comment short cut
        use "Yggdroot/indentLine"

        -- git start
        use "Xuyuanp/nerdtree-git-plugin" -- show git status on file exploer
        use "tpope/vim-fugitive" -- git command in vim
        use "lewis6991/gitsigns.nvim" -- sign for side column
        -- git end

        -- code packages start
        use "easymotion/vim-easymotion"
        use "tpope/vim-surround"
        use "jiangmiao/auto-pairs"
        use "maxmellon/vim-jsx-pretty"
        use "sheerun/vim-polyglot" -- syntax highlight
        -- code packages end

        use {
            'neoclide/coc.nvim', -- lsp
            branch = 'release'
        }

        use "svermeulen/vimpeccable"
        use "nvim-treesitter/nvim-treesitter"
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            requires = { { "nvim-lua/plenary.nvim" } }
        }

        use "honza/vim-snippets"
        use "SirVer/ultisnips"
        use "ryanoasis/vim-devicons"
        use "michaeljsmith/vim-indent-object"


        vim.cmd("colorscheme tender")
        vim.cmd("syntax enable")
        vim.g.mapleader = ","
        require('lsp')
        require('snippet')
        require('core/options')
        require('core/keymap')
    end
)
