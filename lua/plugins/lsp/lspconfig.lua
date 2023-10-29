--* --------------------------------------------------------------- *--
--?                         lspconfig Setup                         ?--
--* --------------------------------------------------------------- *--


--* ------------------------------------ *--
--?          Lua Language Server         ?--
--* ------------------------------------ *--

-- IMPORTANT :  
--               - The Lua Language Server is required to be installed if you want lspconfig to provide LSP functionality for lua code. 
--               - lsp-zero should be able to install bashls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--                 the language server you can it manually - link in references section
--               - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
-- NOTE      :
--               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for lua_ls to point the default start up
--                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/lua-language-server). 
--                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").lua_ls.setup({})

--* ------------------------------------ *--
--?         BASH Language Server         ?--
--* ------------------------------------ *--

-- IMPORTANT :  
--               - The Bash Language Server is required to be installed if you want lspconfig to provide LSP functionality for bash code. 
--               - lsp-zero should be able to install bashls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--                 the language server you can it manually - link in references section
--               - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
-- NOTE      :
--               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for bashls to point the default start up
--                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/bash-language-server). 
--                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").bashls.setup({})

--* ------------------------------------ *--
--?         YAML Language Server         ?--
--* ------------------------------------ *--

-- IMPORTANT :   - The YAML Language Server is required to be installed if you want lspconfig to provide LSP functionality for YAML code. 
--               - lsp-zero should be able to install yamls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--                 the language server you can it manually - link in references section
--               - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
-- NOTE      :
--               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for yamls to point the default start up
--                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/yamls).
--                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

-- IMPORTANT :   - the YAML Language Server and LSP have been disabled on purpose; need to work out a way that it does not conflict with Helm based files and the helm_ls LSP
-- TODO: investigate the resolution for the above

-- require("lspconfig").yamlls.setup({})


--* ------------------------------------ *--
--?       Markdown Language Server       ?--
--* ------------------------------------ *--

-- IMPORTANT :   - The YAML Language Server is required to be installed if you want lspconfig to provide LSP functionality for YAML code. 
--               - lsp-zero should be able to install yamls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--                 the language server you can it manually - link in references section
--               - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
-- NOTE      :
--               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for yamls to point the default start up
--                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/yamls).
--                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

-- IMPORTANT :   - the YAML Language Server and LSP have been disabled on purpose; need to work out a way that it does not conflict with Helm based files and the helm_ls LSP
-- TODO: investigate the resolution for the above

require("lspconfig").marksman.setup({})



--* ------------------------------------ *--
--?  Terraform Language Server & Linter  ?--
--* ------------------------------------ *--

-- IMPORTANT :   - The Terraform Language Server is required to be installed if you want lspconfig to provide LSP functionality for terraform HCL code. 
--               - lsp-zero should be able to install terraform-ls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--                 the language server you can it manually - link in references section
--                 - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
-- NOTE      :
--               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for terraformls to point the default start up
--                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/terraform-ls).
--                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").terraformls.setup({})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- terraform linter
require("lspconfig").tflint.setup({})


--* ------------------------------------ *--
--?         Docker Language Server       ?--
--* ------------------------------------ *--

-- IMPORTANT :   - The Docker Language Server is required to be installed if you want lspconfig to provide LSP functionality for Dockerfile code. 
--               - lsp-zero should be able to install docker-langserver via Mason (via the ensure_installed function); however, if you encounter issues installing the
--                 the language server you can it manually - link in references section
--                 - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
-- NOTE      :
--               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for docker-langserver to point the default start up
--                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/docker-langserver).
--                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").dockerls.setup({})


--* ------------------------------------ *--
--?          Helm Language Server        ?--
--* ------------------------------------ *--

-- IMPORTANT :   - The Helm Language Server is required to be installed if you want lspconfig to provide LSP functionality for Helm code. 
--               - lsp-zero should be able to install helm_ls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--                 the language server you can it manually - link in references section
--                 - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
-- NOTE      :
--               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for helm_ls to point the default start up
--                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/helm_ls).
--                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

-- TODO: need to figure out why the Helm language server is not rendering properly
-- require("lspconfig").helm_ls.setup({})

local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = {"helm_ls", "serve"},
      filetypes = {"helm"},
      root_dir = function(fname)
        return util.root_pattern("Chart.yaml")(fname)
      end,
    },
  }
end

lspconfig.helm_ls.setup {
  filetypes = {"helm"},
  cmd = {"helm_ls", "serve"},
}


--* ------------------------------------ *--
--?   Python Type Checker & Lang Server  ?--
--* ------------------------------------ *--

-- Pyright is a full-featured, standards-based static type checker for Python which also comes with an LSP. 
-- It is designed for high performance and can be used with large Python source bases.

-- IMPORTANT :   - The pyright static type checker and language Server is required to be installed if you want lspconfig to provide LSP functionality for Python code. 
--               - lsp-zero should be able to install pyright via Mason (via the ensure_installed function); however, if you encounter issues installing the
--                 the language server you can it manually - link in references section
--                 - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
-- NOTE      :
--               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for pyright to point the default start up
--                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/pyright).
--                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").pyright.setup({})

