-- TODO: Move to neoclip setup
require('telescope').load_extension('neoclip')

require('neoclip').setup({
  --enable_persistent_history = true,
  default_register = {'"', '+', '*', "c"}
})

