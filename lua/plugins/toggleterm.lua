--* --------------------------------------------------------------- *--
--?                      toggle terminal Setup                      ?--
--* --------------------------------------------------------------- *--
--* Note: toggleterm is a neovim plugin to persist and toggle multiple terminals during an editing session

require("toggleterm").setup({
  direction = "horizontal",
  size = 15,
  -- open_mapping = [[<M-j>]]
})

