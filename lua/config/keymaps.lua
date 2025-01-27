-- Insert mode keybindings for < and > using Ctrl+Alt+j and Ctrl+Alt+k
vim.keymap.set('i', '<C-A-j>', '<', { noremap = true, silent = true })
vim.keymap.set('i', '<C-A-k>', '>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
