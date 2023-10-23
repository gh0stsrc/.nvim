--* --------------------------------------------------------------- *--
--?                          lualine Setup                          ?--
--* --------------------------------------------------------------- *--
--* Note: lualine is a blazing fast and easy to configure neovim statusline written in Lua.

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "onedark",
    component_separators = "|",
    section_separators = "",
  },
})
