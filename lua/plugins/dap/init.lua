--* --------------------------------------------------------------- *--
--?     Debug Adapter Protocol (DAP) and dap-go delve extension     ?--
--* --------------------------------------------------------------- *--

--* --------------------------- *--
--?             dap             ?--
--* --------------------------- *--
--! IMPORTANT: 
--!             - dap (nvim-dap) is a generic protocol for neovim that will interface with various debuggers
--!               - simply integrate the debugger of your choice for the language of use and configure their respective setup configurations, reference dap-go below

require("plugins.dap.dapui")
require("plugins.dap.neodev")
require("plugins.dap.dap-go")
