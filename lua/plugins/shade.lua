-- BUG: there is an issue with shade, where it will not identifty popup window's overlay positions correctly, such as with `jackmort/chatgpt.nvim` - disabled until it can be corrected
require("shade").setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<M-s>',
  }
})
