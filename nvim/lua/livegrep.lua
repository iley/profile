require("telescope").setup({
  extensions = {
    livegrep = {
      url = "http://livegrep.corp.stripe.com/api/v1/search/stripe",
      raw_curl_opts = { "--unix-socket", "/Users/istrukov/.stripeproxy" },
    }
  }
})
require("telescope").load_extension("livegrep")

-- Feel free to adjust options and mapping 
vim.keymap.set("n", "<leader>lg", function()
  require("telescope").extensions.livegrep.livegrep({repo = "stripe-internal/pay-server"})
end, { silent = true })
