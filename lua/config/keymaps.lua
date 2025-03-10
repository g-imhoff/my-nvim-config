vim.keymap.set('n', '<leader>c', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Diagnostic keybindings
vim.keymap.set('n', '<leader>ds', function()
  vim.diagnostic.open_float({ scope = "line" })
end,  { noremap = true, silent = true, desc = "Diagnostic floating window" })
