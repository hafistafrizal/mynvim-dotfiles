-- Load konfigurasi default bawaan NvChad
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local servers = { "html", "cssls", "pylsp", "clangd", "vtsls"}

-- Mematikan virtual text secara tegas di tingkat LSP
vim.diagnostic.config({
  virtual_text = false,
  -- signs = true,
  underline = true,
})

-- Pengaturan LSP menggunakan API terbaru Neovim (vim.lsp.config)
for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = {
    cmd = vim.lsp.config[lsp] and vim.lsp.config[lsp].cmd,
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
  vim.lsp.enable(lsp)
end

--vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
