require "nvchad.mappings"

local map = vim.keymap.set

vim.opt.clipboard = "unnamedplus"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <CR>", { desc = "Save File" })

map("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
map("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
map("i", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard in insert mode" })

map("n", "<F5>", "<cmd> w <CR> :vsplit | terminal g++ % -o %<.exe && .\\%<.exe <CR>", { desc = "Run C++ File" })

map({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open context menu" })
