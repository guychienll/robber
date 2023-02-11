local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-e>", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
vim.keymap.set("n", "<C-t>", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>", {})
vim.keymap.set("n", "<C-h>", "<cmd>bprevious<CR>", {})
vim.keymap.set("n", "<C-b>", "<cmd>Gitsigns toggle_current_line_blame<CR>", {})
vim.keymap.set("n", "<leader>sv", ":source ~/.config/nvim/init.lua<CR>",{noremap = true})

vim.keymap.set('n', 'zf', ':Lspsaga show_cursor_diagnostics<CR>',{noremap = true})
vim.keymap.set("n", "zp", ":Lspsaga diagnostic_jump_prev<CR>",{noremap = true})
vim.keymap.set("n", "zn", ":Lspsaga diagnostic_jump_next<CR>",{noremap = true})
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>",{noremap = true})
vim.api.nvim_set_keymap('n', 'gd', "<cmd>Lspsaga goto_definition<CR>", {noremap=true})

