return {
  'saghen/blink.cmp',

  dependencies = 'rafamadriz/friendly-snippets',

  build = "cargo build --release",

  version = '*',

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
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
}
