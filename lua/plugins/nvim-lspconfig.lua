return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lspconfig = require('lspconfig')

    lspconfig['clangd'].setup({ capabilities = capabilities })
    lspconfig['pyright'].setup({ capabilities = capabilities })
    lspconfig['ts_ls'].setup({ capabilities = capabilities })
    lspconfig['dockerls'].setup({ capabilities = capabilities })
    lspconfig['docker_compose_language_service'].setup({ capabilities = capabilities })
  end
}
