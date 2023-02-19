vim.g.coc_global_extensions = { 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-lua', 'coc-highlight',
  'coc-eslint', 'coc-prettier', 'coc-snippets' }
-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use K to show documentation in preview window
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

keyset("n", "zp", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "zn", "<Plug>(coc-diagnostic-next)", { silent = true })

keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
  group = "CocGroup",
  command = "silent call CocActionAsync('highlight')",
  desc = "Highlight symbol under cursor on CursorHold"
})

local options = { silent = true, nowait = true }

-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

-- refactors
keyset("n", "R", "", { silent = true })
keyset("n", "RT", "<Plug>(coc-codeaction-refactor)", { silent = true }) -- refactor list this
keyset("x", "RL", "<Plug>(coc-codeaction-refactor-selected)", { silent = true }) -- refactor list selected
keyset("n", "RL", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "RN", "<Plug>(coc-rename)", { silent = true }) -- renaming

-- code actions
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", options)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", options)
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", options)
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", options)
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", options)
