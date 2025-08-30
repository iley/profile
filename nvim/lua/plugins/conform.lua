return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
      python = { "isort", "black" },
    },
    default_format_opts = {
      lsp_fallback = true,
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters = {
      goimports = {
        prepend_args = { "-local", "github.com" },
      },
    },
  },
}