local options = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.98,  -- 98% Lebar layar (Hampir Penuh)
      height = 0.95, -- 95% Tinggi layar (Menutupi Header & Footer)
      preview_cutoff = 120,
    },
  },
}

return options
