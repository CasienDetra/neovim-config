local config = {
  show_icons = true,
  highlight_active = true,
  active_bg = "#b8bb26",
  active_fg = "#000000",
}

return {
  buffers = function()
    local api = vim.api
    local cur_buf = api.nvim_get_current_buf
    local buf_name = api.nvim_buf_get_name
    local get_opt = api.nvim_get_option_value
    local txt = require("nvchad.tabufline.utils").txt
    local btn = require("nvchad.tabufline.utils").btn
    local get_hl = api.nvim_get_hl

    local opts = require("nvconfig").ui.tabufline
    local buffers = {}
    local has_current = false

    local function filename(str)
      return str:match "([^/\\]+)[/\\]*$"
    end

    local function new_hl(group1, group2)
      local fg = get_hl(0, { name = group1 }).fg
      local bg = get_hl(0, { name = "Tb" .. group2 }).bg
      api.nvim_set_hl(0, group1 .. group2, { fg = fg, bg = bg })
      return "%#" .. group1 .. group2 .. "#"
    end

    local function gen_unique_name(name, index)
      for i2, nr2 in ipairs(vim.t.bufs) do
        local filepath = filename(buf_name(nr2))
        if index ~= i2 and filepath == name then
          return vim.fn.fnamemodify(buf_name(vim.t.bufs[index]), ":h:t") .. "/" .. name
        end
      end
    end

    vim.t.bufs = vim.tbl_filter(vim.api.nvim_buf_is_valid, vim.t.bufs)

    for i, nr in ipairs(vim.t.bufs) do
      if ((#buffers + 1) * opts.bufwidth) > (vim.o.columns - 30) then
        if has_current then
          break
        end
        table.remove(buffers, 1)
      end

      has_current = cur_buf() == nr or has_current

      local is_curbuf = cur_buf() == nr
      local hl_name = "BufO" .. (is_curbuf and "n" or "ff")

      if config.highlight_active and is_curbuf then
        hl_name = "TabuflineActive"
        api.nvim_set_hl(0, "Tb" .. hl_name, { fg = config.active_fg, bg = config.active_bg, bold = true })
      end

      local name = filename(buf_name(nr))
      name = name and (gen_unique_name(name, i) or name) or " No Name "

      local maxname_len = config.show_icons and (opts.bufwidth - 7) or (opts.bufwidth - 2)
      name = string.sub(name, 1, maxname_len - 2) .. (#name > maxname_len and ".." or "")

      local icon_hl = ""
      local icon = ""
      if config.show_icons then
        icon = "󰈚 "
        if name ~= " No Name " then
          local devicon, devicon_hl = require("nvim-web-devicons").get_icon(filename(buf_name(nr)))
          if devicon then
            icon = " " .. devicon .. " "
            icon_hl = new_hl(devicon_hl, hl_name)
          else
            icon_hl = new_hl("DevIconDefault", hl_name)
          end
        else
          icon_hl = new_hl("DevIconDefault", hl_name)
        end
      end

      local label = "" .. icon_hl .. icon .. txt(name, hl_name) .. ""

      local close_btn = btn("", nil, "KillBuf", nr)
      local mod = get_opt("mod", { buf = nr })
      local cur_mod = get_opt("mod", { buf = 0 })

      if is_curbuf then
        close_btn = cur_mod and txt("  ", "BufOnModified") or txt(close_btn, "BufOnClose")
      else
        close_btn = mod and txt("  ", "BufOffModified") or txt(close_btn, "BufOffClose")
      end

      label = btn(label, nil, "GoToBuf", nr)
      label = txt(label .. close_btn, hl_name)

      table.insert(buffers, label)
    end

    return table.concat(buffers) .. txt("%=", "Fill")
  end,
}
