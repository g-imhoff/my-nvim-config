vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true }) -- Move left
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true }) -- Move down
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true }) -- Move up
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true }) -- Move right

vim.keymap.set("n", "<leader>ds", function()
  local opts = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
    border = "rounded",
    source = "if_many", -- Show source of diagnostics if there are multiple
    prefix = function(diagnostic, i, total) -- Add icons for better clarity
      local signs = { 
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " "
      }
      return string.format("%s ", signs[diagnostic.severity] or ""), "Normal"
    end,
  }

  -- Open float only if there are diagnostics at the cursor position
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = line })

  if #diagnostics > 0 then
    vim.diagnostic.open_float(nil, opts)
  end
end, { noremap = true, silent = true, desc = "Show LSP error in float window" })
