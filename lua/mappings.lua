require "nvchad.mappings"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")
map("n", "<C-S-h>", "<C-w><")
map("n", "<C-S-l>", "<C-w>>")
map("n", "<C-S-k>", "<C-w>+")
map("n", "<C-S-j>", "<C-w>-")

map("n", "<leader>fr", "<cmd> Telescope oldfiles <cr>")

-- Do things without affecting the registers
map("n", "d", '"_d')
map("n", "D", '"_D')
map("n", "x", '"_x')
map("n", "X", '"_X')

map("v", "d", '"_d')
map("v", "x", '"_x')
map("n", "-", function()
  vim.cmd "Oil"
end)
