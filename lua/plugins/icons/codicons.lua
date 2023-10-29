--* --------------------------------------------------------------- *--
--?                          codicons Setup                         ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: 
--            - codicons is a dependency of dapui, which leverages codicons as part of the UI's debugger pane
--            - the codicon font will required to be patched by tools like nerd-fonts' font-patcher; possibly in conjunction with fontforge
--            - patching required for successful rending in the terminal, see references section for details on how to patch fonts

-- default config 
require("codicons").setup()

