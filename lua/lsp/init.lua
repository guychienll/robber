-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

lsp.set_preferences(
    {
        suggest_lsp_servers = true,
        setup_servers_on_start = true,
        set_lsp_keymaps = true,
        configure_diagnostics = true,
        cmp_capabilities = true,
        manage_nvim_cmp = true,
        call_servers = "local",
        sign_icons = {
            error = "e",
            warn = "w",
            hint = "h",
            info = "i"
        }
    }
)


require("mason").setup(
    {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
)

vim.diagnostic.config(
    {
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        underline = false,
        severity_sort = true,
        float = true
    }
)

