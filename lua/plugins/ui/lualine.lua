--* --------------------------------------------------------------- *--
--?                          lualine Setup                          ?--
--* --------------------------------------------------------------- *--

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "onedark",
    section_separators = { left = '', right = '' }, -- IMPORTANT: to be able to load these semi-circle fonts you will need a Patched `Nerd Fonts` installed and your temrinal configured to default to them
    component_separators = '|',
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 }, -- omit the separator for the left side of section `A`
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 }, -- omit the separator for the right side of section `Z`
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
})

