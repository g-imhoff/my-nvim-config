return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '0.13.1',
  opts = {
    keymap = {
      preset = 'none',
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<Enter>'] = { 'accept', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets' }, 
    },

    signature = { 
      enabled = true, 
      trigger = {
        enabled = true, 
        show_on_keyword = true,
        show_on_insert = true,
      },
    },
  }, 

  fuzzy = { implementation = "prefer_rust_with_warning" },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      update_delay_ms = 50,
      treesitter_highlighting = true,
    },
  },
  opts_extend = { 'sources.default' },
}
