return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    "ray-x/lsp_signature.nvim", 
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local null_ls = require("null-ls")
    
    -- Ensure mason installs required LSP servers
    mason.setup()

    -- Common LSP capabilities
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- LSP diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Setup LSP servers
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({ capabilities = capabilities })
      end,
      ["clangd"] = function()
        lspconfig.clangd.setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            require("lsp_signature").on_attach()
            
            -- Formatting before saving
            if client.server_capabilities.documentFormattingProvider then
              vim.cmd([[
                augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })
                augroup END
              ]])
            end
          end,
        })
      end,
    })

    -- Setup null-ls for additional formatting
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.autoflake,
      },
      on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
          vim.cmd([[
            augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })
            augroup END
          ]])
        end
      end,
    })

    -- Keybindings
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(ev.buf, ...) end
        
        -- Keymaps here
      end,
    })
  end,
}
