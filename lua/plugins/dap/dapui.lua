--* --------------------------------------------------------------- *--
--?                          dap-ui Setup                           ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: 
--           - dap (nvim-dap) is a generic protocol for neovim that will interface with various debuggers
--           - simply integrate the debugger of your choice for the language of use and configure their respective setup configurations, reference dap-go below

--* --------------------------- *--
--?             dapui           ?--
--* --------------------------- *--

-- NOTE: dapui is a User Interface (UI) for nvim-dap which provides a good out of the box configuration.
require("dapui").setup()

