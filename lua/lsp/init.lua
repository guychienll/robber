local status = pcall(require, "lspconfig")
if (not status) then return end

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
-- (Optional) Configure lua language server for neovim
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.nvim_workspace()
lsp.setup()
lsp.set_preferences(
    {
        suggest_lsp_servers = true,
        setup_servers_on_start = true,
        set_lsp_keymaps = false,
        configure_diagnostics = true,
        cmp_capabilities = true,
        manage_nvim_cmp = true,
        call_servers = "local",
    }
)


local protocol = require('vim.lsp.protocol')
protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}



-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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
        virtual_text = {
            prefix = "𓆦 ",
            source = "always",
        },
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            source = "always",
        }
    }
)
