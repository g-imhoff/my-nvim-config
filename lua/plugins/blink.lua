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

    signature = { enabled = true }, 

    fuzzy = { implementation = "prefer_rust_with_warning" },

    completion = {
      documentation = {
        auto_show = true,
      },
    },
  },

  opts_extend = { 'sources.default' },
}
