require('carbon-now').setup({
  base_url = "https://carbon.now.sh/",
  open_cmd = "xdg-open",
  options = {
    bg = "gray",
    drop_shadow_blur = "68px",
    drop_shadow = false,
    drop_shadow_offset_y = "20px",
    font_family = "Hack",
    font_size = "18px",
    line_height = "133%",
    line_numbers = true,
    theme = "one-dark",
    --titlebar = "Made with carbon-now.nvim",
    watermark = false,
    width = "2048px",
    window_theme = "sharp",
    padding_horizontal = "0px",
    padding_vertical = "0px",
  },
})

