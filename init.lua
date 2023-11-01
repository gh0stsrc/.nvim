--
---  ███╗   ██╗███████╗ ██████╗ ████████╗███████╗██╗   ██╗███████╗███████╗
---  ████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██╔════╝██║   ██║██╔════╝╚══███╔╝
---  ██╔██╗ ██║█████╗  ██║   ██║   ██║   █████╗  ██║   ██║███████╗  ███╔╝ 
---  ██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══╝  ██║   ██║╚════██║ ███╔╝  
---  ██║ ╚████║███████╗╚██████╔╝   ██║   ███████╗╚██████╔╝███████║███████╗
---  ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝ ╚══════╝╚══════╝
---
--- Version : v2.0.0
--- NOTE    : Comments have been extended by the use of `folke/todo-comments.nvim`. Tagged comments are enriched with color highlighting, distinct icons and are searchable via commands and key-bindings, throughout open buffers and
---           the entire project workspace.
---
---           [LEGEND]:
---             - IMPORTANT:
---               - Important information which should be understood
---             - NOTE:
---               - Information that is considered to be noteworthy 
---             - TODO:
---               - More stuff to do 
---             - HACK:
---               - Sus code (smooth brain stuff)
---             - BUG:
---               - Logical bug (also can be tagged using FIX)
---             - WARN:
---               - Possible issues or concerns
---             - TEST:
---               - Testing
---             - PERF:
---               - Performance optimization
---             - --:
---               - Regular Comment           


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                               Packer Setup & Bootstrapping                                               ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- import helper functions
local Helpers = require("utils.helpers")

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
  --* -------------------------------------------------------------- --*
  --   NOTE: place plugins which you desire packer to install below
  --* -------------------------------------------------------------- --*

  --* The Gruvbox color scheme is known for its warm and retro-inspired color palette, which many developers find visually pleasing and comfortable for coding. It often includes variations for different languages and file types to make syntax highlighting more readable and aesthetically pleasing
  use { "ellisonleao/gruvbox.nvim" }

  --* plugin to integrate the treesitter parsing lib into neovim
  use( "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  --* highly extendable fuzzy finder
  use {
    "nvim-telescope/telescope.nvim", tag = "*",  -- IMPORTANT: telescope was previously hard tagged to `v0.1.3`, performing testing with the latest verison; revert if you encounter issues
    requires = {
      { "nvim-lua/plenary.nvim" },  -- Required  -- neovim library that provides lua functions required for the development and use of various neovim plugins
      { "BurntSushi/ripgrep" },     -- Required  -- line-oriented search tool that recursively searches your current directory for a regex pattern
      { "sharkdp/fd" }              -- Optional  -- fast and user-friendly alternative to the traditional find command that comes with Unix and Linux operating systems
    }
  }

  --* neovim statusline plugin written in Lua 
  use {
    "nvim-lualine/lualine.nvim",
     requires = { "nvim-tree/nvim-web-devicons" } -- Required  -- `lualine` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)
                                                                  -- IMPORTANT: `nvim-web-devicons` requires a patched font to function on most terminals; see plugin configuration section for details
  }

  --* go language integration plugin for vim
  use { "fatih/vim-go" }

  --* neovim User Interface (UI) plugin for the neovim Debug Adapter Protocol (DAP)
  use { "rcarriga/nvim-dap-ui",
    requires = {
      { "mfussenegger/nvim-dap" },  -- Required  -- neovim DAP plugin
      { "folke/neodev.nvim" },      -- Required  -- setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
      { "mortepau/codicons.nvim" }  -- Required  -- `nvim-dap-ui` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `codicons.nvim` to map the fonts (default or custom)
                                                     -- IMPORTANT: this font requires to be patched to be properly processed by most terminals; see plugin configuration section
    }
  }

  --* plugin designed to integrate Go (the programming language) debugging capabilities with Neovim, leveraging the `nvim-dap` framework
  use { "leoluz/nvim-dap-go"}

  --* a collection of functions that will help you setup Neovim's LSP client, so you can get IDE-like features with minimum effort
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x", -- IMPORTANT: currently testing `v3.x`; may have to revert back to `v2.x` if issues arise 
    requires = {
      { "neovim/nvim-lspconfig" },              -- Required  -- a configuration utility for the built-in Language Server Protocol (LSP) client for neovim
      { "williamboman/mason.nvim" },            -- Optional  -- is a neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface
      { "williamboman/mason-lspconfig.nvim" },  -- Optional  -- bridges `mason.nvim` with the `lspconfig` plugin, making it easier to use both plugins together
      { "hrsh7th/nvim-cmp" },                   -- Required  -- a neovim plugin that provides a powerful and extensible auto-completion framework for neovim (e.g. LSP auto-completion)
      { "hrsh7th/cmp-nvim-lsp" },               -- Required  -- is a source (or completion provider) for the `nvim-cmp` completion framework, specifically designed to integrate with Neovim's built-in LSP client
      { "hrsh7th/cmp-buffer" },                 -- Optional  -- another source plugin for the `nvim-cmp` completion framework. While `cmp-nvim-lsp` provides completion suggestions from neovim’s built-in LSP client, cmp-buffer provides completion suggestions from the content of currently open buffers
      { "hrsh7th/cmp-path" },                   -- Optional  -- another source plugin for the `nvim-cmp` completion framework. `cmp-path` provides completion suggestions for file paths
      { "saadparwaiz1/cmp_luasnip" },           -- Optional  -- another source plugin for the `nvim-cmp` completion framework. This plugin integrates `Luasnip` with `nvim-cmp`, allowing `Luasnip` snippets to be provided as completion items
      { "hrsh7th/cmp-nvim-lua" },               -- Optional  -- another source plugin for the `nvim-cmp` completion framework. As the name suggests, `cmp-nvim-lua` provides Lua-specific completions
      { "L3MON4D3/LuaSnip" },                   -- Required  -- a snippet engine plugin for neovim. `LuaSnip` is Lua-based, fast, and extensible snippet solution that allows you to define and insert snippets of text quickly, enhancing coding efficiency.
      { "rafamadriz/friendly-snippets" },       -- Optional  -- a collection of snippets that are meant to be used with snippet engines available for Neovim, like `L3MON4D3/Luasnip`, `hrsh7th/vim-vsnip`, and others
    }
  }

  --* a plugin designed to help manage terminal windows within neovim. The plugin allows users to toggle neovim's built-in terminal easily, meaning you can show or hide the terminal window with a single command or key mapping
  use { "akinsho/toggleterm.nvim", tag = "*" }

  --* a plugin which provides an easy and efficient way to comment out lines of code in multiple programming languages.
  use { "numToStr/Comment.nvim" }

  --* plugin to enrich neovim with git signs (e.g. + for new lines)
  use { "lewis6991/gitsigns.nvim" }

  --* plugin that provides a side-by-side diff viewer for Git differences right inside Neovim. Offering a convenient way to visualize and navigate through changes in your Git repository without leaving your editor
  use {
    "sindrets/diffview.nvim",
    requires = {
      { "nvim-tree/nvim-web-devicons" } -- Required  -- `diffview` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)
                                                        -- IMPORTANT: `nvim-web-devicons` requires a patched font to function on most terminals; see plugin configuration section for details
    }
  }

  -- check if the env var `NVIM_ENABLE_GPT` is set to true; if so include the chatgpt plugin as part of the packer setup
  if Helpers.to_boolean(os.getenv("NVIM_ENABLE_GPT")) == true then
    use {
      "jackMort/ChatGPT.nvim",
      requires = {
        { "MunifTanjim/nui.nvim" },          -- Required  -- a plugin with a highly customizable UI component framework based on Lua
        { "nvim-lua/plenary.nvim" },         -- Required  -- neovim library that provides lua functions required for the development and use of various neovim plugins
        { "nvim-telescope/telescope.nvim" }  -- Required  -- `ChatGPT` levarages Telescope's fuzzy finder windows and previews
      },
    }
  end

  -- todo-comments provide enriched comments experience with color highlighting, distinct icons and are searchable via commands and key-bindings, throughout open buffers and the entire project workspace
  use {
    "folke/todo-comments.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },          -- Optional  -- required along with ripgrep for searching
      { "folke/trouble.nvim" },             -- Optional  -- required for the displaying of todo tags via telescope and nvims quickfix and location lists
      { "nvim-telescope/telescope.nvim" },  -- Optional  -- required for this neovim config, as I configured `todo-comments` to be used with Telescope's fuzzy finder windows and previews
    }
  }

  -- programmable splash screen/dashboard for neovim
  use {
      "goolord/alpha-nvim",
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }

  -- a clipboard manager for neovim inspired by clipmenu. It records everything that gets yanked in your vim session (up to a condifgurable limit), 
  -- you can then select an entry in the history using telescope or fzf-lua which then gets populated in a register of your choice.
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { "kkharji/sqlite.lua", module = "sqlite" },  -- Required  -- SQLite/LuaJIT binding and a highly opinionated wrapper for storing, retrieving, caching, and persisting SQLite databases.
      { "nvim-telescope/telescope.nvim" },          -- Required  -- required for this neovim config, as I configured `neoclip` to be used with Telescope's fuzzy finder windows and previews
      { "ibhagwan/fzf-lua" },                       -- Optional  -- fuzzy finder, which is NOT required of you are using `Telescope`
    },
  }

  -- plugin that provides a configurable and feature-rich buffer/tabline for managing open buffers.
  use {
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = { "nvim-tree/nvim-web-devicons" } -- Required  -- `bufferline` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)
                                                                  -- IMPORTANT: `nvim-web-devicons` requires a patched font to function on most terminals; see plugin configuration section for details
  }

  -- fancy, configurable, notification manager for NeoVim
  use { "rcarriga/nvim-notify" }

  -- marking buffers and blazingly fast navigation of buffers
  use {
    "ThePrimeagen/harpoon",
    requires = {
      { "nvim-lua/plenary.nvim" },         -- Required  -- neovim library that provides lua functions required for the development and use of various neovim plugins 
      { "nvim-telescope/telescope.nvim" }  -- Required  -- considered required for this neovim config, as I configured `harpoon` to be used with Telescope's fuzzy finder windows and previews
    }
  }

  -- blazingly fast search-based navigation within buffers
  use { "folke/flash.nvim" }

  -- autocompletion of paired symbols (e.g. {},(),[], ...)
  use { "windwp/nvim-autopairs" }

  -- toggable navigation pane plugin to explore project file structures 
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" }  -- Required  -- `nvim-tree` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)
                                                                  -- IMPORTANT: `nvim-web-devicons` requires a patched font to function on most terminals; see plugin configuration section for details
  }

  -- plugin to enhance the visibility of indentation levels
  use {
    "lukas-reineke/indent-blankline.nvim",
    requires = {
      { "nvim-treesitter/nvim-treesitter" },  -- Required  -- `nvim-treesitter` is required for language context-aware scope highlighting
    }
  }

  -- NOTE:  automatically set up the packer configuration after cloning `packer.nvim` (i.e. Packer self-bootstrapping)
  if packer_bootstrap then
    require("packer").sync()
  end
end)


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                               Plugin Specific Configurations                                             ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- import async logger 
local Logger = require("utils.logger")
-- import plenary's async lib to avoid using callbacks
local async = require("plenary.async")

-- IMPORTANT: load core first and foremost
require("core")

-- IMPORTANT: load plugins first before vim-core and extensions
require("plugins")

local welcome_msg = string.format("[ welcome %s ]", os.getenv("USER"))

-- welcome the user 
async.run(function() Logger.info(welcome_msg) end)

-- NOTE: import remaining modules
require("vim-core")
require("extensions")


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

