--* --------------------------------------------------------------- *--
--?                          neodev Setup                           ?--
--* --------------------------------------------------------------- *--

-- NOTE: It is highly recommended to use neodev.nvim to enable type checking for nvim-dap-ui to get type checking, documentation and autocompletion for all API functions.
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

