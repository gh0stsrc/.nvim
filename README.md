# nvim config

This is a simple but useful setup for neovim, it will continue to grow overtime as more...


### Plugin Inventory

- [packer.nvim](https://github.com/wbthomason/packer.nvim):
  - plugin/package manager for neovim

- [gruvbox](https://github.com/morhetz/gruvbox)
  - gruvbox is a neovim theme heavily inspired by badwolf, jellybeans and solarized

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - tree-sitter is a parser generator tool and an incremental parsing library
    It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited
  - **_nvim-treesitter is required for IDE functionality such as parsing, syntax highlighting, code analysis and   incremental selection_**

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - neovim library that provides lua functions required for the developement and use of neovim plugins
    - **_plenary is an nvim-telescope dependency_**

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - lualine is a blazing fast and easy to configure neovim statusline written in Lua.

- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
  - a lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
  - **_nvim-web-devicons is an optional dependency of nvim-lualine_**

- [fatih/vim-go](https://github.com/fatih/vim-go)
  - a plugin for the Vim text editor, specifically aimed at providing an enhanced environment for developing Go.
    the plugin is developed to augment Vim with Go development features and tools, enabling a powerful and integrated workflow for Go development within the Vim environment.

- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
  - nvim-dap is a generic protocol for neovim that will interface with various debuggers. dap allows you to:
    - launch an application to debug
    - attach to running applications and debug them
    - set breakpoints and step through code
    - inspect the state of the application

- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
  - dapui is a User Interface (UI) for nvim-dap which provides a good out of the box configuration.

- [leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)
  - nvim-dap-go is an extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests.

- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
  - neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  - It is highly recommended to use neodev.nvim to enable type checking for nvim-dap-ui to get type checking,   documentation and autocompletion for all API functions.

- [mortepau/codicons.nvim](https://github.com/mortepau/codicons.nvim)
  - a small library containing the codicons from VS Code and some functions to simplify the usage of them.
  - IMPORTANT:
    - codicons is a dependency of dapui, which leverages codicons as part of the UI's debugger pane; PLEASE REFER TO REFERENCES SECTION FOR HOW TO PATCH THIS FONT

- [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
  - collection of functions that will help you setup Neovim's LSP client, so you can get IDE-like features with minimum effort.
  - out of the box it will help you integrate nvim-cmp (an autocompletion plugin) and nvim-lspconfig (a collection of configurations for various LSP servers).

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - neovim/nvim-lspconfig is a configuration utility for the built-in Language Server Protocol (LSP) client for neovim. - the Language Server Protocol is a standard for implementing programming language smart features, such as autocompletion, go to definition, and find references, by using language servers that communicate with development environment editors and IDEs.

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  - mason.nvim is a neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.

- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
  - mason-lspconfig.nvim closes some gaps that exist between mason.nvim and lspconfig. Its main responsibilities are to:
    - register a setup hook with lspconfig that ensures servers installed with mason.nvim are set up with the necessary configuration
    - provide extra convenience APIs such as the :LspInstall command
    - allow you to (i) automatically install, and (ii) automatically set up a predefined list of servers
    - translate between lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)

  - IMPORTANT: Note: this plugin uses the lspconfig server names in the APIs it exposes - not mason.nvim package names.
    See this table for a complete mapping- > https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - is a Neovim plugin developed by hrsh7th that provides a powerful and extensible auto-completion framework for Neovim. it is designed to be a completion engine for Neovim and is part of the Neovim ecosystem that has grown around its native support for the Language Server Protocol (LSP).

- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
  - cmp-nvim-lsp is a source (or completion provider) for the hrsh7th/nvim-cmp completion framework, specifically designed to integrate with Neovim's built-in LSP (Language Server Protocol) client. The LSP client communicates with language servers to provide intelligent code completion, diagnostics, and other language features.
  - cmp-nvim-lsp allows nvim-cmp to provide completion suggestions based on the information provided by the LSP, like variable names, methods, functions, and more relevant to the programming language you are working with.

- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
  - cmp-buffer is another source for the hrsh7th/nvim-cmp completion framework. While hrsh7th/cmp-nvim-lsp provides completion suggestions from Neovim’s built-in Language Server Protocol (LSP) client, cmp-buffer provides completion suggestions from the content of the currently open buffers.
  - This means that cmp-buffer will suggest words and phrases that exist in your currently open buffers, regardless of whether they are recognized as symbols or identifiers by a language server. This can be useful when working with any kind of text, not just code, as it can suggest completions based on what you have already typed or have open in another buffer.

- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
  - cmp-path is another source plugin for the hrsh7th/nvim-cmp completion framework in Neovim. This source, cmp-path, provides completion suggestions for file paths.
  - When you are typing in a file path, cmp-path will suggest completions based on the file and directory names in your filesystem, making it easier to reference or include files in your project without having to remember or type out the full, exact paths.

- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
  - cmp_luasnip is a source plugin for the hrsh7th/nvim-cmp completion framework in Neovim. This plugin integrates Luasnip with nvim-cmp, allowing Luasnip snippets to be provided as completion items.
  - 'luasnip' is a fast, extensible snippet engine for Neovim. It allows users to define snippets of code or text that can be inserted into their code with various placeholders and transformations to speed up the coding process.
  - by integrating Luasnip with nvim-cmp through saadparwaiz1/cmp_luasnip, users can access their snippets directly from the auto-completion menu provided by nvim-cmp, making it even more convenient to use snippets while coding.

- [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
  - cmp-nvim-lua is another source plugin for the hrsh7th/nvim-cmp auto-completion framework for Neovim. As the name suggests, cmp-nvim-lua provides Lua-specific completions, likely based on the Lua runtime and libraries available within the Neovim environment.
  - This means that when you're writing Lua code, particularly when you're working with your Neovim configuration (which is commonly written in Lua), this source will provide autocompletion suggestions relevant to the Lua language and Neovim’s Lua API.

- [L3MON4D3/Luasnip](https://github.com/L3MON4D3/LuaSnip)
  - Luasnip is a snippet engine plugin for Neovim. It's a Lua-based, fast, and extensible snippet solution for Neovim that allows you to define and insert snippets of text quickly, enhancing coding efficiency. Snippets are small pieces of reusable code or text that you can insert into your files, and they often have placeholders that you can jump between and fill out.

- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
  - friendly-snippets is a collection of snippets that are meant to be used with snippet engines available for Neovim, like L3MON4D3/Luasnip, hrsh7th/vim-vsnip, and others. It's a community-driven collection, and it aims to provide a rich set of pre-made snippets for various programming languages, frameworks, and libraries, allowing developers to enhance their coding efficiency.

- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
  - toggleterm.nvim is a Neovim plugin written in Lua, designed to help manage terminal windows within Neovim. The plugin allows users to toggle Neovim's built-in terminal easily, meaning you can show or hide the terminal window with a single command or key mapping.
  - features:
    - Toggle Mechanism: Allows you to easily toggle between the terminal and your regular Neovim window
    - Multiple Terminals: Supports managing multiple terminals and provides commands to navigate between them
    - Persistent Layout: Terminals can maintain their size and layout between toggles
    - Customization: It can be customized to fit your needs, including custom commands, size, and direction preferences
    - Integration: Works well with other Neovim plugins and follows Neovim's conventions for terminal windows

- [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment)
  - nvim-comment is a Neovim plugin written in Lua, which provides an easy and efficient way to comment out lines of code in multiple programming languages. Commenting is a common task in coding, and this plugin helps automate and streamline the process.
  - features:
    - Single and Multi-line Commenting: The plugin allows users to comment out both single and multiple lines of code
    - Nested Commenting: Supports nested commenting in languages that have appropriate syntax for it
    - Toggling Comments: It offers a toggle feature that allows users to either comment or uncomment lines depending on their current state
    - Custom Comment Strings: Users can configure custom comment strings for different filetypes
    - Performance: Being written in Lua, it is more performance-efficient for Lua-based Neovim setups

- **jhlgns/naysayer88.vim** - No Git Link
  -  naysayer88.vim is vim/nvim colorscheme

- [CreaturePhil/vim-handmade-hero](https://github.com/CreaturePhil/vim-handmade-hero)
  -  vim-handmade-hero is vim/nvim colorscheme


### Language Severs, LSPs, Linters & Formatters

- [bash-language-server (bashls)](https://github.com/bash-lsp/bash-language-server)
  - bash-language-server is a language server for Bash, implemented by the bash-lsp project.

- [dockerfile-language-server (dockerls)](https://github.com/rcjsuen/dockerfile-language-server-nodejs)
  -  dockerfile-language-server is a language server implementation for Dockerfiles, written in TypeScript.
  
- **eslint-lsp (eslint)** - No Git Link
  - eslint-lsp refers to the integration of ESLint with Language Server Protocol (LSP). ESLint is a widely-used tool in the JavaScript (and TypeScript) community for identifying and fixing problems in your code, and it’s commonly integrated into development workflows to improve code quality and maintain coding standards

- [gopls](https://github.com/golang/tools/tree/master/gopls)
  - gopls (pronounced "go please") is the official language server for the Go programming language. It's developed by the Go team, and it provides IDE-like features to text editors and integrated development environments (IDEs) that support the Language Server Protocol (LSP).

- [helm-ls (helm_ls)](https://github.com/mrjosh/helm-ls)
  - helm-ls is helm language server protocol LSP.
    
- [pyright](https://github.com/microsoft/pyright)
  - microsoft/pyright is a static type checker and LSP for Python, developed by Microsoft. It is designed to address Python’s dynamic typing by using static type annotations, allowing developers to catch type errors before runtime, improve code quality, and enhance developer productivity. It is written in TypeScript and runs on Node.js.

- [terraform-ls (terraformls)](https://github.com/hashicorp/terraform-ls)
  - hashicorp/terraform-ls is the official Language Server Protocol (LSP) implementation for Terraform, developed by HashiCorp.

- [typescript-language-server (tsserver)](https://github.com/typescript-language-server/typescript-language-server)
  - The typescript-language-server is an implementation of the Language Server Protocol (LSP) for TypeScript. It's built on top of the TypeScript compiler to provide rich language features, like auto-completions and diagnostics, to editors and Integrated Development Environments (IDEs) that support the LSP.

- [rust-analyzer (rust_analyzer)](https://github.com/rust-lang/rust-analyzer)
  - rust-lang/rust-analyzer is an implementation of a Language Server Protocol (LSP) for the Rust programming language. It is developed by the Rust community with the intention of making it the official Rust language server, eventually replacing the Rust Language Server (RLS).


### References

- [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol)

- [Neovim LSP client configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

- [Codicons](https://github.com/microsoft/vscode-codicons)
  - codicons is a dependency of dapui, which leverages codicons as part of the UI's debugger pane
  - the codicon font will required to be patched by tools like nerd-fonts' font-patcher; possibly in conjunction with fontforge. 
  - patching is required for successful rending of codicon fonts in the terminal
  - once a font is patched, move the respective .ttf file to the running user's font dir (e.g. /home/{USER}/.local/share/fonts)
  - **_How to Patch Fonts_**:
    - https://github.com/mortepau/codicons.nvim#how-to-patch-fonts
    - https://github.com/ryanoasis/nerd-fonts#option-9-patch-your-own-font
