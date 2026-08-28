require "nvchad.options"

-- add yours here!
-- ref : https://github.com/mcauley-penney/nvim/blob/main/lua/options.lua
local o, opt, g = vim.o, vim.opt, vim.g
-- blink cursor
-- o.guicursor = "n-v-sm:block,i-c-ci-ve:ver20,r-cr-o:hor50,t:ver50-blinkon500-blinkoff500-TermCursor"
o.guicursor = "a:block"
o.breakindent = true
o.breakindentopt = "list:-1"
o.cindent = true
o.pumblend = 0
o.list = true
o.winblend = 0
opt.clipboard = "unnamedplus"
opt.completeopt = "menuone,noinsert" -- Completion options
opt.autoindent = true
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in search
opt.smartindent = true -- Case sensitive if uppercase in search
opt.hlsearch = true -- Don't highlight search results
opt.shortmess:append "c"
opt.cmdheight = 0
opt.showmode = true
opt.fillchars = {
  eob = "~",
  diff = "╱",
  fold = " ",
  foldsep = " ",
  msgsep = "━",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

opt.colorcolumn = "+0"
-- opt.listchars = "tab:¬·,trail:·,extends:►,space:·,precedes:◄,nbsp:␣"
-- opt.listchars = "tab:  ,trail: ,extends: ,space: ,precedes: ,nbsp: "
o.shiftwidth = 2
o.tabstop = 2
opt.softtabstop = 4
opt.formatlistpat = table.concat({
  [[^\s*\d\+[\]:.)}\t ]\s*]],
  [[^\s*\w\+[\]:.)}\t ]\s\+]],
  [[^\s*>\s]],
}, [[\|]])

o.cursorlineopt = "both"
o.expandtab = true
-- instead of using the cmd shell for terminal this use pwsh
-- opt.shell = "powershell.exe"
-- opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "

--neovide
if g.neovide then
  o.guifont = "Lilex Nerd Font:h15" -- text below applies for VimScript
  g.neovide_window_blurred = true
  g.neovide_opacity = 0.6
  g.neovide_normal_opacity = 0.6
  vim.g.neovide_underline_stroke_scale = 1.4

  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5

  vim.g.neovide_scroll_animation_length = 0.15
  vim.g.neovide_scroll_animation_far_lines = 0

  vim.g.neovide_progress_bar_enabled = true
  vim.g.neovide_progress_bar_height = 8.0
  vim.g.neovide_progress_bar_animation_speed = 150.0
  vim.g.neovide_progress_bar_hide_delay = 0.5

  vim.g.neovide_floating_shadow = false
  vim.g.neovide_show_border = false

  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_confirm_quit = true

  vim.g.neovide_position_animation_length = 0.20

  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_short_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_smooth_blink = true
end
