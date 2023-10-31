--* --------------------------------------------------------------- *--
--?                    indent_blankline Setup                       ?--
--* --------------------------------------------------------------- *--

require("ibl").setup({
  scope = {
    show_exact_scope = true, -- requires treesitter
  },
  indent = {
    -- replace default char to a slimmer pipe
    char = "│",
  }
})

