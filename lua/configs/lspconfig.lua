require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "omnisharp",
  "stylua",
  "clangd",
  "typescript-language-server",
  "gopls",
  "copilot",
  "tinymist",
}
vim.lsp.enable(servers)
-- Diagnostic UI setup
vim.diagnostic.config {
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      return diagnostic.message:match "^[^\n]+"
    end,
  },
}
-- read :h vim.lsp.config for changing options of lsp servers
