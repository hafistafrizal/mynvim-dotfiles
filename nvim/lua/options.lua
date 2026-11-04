require "nvchad.options"

-- Pengaturan Diagnostic
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

-- Kunci statusline NvChad
vim.o.laststatus = 3
vim.o.cmdheight = 1

-- Perintah kustom :Timer
vim.api.nvim_create_user_command("Timer", function()
  vim.o.showtabline = 0
  vim.o.laststatus = 3
  vim.wo.number = false
  vim.o.scl = "no"
  vim.cmd "TimerlyToggle"
end, {})

-- Floating window background solid
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#61afef", bg = "#1e222a" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e222a" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#61afef", bg = "#1e222a" })


