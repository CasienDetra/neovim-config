local capabilities = require("plugins.lang.utils.capabilities").get()

local pub_cache
if vim.fn.has "win32" == 1 then
  pub_cache = vim.fn.expand "~/AppData/Local/Pub/Cache"
else
  pub_cache = vim.fn.expand "~/.pub-cache"
end

return {
  "akinsho/flutter-tools.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    widget_guides = {
      enabled = true,
    },
    lsp = {
      on_attach = require("plugins.lang.utils.handelr").on_attach,
      capabilities = capabilities,
    },
    settings = {
      analysisExcludedFolders = {
        pub_cache,
      },
    },
  },
}
