local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "nvdash",
    callback = function(args)
      vim.schedule(function()
        local buf = args.buf
        if not vim.api.nvim_buf_is_valid(buf) then return end

        -- Ambil data stats dari lazy.nvim
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local loaded_info = string.format("⚡ Neovim loaded %d/%d plugins in %sms", stats.loaded, stats.count, ms)

        -- Ambil seluruh baris yang ada di buffer nvdash
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        local cleaned_lines = {}
        
        -- Saring dan rapikan baris kosong yang berlebihan
        local empty_count = 0
        for _, line in ipairs(lines) do
          if line:match("^%s*$") then
            empty_count = empty_count + 1
            if empty_count <= 2 then
              table.insert(cleaned_lines, line)
            end
          else
            empty_count = 0
            table.insert(cleaned_lines, line)
          end
        end

        -- Tambahkan footer persis di bawah
        table.insert(cleaned_lines, "")
        table.insert(cleaned_lines, "󰄛 Keep coding and stay hydrated!")
        table.insert(cleaned_lines, "───")
        table.insert(cleaned_lines, loaded_info)

        -- Tulis ulang buffer secara bersih
        vim.bo[buf].modifiable = true
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, cleaned_lines)
        vim.bo[buf].modifiable = false
      end)
    end,
  })
end

return M
