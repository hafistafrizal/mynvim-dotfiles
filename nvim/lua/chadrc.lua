---@type ChadrcConfig
local M = {}

M.nvdash = {
  load_on_startup = false, -- Matikan nvdash bawaan NvChad
}

M.base46 = {
  theme = "onedark",
  transparency = true,
}

-- Atur warna khusus untuk jam/waktu (Ungu)
vim.api.nvim_set_hl(0, "TimePurpleText", { fg = "#c678dd", bold = true })

-- Warna No Git (Abu-abu Muted)
vim.api.nvim_set_hl(0, "GitNoGitIcon", { fg = "#1e222a", bg = "#5c6370", bold = true })
vim.api.nvim_set_hl(0, "GitNoGitText", { fg = "#abb2bf", bg = "#2b303a" })
vim.api.nvim_set_hl(0, "GitNoGitSepL", { fg = "#5c6370", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitNoGitSepR", { fg = "#2b303a", bg = "NONE" })

-- Warna Main / Master (Hijau)
vim.api.nvim_set_hl(0, "GitMainIcon", { fg = "#1e222a", bg = "#98c379", bold = true })
vim.api.nvim_set_hl(0, "GitMainText", { fg = "#98c379", bg = "#2b303a" })
vim.api.nvim_set_hl(0, "GitMainSepL", { fg = "#98c379", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitMainSepR", { fg = "#2b303a", bg = "NONE" })

-- Warna Branch Lain (Kuning / Oranye)
vim.api.nvim_set_hl(0, "GitOtherIcon", { fg = "#1e222a", bg = "#e5c07b", bold = true })
vim.api.nvim_set_hl(0, "GitOtherText", { fg = "#e5c07b", bg = "#2b303a" })
vim.api.nvim_set_hl(0, "GitOtherSepL", { fg = "#e5c07b", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitOtherSepR", { fg = "#2b303a", bg = "NONE" })
-- Loop Timer agar detik (%H:%M:%S) di-refresh setiap 1 detik
if not _G.time_timer_started then
  _G.time_timer_started = true
  local timer = vim.uv.new_timer()
  timer:start(
    0,
    1000,
    vim.schedule_wrap(function()
      vim.cmd "redrawtabline"
    end)
  )
end

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = false,
    order = { "treeOffset", "buffers", "tabs", "datetime" },
    modules = {
      datetime = function()
        local icon = " 󰸗 "
        local date = os.date "%d/%m/%Y "
        local time = os.date "%H:%M:%S"
        return "%#St_pos_sep#" .. icon .. "%#St_pos_text#" .. date .. "%#TimePurpleText#" .. time .. " "
      end,
    },
  },

  statusline = {
    enabled = true,
    theme = "minimal",
    order = { "mode", "file", "%=", "lsp","git", "cwd", "cursor" },
    separator_style = "round",
    modules = {
      -- Modul Git Berbentuk Kapsul Bulat Presisi
      git = function()
        local gitsigns = vim.b.gitsigns_status_dict
        local head = (gitsigns and gitsigns.head) and gitsigns.head or ""
        local sep_left = "█"
        local sep_right = "█"

        -- Menggunakan karakter kapsul setengah lingkaran bawaan font ( dan )
        if head == "" then
          return "%#GitNoGitSepL#%#GitNoGitIcon# %#GitNoGitText# No Git %#GitNoGitSepR# "
        elseif head == "main" or head == "master" then
          return "%#GitMainSepL#%#GitMainIcon# %#GitMainText# " .. head .. "%#GitMainSepR# "
        else
          return "%#GitOtherSepL#%#GitOtherIcon# %#GitOtherText# " .. head .. "%#GitOtherSepR# "
        end
      end,
    },
  },
}

return M
