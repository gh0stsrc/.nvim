--* --------------------------------------------------------------- *--
--?                        bufferline Setup                         ?--
--* --------------------------------------------------------------- *--

require("bufferline").setup{
  options = {
    modified_icon = "󱙄 ",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    --diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
       return " " .. icon .. count
    end
  }
}

