--?  _   _                 _             _____              __ _
--? | \ | |               (_)           /  __ \            / _(_)
--? |  \| | ___  _____   ___ _ __ ___   | /  \/ ___  _ __ | |_ _  __ _
--? | . ` |/ _ \/ _ \ \ / / | '_ ` _ \  | |    / _ \| '_ \|  _| |/ _` |
--? | |\  |  __/ (_) \ V /| | | | | | | | \__/\ (_) | | | | | | | (_| |
--? \_| \_/\___|\___/ \_/ |_|_| |_| |_|  \____/\___/|_| |_|_| |_|\__, |
--?                                                               __/ |
--?                                                              |___/
--?
--! Version : v1.3.0
--* Note    : the comment syntax for lua has been extended to using additional characters such as ['*','?','!'] to provide color highlighting
--*           for various types of comments, for example:
---             - --!:
--!               - Important (color red)
---             - --?:
--?               - Titling (color blue)
---             - --*:
--*               - Significance (bold comment)
---             - ---:
---               - Regular Comment           


-- welcome message when opening neovim
print(string.format("[ welcome %s ]",os.getenv("USER")))

-- set the default leader for key mappings
vim.g.mapleader = " " --! leader is the space key


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                                     Helper Functions                                                      ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- helper func to convert strings to booleans - primarily for env var comparison
local function to_boolean(str)
  local bool = false
  if str == "true" then
      bool = true
  end
  return bool
end

-- if the environment variable NVIM_DEBUG is set, then print the debug header
if to_boolean(os.getenv("NVIM_DEBUG")) == true then
  print("\n[DEBUG]\n")
 end

-- helper func to check if neovim compatible clipboard providers are currently installed
local function check_clipboard_providers()
  local compatible_providers = {"xclip", "xsel", "tmux", "termux", "lemonade", "doitclient"}
  local found_providers = {}

  -- iterate over each provider in the list of compatible_providers and check if there is a present provider installed for neovim to leverage
  for _, provider in ipairs(compatible_providers) do
    -- check if the provider is executable using Neovim’s vim.fn.executable function
    if vim.fn.executable(provider) == 1 then
      -- if the provider is executable, add it to the found_providers table
      table.insert(found_providers, provider) -- Insert the provider to the found_providers list
    end
  end
  -- return the table of found providers
  return found_providers
end


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                             NeoVim Clipboard Bootstrapping                                               ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- call the check_clipboard_providers function and store the result in the clipboard_providers variable
local clipboard_providers = check_clipboard_providers()

-- check if no clipboard provider has been found AND if the user has NOT set the NVIM_SKIP_CLIP environment variable
if #clipboard_providers == 0 and not(to_boolean(os.getenv("NVIM_SKIP_CLIP")) == false) then
    -- If no providers were found, raise an error
    error(("No clipboard providers found, either install one of the compatible clipboards or enable the NVIM_SKIP_CLIP env var to ignore clipboard errors; compatible clipboards -> " .. "[" .. table.concat(clipboard_providers, ", ") .. "]"), 1)
else
  -- if one or more providers were found, print a message listing the found clipboard providers
  if to_boolean(os.getenv("NVIM_DEBUG")) == true then
   print("- CLIPBOARD PROVIDERS FOUND: " .. "[" .. table.concat(clipboard_providers, ", ") .. "]")
  end
end

--! IMPORTANT:
--*             [:help g:clipboard]
--*             Neovim has no direct connection to the system clipboard. Instead it depends on a `provider` which transparently uses shell commands to communicate with the system 
--*             clipboard or any other clipboard backend 
--*
--*             The presence of a working clipboard tool implicitly enables the '+' and '*' registers. neovim looks for these clipboard tools in order priority of :
--*               - g:clipboard
--*               - pbcop, pbpaste (macOS)
--*               - wl-copy, wl-paste (if $WAYLAND_DISPLAY is set)
--*               - xclip (if $DISPLAY is set)
--*               - xsel (if $DISPLAY is set)
--*               - lemonade (for SSH)
--*               - doitclient (for SSH)
--*               - win32yank (Windows)
--*               - termux (via termux-clipboard-set, termux-clipboard-set)
--*               - tmux (if $TMUX is set)
--*
--!             This means that if xclip or xsel are installed and their dependent environment variable (i.e. $DISPLAY) defining which xserver display to attach to are present, 
--!             neovim will implicitly create the necessary hooks and enable the required registers ('+', '*'). Ultimately resulting in a turn-key clipboard solution for GUI versions 
--!             of GUI-based linux distributions (e.g. ubuntu + xserver)

--* Note: 
--*        - if tmux is the only provider, neovim will implicitly enable hooks and registers for the clipboard; however the key bindings below will not be enabled; to do so
--*          you will need to set the `NVIM_CLIP` environment variable to any permutation of upper and lower case characters of 'tmux'.
--*        - this impacts terminal only/headless users (no use of xserver - headless server - No GUI)

--! check if the user explitily would like to leverage tmux as the clipboard provider OR if the only provider available is tmux AND ensure that a tmux session is attached
if (string.upper(os.getenv("NVIM_CLIP") or "nil") == "TMUX" or string.upper(clipboard_providers[1]) == "TMUX") and (os.getenv("TMUX") ~= nil) then
  -- explictly set tmux as the neovim clipboard provider
  vim.g.clipboard = {
    name = "tmux",
    copy = {
      ["+"] = {"tmux", "load-buffer", "-"},
      ["*"] = {"tmux", "load-buffer", "-"},
    },
    paste = {
      ["+"] = {"tmux", "save-buffer", "-"},
      ["*"] = {"tmux", "save-buffer", "-"},
    },
    cache_enabled = true
  }
  -- visual mode key binding for copying
  vim.api.nvim_set_keymap("v", "<Leader>y", ":w !tmux load-buffer -<CR>", { noremap = true, silent = true })
  -- normal mode key binding for pasting
  vim.api.nvim_set_keymap("n", "<Leader>p", ":r !tmux save-buffer -<CR>", { noremap = true, silent = true })
end


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                               Packer Setup & Bootstrapping                                               ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- function to be used to check if Packer is not currently install, if not, invoke Packer installation and self-bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  -- if Packer is not installed in the expected install path, Packer is missing so clone the git repo and add the plugin for install
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    -- ret
    return true
  end
  -- otherwise if Packer is already installed in the expected install path, return false as nothing else is required for Packer self-bootstrapping
  return false
end

-- the boolean expression dictating if packer is required to be bootstrapped
local packer_bootstrap = ensure_packer()

--! --------------------------------------------------------------------- !--
--?   Packer Startup Configuration - Including Bootstrapping of Plugins   ?--
--! --------------------------------------------------------------------- !--
require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }
  -- place plugins which you desire packer to install below
  use { "ellisonleao/gruvbox.nvim" } -- 
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.3",
    requires = {
      {"nvim-lua/plenary.nvim"},           --* Required
      {"BurntSushi/ripgrep"},              --* Required
      {"sharkdp/fd"}                       --* Optional       
    }
  }
  use({
    "chama-chomo/grail",
    -- Optional; default configuration will be used if setup is not called.
    config = function()
    require("grail").setup()
    end,
  })
  use {
    "nvim-lualine/lualine.nvim",
     requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }
  use { "fatih/vim-go" }
  -- neovim Debug Adapter Protocol (DAP)
  use { "mfussenegger/nvim-dap" }
  -- neovim DAP UI plugin
  use { "rcarriga/nvim-dap-ui",
          requires = {
            "mfussenegger/nvim-dap",          --* Required
            "folke/neodev.nvim"               --* Required
      }
  }
  
  use { "folke/neodev.nvim" }

  -- An extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests.
  use { "leoluz/nvim-dap-go"}
  --! condicon font used by nvim-dap-ui - Note: this font requires to be patched to be properly processed by most terminals; see plugin configuration section for details
  use { "mortepau/codicons.nvim" }
  -- 
  use {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v3.x", --! IMPORTANT: currently testing `v3.x`; may have to revert back to `v2.x` if issues arise 
      requires = {
        {"neovim/nvim-lspconfig"},             --* Required
        {"williamboman/mason.nvim"},           --* Optional
        {"williamboman/mason-lspconfig.nvim"}, --* Optional
        {"hrsh7th/nvim-cmp"},                  --* Required
        {"hrsh7th/cmp-nvim-lsp"},              --* Required
        {"hrsh7th/cmp-buffer"},                --* Optional
        {"hrsh7th/cmp-path"},                  --* Optional
        {"saadparwaiz1/cmp_luasnip"},          --* Optional
        {"hrsh7th/cmp-nvim-lua"},              --* Optional
        {"L3MON4D3/LuaSnip"},                  --* Required
        {"rafamadriz/friendly-snippets"},      --* Optional
      },

      use {"akinsho/toggleterm.nvim", tag = "*" },
      use {"jhlgns/naysayer88.vim"},
      use {"terrortylor/nvim-comment"},
      use {"CreaturePhil/vim-handmade-hero"}
  }

  -- check if the env var `NVIM_ENABLE_GPT` is set to true; if so add the chatgpt plugin to the packer setup
  if to_boolean(os.getenv("NVIM_ENABLE_GPT")) == true then
    use {
      "jackMort/ChatGPT.nvim",
      requires = {
        {"MunifTanjim/nui.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope.nvim"}
      }
    }
  end

  -- Automatically set up your configuration after cloning packer.nvim - Packer self-bootstrapping
  if packer_bootstrap then
    require("packer").sync()
  end
end)


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                               Plugin Specific Configurations                                             ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

--* --------------------------------------------------------------- *--
--?                          treesitter Setup                       ?--
--* --------------------------------------------------------------- *--
--* Note      : tree-sitter is a parser generator tool and an incremental parsing library. 
--*             It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited.
--! IMPORTANT : required for IDE functionality such as parsing, syntax highlighting, code analysis and incremental selection.

require("nvim-treesitter.configs").setup({
  ensure_installed = {"c", "lua", "vim", "go", "javascript", "typescript", "rust", "dockerfile", "python", "bash", "hcl", "rego"},
  highlight = {
    enable = true,
  }
})


--* --------------------------------------------------------------- *--
--?                          gruvbox Setup                          ?--
--* --------------------------------------------------------------- *--
--* Note: gruvbox is a neovim theme heavily inspired by badwolf, jellybeans and solarized

require("gruvbox").setup({
  contrast = "hard",
  palette_overrides = {
    gray = "#2ea542", -- comments are overridden to be green
  }
})


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


--* --------------------------------------------------------------- *--
--?                      toggle terminal Setup                      ?--
--* --------------------------------------------------------------- *--
--* Note: toggleterm is a neovim plugin to persist and toggle multiple terminals during an editing session

require("toggleterm").setup({
  direction = "horizontal",
  size = 15,
  -- open_mapping = [[<M-j>]]
})


--* --------------------------------------------------------------- *--
--?                       nvim-comment Setup                        ?--
--* --------------------------------------------------------------- *--
require("nvim_comment").setup({
  operator_mapping = "<leader>/"
})


--* --------------------------------------------------------------- *--
--?            Language Server Protocol & interface Setup           ?--
--* --------------------------------------------------------------- *--
local lsp = require("lsp-zero").preset("recommended")

-- list of language servers, debugger adapters, linters and formatters to be installed by mason and leveraged by lsp-zero
lsp.ensure_installed({
  "tsserver",
  "gopls",
  "eslint",
  "rust_analyzer",
  "terraformls",
  "tflint",
  "bashls",
  "dockerls",
  "helm_ls", -- TODO: need to figure out why the Helm language server is not rendering properly
  "pyright",
  -- "yamls", --! IMPORTANT: disabled on purpose, see configurations for more details
})

-- configure lsp preferences
lsp.set_preferences({
  sign_icons = {}
})

-- integration and keybindings for telescope functionality (on attach - before setup)
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({{buffer = bufnr}})
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer = true})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- hover over documentation preview
  vim.keymap.set("n", "<M-r>", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "hl", function() vim.lsp.buf.document_highlight() end, opts)
  vim.keymap.set("n", "hc", function() vim.lsp.buf.clear_references() end, opts)
  vim.keymap.set("n", "ds", function() vim.lsp.buf.document_symbol() end, opts)
  vim.keymap.set("n", "ws", function() vim.lsp.buf.workspace_symbol() end, opts)
end)

-- invoke lsp setup
lsp.setup()

-- attach lsp handler(s)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    virtual_text = true,
    underline = false,
  }
)


--* ------------------------------------ *--
--? [LSP auto-completion & keybindings]  *--
--* ------------------------------------ *--

-- Note: cmp is a completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
local cmp = require("cmp")
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

-- -- the meat and potatoes for cmp config
cmp.setup({
  sources = {
    {name = "nvim_lsp"},
  },
  mapping = {
    ["<C-y>"] = cmp.mapping.confirm({select = true}),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
    ["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
    ["<C-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item(cmp_select_opts)
      else
        cmp.complete()
      end
    end),
    ["<C-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item(cmp_select_opts)
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    documentation = {
      max_height = 15,
      max_width = 60,
    }
  },
  formatting = {
    fields = {"abbr", "menu", "kind"},
    format = function(entry, item)
      local short_name = {
        nvim_lsp = "LSP",
        nvim_lua = "nvim"
      }

      local menu_name = short_name[entry.source.name] or entry.source.name

      item.menu = string.format('[%s]', menu_name)
      return item
    end,
  },
})


--* ------------------------------------ *--
--?         BASH Language Server         ?--
--* ------------------------------------ *--

--! IMPORTANT :  
--!               - The Bash Language Server is required to be installed if you want lspconfig to provide LSP functionality for bash code. 
--!               - lsp-zero should be able to install bashls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--!                 the language server you can it manually - link in references section
--!               - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
--* Note      :
--*               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for bashls to point the default start up
--*                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/bash-labguage-server). 
--*                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").bashls.setup({})


--* ------------------------------------ *--
--?         YAML Language Server         ?--
--* ------------------------------------ *--

--! IMPORTANT :   - The YAML Language Server is required to be installed if you want lspconfig to provide LSP functionality for YAML code. 
--!               - lsp-zero should be able to install yamls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--!                 the language server you can it manually - link in references section
--!               - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
--* Note      :
--*               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for yamls to point the default start up
--*                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/yamls).
--*                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

--! IMPORTANT :   - the YAML Language Server and LSP have been disabled on purpose; need to work out a way that it does not conflict with Helm based files and the helm_ls LSP
-- TODO: investigate the resolution for the above

-- require("lspconfig").yamlls.setup({})


--* ------------------------------------ *--
--?  Terraform Language Server & Linter  ?--
--* ------------------------------------ *--

--! IMPORTANT :   - The Terraform Language Server is required to be installed if you want lspconfig to provide LSP functionality for terraform HCL code. 
--!               - lsp-zero should be able to install terraform-ls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--!                 the language server you can it manually - link in references section
--!                 - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
--* Note      :
--*               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for terraformls to point the default start up
--*                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/terraform-ls).
--*                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").terraformls.setup({})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Terraform linter
require("lspconfig").tflint.setup({})


--* ------------------------------------ *--
--?         Docker Language Server       ?--
--* ------------------------------------ *--

--! IMPORTANT :   - The Docker Language Server is required to be installed if you want lspconfig to provide LSP functionality for Dockerfile code. 
--!               - lsp-zero should be able to install docker-langserver via Mason (via the ensure_installed function); however, if you encounter issues installing the
--!                 the language server you can it manually - link in references section
--!                 - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
--* Note      :
--*               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for docker-langserver to point the default start up
--*                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/docker-langserver).
--*                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").dockerls.setup({})


--* ------------------------------------ *--
--?          Helm Language Server        ?--
--* ------------------------------------ *--

--! IMPORTANT :   - The Helm Language Server is required to be installed if you want lspconfig to provide LSP functionality for Helm code. 
--!               - lsp-zero should be able to install helm_ls via Mason (via the ensure_installed function); however, if you encounter issues installing the
--!                 the language server you can it manually - link in references section
--!                 - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
--* Note      :
--*               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for helm_ls to point the default start up
--*                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/helm_ls).
--*                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

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

--* Pyright is a full-featured, standards-based static type checker for Python which also comes with an LSP. 
--* It is designed for high performance and can be used with large Python source bases.

--! IMPORTANT :   - The pyright static type checker and language Server is required to be installed if you want lspconfig to provide LSP functionality for Python code. 
--!               - lsp-zero should be able to install pyright via Mason (via the ensure_installed function); however, if you encounter issues installing the
--!                 the language server you can it manually - link in references section
--!                 - if performing a manual install of the language server, please ensure that the binary can be found in $PATH
--* Note      :
--*               - even if lsp-zero/Mason is able to install the language server, you may need to configure the respective lspconfig setup for pyright to point the default start up
--*                 command to the path where it was auto installed (e.g. /home/{USER}/.local/share/nvim/mason/bin/pyright).
--*                 depending on the LSP the default startup command may assume that the binary can be found under $PATH

require("lspconfig").pyright.setup({})


--* --------------------------------------------------------------- *--
--?     Debug Adapter Protocol (DAP) and dap-go delve extension     ?--
--* --------------------------------------------------------------- *--

--* --------------------------- *--
--?             dap             ?--
--* --------------------------- *--
--! IMPORTANT: 
--!             - dap (nvim-dap) is a generic protocol for neovim that will interface with various debuggers
--!               - simply integrate the debugger of your choice for the language of use and configure their respective setup configurations, reference dap-go below

--* --------------------------- *--
--?             dapui           ?--
--* --------------------------- *--
-- Note: dapui is a User Interface (UI) for nvim-dap which provides a good out of the box configuration.
require("dapui").setup()

--! dependency of dapui
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...
})


--* --------------------------- *--
--?            codicons         ?--
--* --------------------------- *--
--! IMPORTANT: 
--!             - codicons is a dependency of dapui, which leverages codicons as part of the UI's debugger pane
--!             - the codicon font will required to be patched by tools like nerd-fonts' font-patcher; possibly in conjunction with fontforge
--!             - patching required for successful rending in the terminal, see references section for details on how to patch fonts

require("codicons").setup()


--* --------------------------- *--
--?            dap-go           ?--
--* --------------------------- *--
--* Note: DAP-Go (i.e. nvim-dap-go) is an extension for nvim-dap providing configurations for launching go debugger (delve) 
--*       and debugging individual tests.

require("dap-go").setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the dlv executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
  },
}


--* --------------------------------------------------------------- *--
--?                           chatgpt Setup                         ?--
--* --------------------------------------------------------------- *--

--! IMPORTANT: to leverage the chatgpt plugin you will need to provide a valid API key; see the README for more details
--* check if the env var `NVIM_ENABLE_GPT` is set to true; if so invoke the plugin's default setup, with a couple of overrides
if to_boolean(os.getenv("NVIM_ENABLE_GPT")) == true then
  require("chatgpt").setup({ 
    chat = {
      question_sign = "",
      answer_sign = "",

    },
    openai_params = {
      model = "gpt-3.5-turbo",
      max_tokens = 900,
    },
    --* default key mappings below
    -- keymaps = {
    --   close = { "<C-c>" },
    --   yank_last = "<C-y>",
    --   yank_last_code = "<C-k>",
    --   scroll_up = "<C-u>",
    --   scroll_down = "<C-d>",
    --   new_session = "<C-n>",
    --   cycle_windows = "<Tab>",
    --   cycle_modes = "<C-f>",
    --   select_session = "<Space>",
    --   rename_session = "r",
    --   delete_session = "d",
    --   draft_message = "<C-d>",
    --   toggle_settings = "<C-o>",
    --   toggle_message_role = "<C-r>",
    --   toggle_system_role_open = "<C-s>",
    --   stop_generating = "<C-x>",
    -- },
  })
end


--* --------------------------------------------------------------- *--
--?                    Color Scheme Configurations                  ?--
--* --------------------------------------------------------------- *--

-- set colorscheme
vim.cmd("colorscheme gruvbox")

-- adding the same comment color in each theme
vim.cmd([[
  augroup CustomCommentCollor
    autocmd!
    autocmd VimEnter * hi Comment guifg=#2ea542
  augroup END
]])

-- Disable annoying matching brackets and other jazz
vim.cmd([[
  augroup CustomHI
    autocmd!
    autocmd VimEnter * NoMatchParen 
  augroup END
]])

-- customizations
vim.o.background = "dark"
vim.opt.guicursor = "i:block"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.swapfile = false

vim.o.hlsearch = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
--vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                                       Key Bindings                                                       ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--
--* Note: for a better understanding of all keybindings, see the README for comprehensive details.

--* --------------------------------------------------------------- *--
--?                         Generic Key Bindings                    ?--
--* --------------------------------------------------------------- *--

--* go back
vim.keymap.set("n", "<M-b>", ":Ex<CR>")

--* insert mode cancelation
vim.keymap.set("i", "jj", "<Esc>")

--* split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })


--* --------------------------------------------------------------- *--
--?                      toggleterm Key Bindings                    ?--
--* --------------------------------------------------------------- *--

--* horizontal pane key binding
vim.keymap.set("n", "<M-j>", "<cmd>ToggleTerm direction=horizontal<cr>")
--* floating plane key binding
vim.keymap.set("n", "<M-k>", "<cmd>ToggleTerm direction=float<cr>")
--* keys to exit terminal mode, primarily for the floating pane
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "jj", [[<C-\><C-n>]])


--* --------------------------------------------------------------- *--
--?                       telescope Key Bindings                    ?--
--* --------------------------------------------------------------- *--
--* See `:help telescope.builtin`

--* telescope related key bindings
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<M-f>", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
      previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>p", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<M-p>", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" }) -- same command as above just also mapped to <alt>-p
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })


--* --------------------------------------------------------------- *--
--?                           LSP Key Bindings                      ?--
--* --------------------------------------------------------------- *--
--* Note: the configuration of LSP auto-completion key bindings are embedded as part of the configuration of cmp


--* --------------------------------------------------------------- *--
--?                           DAP Key Bindings                      ?--
--* --------------------------------------------------------------- *--

--* dap-ui toggle keybindings
vim.keymap.set("n", "<leader>du", require("dapui").toggle)
-- vim.keymap.set("n", "<leader>do", require("dapui").open)
-- vim.keymap.set("n", "<leader>dc", require("dapui").close)

--* general debugger functioanlity key bindings
vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", require("dap").continue)
vim.keymap.set("n", "<leader>do", require("dap").step_over)
vim.keymap.set("n", "<leader>di", require("dap").step_into)
vim.keymap.set("n", "<leader>d0", require("dap").step_out)
vim.keymap.set("n", "<leader>dl", require("dap").run_last)
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end)


--* --------------------------------------------------------------- *--
--?                           ChatGPT Bindings                      ?--
--* --------------------------------------------------------------- *--
--* Note: Only functions exposed by the ChatGPT plugin have been mapped to keys explictly and can be seen below. Refer to the README for more details pertaining to

--* ChatGPT keybindings
vim.keymap.set("n", "gpt", "<cmd>ChatGPT<cr>")
vim.keymap.set("n", "gpta", "<cmd>ChatGPTActAs<cr>")
vim.keymap.set("n", "gpte", "<cmd>ChatGPTEditWithInstructions<cr>")
vim.keymap.set("n", "gptr", "<cmd>ChatGPTRun<cr>")
vim.keymap.set("n", "gptc", "<cmd>ChatGPTCompleteCode<cr>")


--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--?                                                             [Plugin Inventory]                                                            ?--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--!                                                                                                                                           !--
--?                      PLEASE REFER TO THE README FILE FOR AN ACCURATE INVENTORY OF PLUGINS AND THEIR PURPOSES                              ?--
--!                                                                                                                                           !--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--


--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--?                                                [Language Severs, LSPs, Linters & Formatters]                                              ?--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--!                                                                                                                                           !--
--?                  PLEASE REFER TO THE README FILE FOR AN ACCURATE INVENTORY OF LANGUAGE SEVERS, LSPS, LINTERS & FORMATTERS                 ?--
--!                                                                                                                                           !--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--


--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--?                                                                [References]                                                               ?--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--!                                                                                                                                           !--
--?                                              PLEASE REFER TO THE README FILE FOR AN REFERENCES                                            ?--
--!                                                                                                                                           !--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--

