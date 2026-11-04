return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
    -- opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      -- 1. Suntikkan PATH MSYS2 DLL & compiler CC ke environment internal Neovim
      vim.env.PATH = "C:\\msys64\\ucrt64\\bin;" .. vim.env.PATH
      vim.env.CC = "gcc"

      -- 2. Paksa driver install Treesitter menggunakan GCC
      local ts_install = require("nvim-treesitter.install")
      ts_install.compilers = { "gcc" }
      ts_install.prefer_git = false

      -- 3. Inisialisasi setup Treesitter
      local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
      if ok then
        treesitter_configs.setup({
          ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "html",
            "css",
            "javascript",
            "typescript",
            "tsx",
            "php",
            "php_only",
            "c",
            "cpp",
            "python",
            "bash",
            "json",
            "markdown",
            "markdown_inline",
          },
          auto_install = true,
          highlight = {
            enable = true,
            use_languagetree = true,
            additional_vim_regex_highlighting = false,
          },
          indent = {
            enable = true,
          },
        })
      end
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.chunk"
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require "configs.inline-diagnostic"
      vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
  },

  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },

  {
    "nvzone/timerly",
    dependencies = 'nvzone/volt',
    cmd = "TimerlyToggle",
    opts = {} -- optional
  },

  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {
      winlayout = "responsive", -- Agar tampilannya otomatis menyesuaikan ukuran terminal
      wpm_goal = 120,           -- Target kecepatan mengetik kamu (bisa diubah)
      kblayout = "qwerty",      -- Susunan keyboard
    },
    cmd = { "Typr", "TyprStats" },
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require "configs.alpha"
      -- Paksa panggil Alpha & hapus buffer 'No Name' bawaan NvChad
      vim.schedule(function()
        if vim.fn.argc() == 0 then
          require("alpha").start(true)
        end
      end)
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },

  -- {
  --   "folke/snacks.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   opts = function()
  --     return require "configs.snacks"
  --   end,
  -- },
  --
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
