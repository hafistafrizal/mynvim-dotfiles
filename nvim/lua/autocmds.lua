require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- 1. Paksa statusline NvChad tetap menyala saat Snacks Dashboard aktif
autocmd({ "BufEnter", "FileType" }, {
  pattern = "snacks_dashboard",
  callback = function()
    vim.opt.laststatus = 3
  end,
})

-- 2. Memastikan NvimTree otomatis menyesuaikan diri tanpa merusak dasbor
autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.opt.laststatus = 3
    end
  end,
})
