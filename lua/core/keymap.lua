local builtin = require("telescope.builtin")

vim.g.mapleader = ","
vim.keymap.set("n", "<C-e>", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
vim.keymap.set("n", "<C-t>", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>", {})
vim.keymap.set("n", "<C-h>", "<cmd>bprevious<CR>", {})
vim.keymap.set("n", "<C-b>", "<cmd>Gitsigns toggle_current_line_blame<CR>", {})
vim.keymap.set("n", "<leader>sv", ":source ~/.config/nvim/init.lua<CR>", { noremap = true })
