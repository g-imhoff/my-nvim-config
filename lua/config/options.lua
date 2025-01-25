vim.api.nvim_set_option("clipboard", "unnamed")

-- Ensure this function is called whenever the cursor moves
vim.cmd [[
augroup CenterCursor
autocmd!
autocmd CursorMoved * call v:lua.center_cursor()
augroup END
]]

-- Function to center the cursor
function _G.center_cursor()
  local win_height = vim.api.nvim_win_get_height(0)
  local win_center = math.ceil(win_height / 2)
  local cursor_line = vim.fn.line('.')

  if cursor_line > win_center then
    vim.cmd("normal! zz")
  end
end

-- Indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- Relative number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require('lualine').setup {
  options = {
    theme = 'nightfly',
  },
}

-- nvim-tree settings
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
