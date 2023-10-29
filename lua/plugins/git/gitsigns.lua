--* --------------------------------------------------------------- *--
--?                        gitsigns Setup                           ?--
--* --------------------------------------------------------------- *--

-- override gitsigns to reflect new lines with a 'plus' sign
require("gitsigns").setup({
  signs = {
    add = { text = "+" }
  }
})

