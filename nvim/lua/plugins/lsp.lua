local function config()
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

  vim.lsp.config.clangd = {capabilities=capabilities, on_attach=on_attach}
  vim.lsp.config.gopls = {capabilities=capabilities, on_attach=on_attach}
  vim.lsp.config.pyright = {
    capabilities=capabilities,
    on_attach=on_attach,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",  -- "off", "basic", or "strict"
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",  -- "openFilesOnly" or "workspace"
          stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
        },
      },
    },
  }
  vim.lsp.config.ocamllsp = {capabilities=capabilities, on_attach=on_attach}
  vim.lsp.config.terraformls = {capabilities=capabilities, on_attach=on_attach}
  vim.lsp.config.rust_analyzer = {capabilities=capabilities, on_attach=on_attach}
  vim.lsp.config.templ = {capabilities=capabilities, on_attach=on_attach}

  vim.lsp.enable({'clangd', 'gopls', 'pyright', 'ocamllsp', 'terraformls', 'rust_analyzer', 'templ'})
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
