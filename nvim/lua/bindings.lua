vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true })
