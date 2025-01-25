return {
  "ray-x/lsp_signature.nvim", 
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  },
  floating_window = true, -- Show a floating window with the function signature
  hint_enable = true, -- Enable inline hints
}
