local status_ok, alpha = pcall(require, "alpha")
if not status_ok then return end

-- 1. Custom Highlight Groups
vim.api.nvim_set_hl(0, "AlphaHeaderBlue", { fg = "#61afef", bold = true })
vim.api.nvim_set_hl(0, "AlphaBtnText", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#e5c07b" })
vim.api.nvim_set_hl(0, "AlphaQuote", { fg = "#98c379" })
vim.api.nvim_set_hl(0, "AlphaStats", { fg = "#e5c07b", bold = true })

-- 2. Header ASCII
local header = {
  type = "text",
  val = {
    "                ryizzl                                               ",
    "       ████ ██████           █████      ██                     ",
    "      ███████████             █████                             ",
    "      █████████ ███████████████████ ███   ███████████   ",
    "     █████████  ███    █████████████ █████ ███████████████   ",
    "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
    "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
    " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
  },
  opts = {
    position = "center",
    hl = "AlphaHeaderBlue",
  },
}

-- 3. Helper Pembuat Tombol Presisi
local function make_button(sc, icon, label, action)
  local sc_clean = sc:gsub("%s", "")
  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 5,
    width = 52,
    align_shortcut = "right",
    hl_shortcut = "AlphaShortcut",
    hl = "AlphaBtnText",
  }

  if type(action) == "string" then
    opts.keymap = { "n", sc_clean, action, { noremap = true, silent = true } }
  elseif type(action) == "function" then
    opts.keymap = { "n", sc_clean, "", {
      noremap = true,
      silent = true,
      callback = action,
    } }
  end

  return {
    type = "button",
    val = icon .. "  " .. label,
    on_press = function()
      if type(action) == "string" then
        local key = vim.api.nvim_replace_termcodes(sc_clean .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "normal", false)
      elseif type(action) == "function" then
        action()
      end
    end,
    opts = opts,
  }
end

-- 4. Daftar Tombol Menu
local buttons = {
  type = "group",
  val = {
    make_button("f", "", "Find File        ", "<cmd> Telescope find_files <CR>"),
    make_button("n", "", "New File        ", function()
      vim.cmd "enew"
      vim.cmd "startinsert"
    end),
    make_button("g", "󰈭", "Find Text        ", "<cmd> Telescope live_grep <CR>"),
    make_button("r", "", "Recent Files    ", "<cmd> Telescope oldfiles <CR>"),
    make_button("c", "", "Config          ", "<cmd> Telescope find_files cwd=" .. vim.fn.stdpath("config") .. " <CR>"),
    make_button("L", "󰒲", "Lazy            ", "<cmd> Lazy <CR>"),
    make_button("q", "", "Quit            ", "<cmd> qa <CR>"),
  },
  opts = {
    spacing = 1,
  },
}

-- 5. Dynamic Footer Stats & Kata Motivasi
local stats = require("lazy").stats()
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
local loaded_info = string.format("⚡ Neovim loaded %d/%d plugins in %sms", stats.loaded, stats.count, ms)

local footer = {
  type = "group",
  val = {
    {
      type = "text",
      val = "󰄛 Keep coding and stay hydrated!",
      opts = { position = "center", hl = "AlphaQuote" },
    },
    {
      type = "text",
      val = "─",
      opts = { position = "center", hl = "Comment" },
    },
    {
      type = "text",
      val = loaded_info,
      opts = { position = "center", hl = "AlphaStats" },
    },
  },
}

-- 6. Layout Final
alpha.setup {
  layout = {
    { type = "padding", val = 2 },
    header,
    { type = "padding", val = 2 },
    buttons,
    { type = "padding", val = 1 },
    footer,
  },
  opts = {
    margin = 5,
  },
}
