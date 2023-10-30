--* --------------------------------------------------------------- *--
--?                          harpoon Setup                          ?--
--* --------------------------------------------------------------- *--

-- load harpoon as a telescope extension 
require("telescope").load_extension('harpoon')

require("harpoon").setup({
  global_settings = {
    -- set marks specific to each git branch inside git repository
    mark_branch = true
  }
})

