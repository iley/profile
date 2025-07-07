vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>', { noremap = true })

-- DAP
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- Copy the current file and line/range for pasting to an AI agent.
-- Normal‐mode: copy “filename:line”
vim.keymap.set('n', '<leader>cl', function()
  local file = vim.fn.expand('%:t')
  local line = vim.fn.line('.')
  local text = string.format("%s:%d", file, line)
  vim.fn.setreg('+', text)
  print('Copied: ' .. text)
end, { noremap = true, silent = true, desc = 'Copy filename and line' })

-- visual-mode: copy “filename:start-end”, clear selection, then notify
vim.keymap.set('x', '<leader>cl', function()
  local file = vim.fn.expand('%:t')
  -- leave visual mode so '< and '> are updated
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)

  vim.schedule(function()
    local start_line = vim.fn.line("'<")
    local end_line   = vim.fn.line("'>")
    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
    local text = string.format('%s:%d-%d', file, start_line, end_line)
    vim.fn.setreg('+', text)
    vim.notify('Copied: ' .. text, vim.log.levels.INFO)
  end)
end, { noremap = true, silent = true, desc = 'Copy filename and line range' })

