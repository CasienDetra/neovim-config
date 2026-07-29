local options = {
  formatters_by_ft = {
    go = { "gofmt" },
    lua = { "stylua" },
    markdown = { "prettierd", "prettier" },
    css = { "prettier", "prettierd" },
    html = { "prettier", "prettierd" },
    cs = { "clang-format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
  config = function(_, opts)
    local conform = require "conform"
    conform.setup(opts)

    -- Optional: Notify on formatting result
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        conform.format {
          bufnr = args.buf,
          timeout_ms = opts.format_on_save.timeout_ms,
          lsp_format = opts.format_on_save.lsp_format,
          async = true,
          callback = function(success, err)
            if success then
              vim.notify("Formatted " .. vim.fn.bufname(args.buf), vim.log.levels.INFO, { title = "Conform" })
            else
              -- vim.notify("Formatting failed: " .. (err or "Unknown error"), vim.log.levels.ERROR, { title = "Conform" })
            end
          end,
        }
      end,
    })
  end,
}

return options
