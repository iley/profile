local function config()
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  vim.lsp.config.clangd = {capabilities=capabilities}
  vim.lsp.config.gopls = {capabilities=capabilities}
  vim.lsp.config.pyright = {
    capabilities=capabilities,
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
  vim.lsp.config.ocamllsp = {capabilities=capabilities}
  vim.lsp.config.terraformls = {capabilities=capabilities}
  vim.lsp.config.rust_analyzer = {capabilities=capabilities}
  vim.lsp.config.templ = {capabilities=capabilities}

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
