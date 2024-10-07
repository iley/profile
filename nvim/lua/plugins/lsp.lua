local function config()
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_attach = function(client, bufnr)
    -- Format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({async = false}) end
        })
    end
  end

  lspconfig.clangd.setup{capabilities=capabilities, on_attach=on_attach}
  lspconfig.gopls.setup{capabilities=capabilities, on_attach=on_attach}
  lspconfig.pyright.setup{capabilities=capabilities, on_attach=on_attach}
  lspconfig.ocamllsp.setup{capabilities=capabilities, on_attach=on_attach}
  lspconfig.terraformls.setup{capabilities=capabilities, on_attach=on_attach}
  lspconfig.rust_analyzer.setup{capabilities=capabilities, on_attach=on_attach}
  lspconfig.templ.setup{capabilities=capabilities, on_attach=on_attach}
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = config,
  }
}
