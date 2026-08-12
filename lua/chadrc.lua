-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}
M.lsp = {
  signature = {
    enabled = true,
  },
}
M.base46 = {
  theme = "falcon",
  transparency = true,
  hl_override = {
    Comment = { italic = false },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = { load_on_startup = false }
M.ui = {
  statusline = {
    theme = "vscode", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = {
      -- "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "lsp",
      -- "python_venv",
      -- "diagnostics",
      -- "debug_status",
      -- "command",
      -- "lazy_updates",
      -- "clients",
      -- "cwd",
      -- "total_lines",
    },
    modules = nil,
  },
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
    modules = nil,
  },

  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      lsp = true,
    },
  },

  telescope = { style = "borderless" }, -- borderless / bordered
}

return M
