--* --------------------------------------------------------------- *--
--?                         neoclip Setup                           ?--
--* --------------------------------------------------------------- *--

-- load neoclip as a telescope extension
require('telescope').load_extension('neoclip')
require('neoclip').setup({
  enable_persistent_history = true,
  continous_sync = true,
  default_register = {'"', '+', '*', 'c'}
})

