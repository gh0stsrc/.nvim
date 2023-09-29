# NeoVim Config 

This is a simple but useful setup for neovim, it will continue to grow overtime.

**Disclaimer:** This configuration and the instructions outlined, were implemented on a `Ubuntu 23.04 (Lunar Lobster)` system, instructions may need to be tailored for other linux distributions.

#### Have Fun!

---
### Plugin Inventory

- [packer.nvim](https://github.com/wbthomason/packer.nvim):
  - `packer` is plugin/package manager for neovim

- [gruvbox](https://github.com/morhetz/gruvbox)
  - `gruvbox` is a neovim theme heavily inspired by badwolf, jellybeans and solarized

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - `treesitter` is a parser generator tool and an incremental parsing library
    It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited
  - **_nvim-treesitter is required for IDE functionality such as parsing, syntax highlighting, code analysis and   incremental selection_**

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - `telescope` is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core
    - <code style="color : red"><b>IMPORTANT</b></code>
      - <code style="color : red">`telescope` is a`chatgpt` dependency</code> 

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
  - `ripgrep`, also known as rg, is a line-oriented search tool that recursively searches your current directory for a regex pattern. It is developed by Andrew Gallant (also known by his GitHub handle BurntSushi) and is written in Rust. `ripgrep` is similar to other search tools like ack and ag (The Silver Searcher), but it is typically faster.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Speed_**: It is incredibly fast, owing to the efficient use of Rust's performance and safe regex library.
    - **_Respects your ignore type files_**: By default, `ripgrep` will respect your `.gitignore` and `.ignore` files, which means it won't search through the files and directories listed in those files.
    - **_Unicode Aware_**: It can handle Unicode characters and searches UTF-8 encoded files.
    - **_Supports a variety of file types_**: It can search through specific file types and exclude others.
    - **_Colorized Output_**: Provides colorized terminal output for better readability of results.
    - **_customization_**: Offers numerous flags to customize your searches.
  - <code style="color : red"><b>IMPORTANT</b></code> 
    - <code style="color : red">`ripgrep` is a telescope.nvim dependency. Depending on results from the `:checkhealth (nvim)` command, you may need to create a symbolic link for `rg`, where packer has installed it in a directory accessible via `$PATH`</code>

- [sharkdp/fd](https://github.com/sharkdp/fd)
  - `fd` is a fast and user-friendly alternative to the traditional find command that comes with Unix and Linux operating systems. Developed by David Peter (sharkdp), it's written in Rust, making it highly efficient and fast.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Simplicity_**: The syntax is simple and doesn’t require unnecessary flags by default.
    - **_Speed_**: Typically faster than the traditional find command, especially for larger searches.
    - **_User-friendly_**: Results are colorized by default, and it uses smart case search.
    - **_Respects your ignore type files_**: Just like `ripgrep`, `fd` respects `.gitignore` files, which helps in excluding unwanted files and directories from the search.
    - **_Regex Support_**: Supports regular expression searches.
    - **_Unicode Support_**: It handles Unicode characters well.
    - **_Customizable_**: Provides various options and flags for customization.
  - <code style="color : red"><b>IMPORTANT</b></code> 
    - <code style="color : red">`fd` is a telescope.nvim dependency.</code>
      - <code style="color : red">Depending on results from the `:checkhealth` command (nvim), you may need to install `fd-find` globally. This can be done via `sudo apt install fd-find` and creation of a symbolic link to shadow existing implementations of `fd`, via `ln -s $(which fdfind) ~/.local/bin/fd`.</code>
      - <code style="color : red">Ensure that `$HOME/.local/bin` is in your `$PATH`.</code>

- [jackMort/ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim)
  - `ChatGPT` is a Neovim plugin that allows you to effortlessly utilize the OpenAI ChatGPT API, empowering you to generate natural language responses from OpenAI's ChatGPT directly within the editor in response to your inquiries.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Interactive Q&A_**: Engage in interactive question-and-answer sessions with the powerful gpt model (ChatGPT) using an intuitive interface.
    - **_Persona-based Conversations_**: Explore various perspectives and have conversations with different personas by selecting prompts from Awesome ChatGPT Prompts.
    - Code Editing Assistance: Enhance your coding experience with an interactive editing window powered by the gpt model, offering instructions tailored for coding tasks.
    - **_Code Completion_**: Enjoy the convenience of code completion similar to GitHub Copilot, leveraging the capabilities of the gpt model to suggest code snippets and completions based on context and programming patterns.
    - **_Customizable Actions_**: Execute a range of actions utilizing the gpt model, such as grammar correction, translation, keyword generation, docstring creation, test addition, code optimization, summarization, bug fixing, code explanation, Roxygen editing, and code readability analysis. Additionally, you can define your own custom actions using a JSON file.

- [MunifTanjim/nui.nvim"](https://github.com/MunifTanjim/nui.nvim)
  - `nui` is a plugin for Neovim, and it's a highly customizable UI component framework based on Lua. This plugin aims to provide developers with components such as prompts, menus, and dialogs to help build interactive user interfaces within Neovim.
  - <code style="color : red"><b>IMPORTANT</b></code> 
    - <code style="color : red">`nui.nvim` is a`chatgpt` dependency</code> 

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - `plenary` is a neovim library that provides lua functions required for the development and use of neovim plugins
    - <code style="color : red"><b>IMPORTANT</b></code> 
      - <code style="color : red">`plenary` is a `nvim-telescope` and `chatgpt` dependency</code> 

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - `lualine` is a blazing fast and easy to configure neovim statusline written in Lua.

- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
  - `nvim-web-devicons` is a lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
  - **_nvim-web-devicons is an optional dependency of nvim-lualine_**

- [fatih/vim-go](https://github.com/fatih/vim-go)
  -`vim-go` is a plugin for the Vim text editor, specifically aimed at providing an enhanced environment for developing Go.
    the plugin is developed to augment Vim with Go development features and tools, enabling a powerful and integrated workflow for Go development within the Vim environment.

- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
  - `nvim-dap` is a generic protocol for neovim that will interface with various debuggers. dap allows you to:
    - launch an application to debug
    - attach to running applications and debug them
    - set breakpoints and step through code
    - inspect the state of the application

- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
  - `dapui` is a User Interface (UI) for nvim-dap which provides a good out of the box configuration.

- [leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)
  - `nvim-dap-go` is an extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests.

- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
  - `folke/neodev` setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  - It is highly recommended to use neodev.nvim to enable type checking for nvim-dap-ui to get type checking,   documentation and autocompletion for all API functions.

- [mortepau/codicons.nvim](https://github.com/mortepau/codicons.nvim)
  - `codicons` is a small library containing the codicons from VS Code and some functions to simplify the usage of them.
  - <code style="color : red"><b>IMPORTANT</b></code> 
    - <code style="color : red">codicons is a dependency of dapui, which leverages codicons as part of the UI's debugger pane; PLEASE REFER TO [REFERENCES SECTION](#references) FOR HOW TO PATCH THIS FONT</code>
    
- [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
  - `lsp-zero.nvim` is a collection of functions that will help you setup Neovim's LSP client, so you can get IDE-like features with minimum effort.
  - out of the box it will help you integrate nvim-cmp (an autocompletion plugin) and nvim-lspconfig (a collection of configurations for various LSP servers).

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - `nvim-lspconfig` is a configuration utility for the built-in Language Server Protocol (LSP) client for neovim. 
  - the Language Server Protocol is a standard for implementing programming language smart features, such as autocompletion, go to definition, and find references, by using language servers that communicate with development environment editors and IDEs.

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  - `mason` is a neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.

- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - `mason-lspconfig` bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
  - `mason-lspconfig`.nvim closes some gaps that exist between `mason` and `lspconfig`. 
  - `mason-lspconfig`'s main responsibilities are to:
    - register a setup hook with lspconfig that ensures servers installed with mason.nvim are set up with the necessary configuration
    - provide extra convenience APIs such as the :LspInstall command
    - allow you to (i) automatically install, and (ii) automatically set up a predefined list of servers
    - translate between lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)

  - <code style="color : red"><b>IMPORTANT</b></code>  <code style="color : red">this plugin uses the lspconfig server names in the APIs it exposes - not mason.nvim package names. [See this table for a complete mapping](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md)</code>

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - `nvim-cmp` is a Neovim plugin developed by hrsh7th that provides a powerful and extensible auto-completion framework for Neovim. it is designed to be a completion engine for Neovim and is part of the Neovim ecosystem that has grown around its native support for the Language Server Protocol (LSP).

- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
  - `cmp-nvim-lsp` is a source (or completion provider) for the `hrsh7th/nvim-cmp` completion framework, specifically designed to integrate with Neovim's built-in LSP (Language Server Protocol) client. The LSP client communicates with language servers to provide intelligent code completion, diagnostics, and other language features.
  - `cmp-nvim-lsp` allows nvim-cmp to provide completion suggestions based on the information provided by the LSP, like variable names, methods, functions, and more relevant to the programming language you are working with.

- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
  - `cmp-buffer` is another source for the hrsh7th/nvim-cmp completion framework. While hrsh7th/cmp-nvim-lsp provides completion suggestions from Neovim’s built-in Language Server Protocol (LSP) client, cmp-buffer provides completion suggestions from the content of the currently open buffers.
  - This means that cmp-buffer will suggest words and phrases that exist in your currently open buffers, regardless of whether they are recognized as symbols or identifiers by a language server. This can be useful when working with any kind of text, not just code, as it can suggest completions based on what you have already typed or have open in another buffer.

- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
  - `cmp-path` is another source plugin for the `hrsh7th/nvim-cmp` completion framework in Neovim. This source, `cmp-path`, provides completion suggestions for file paths.
  - When you are typing in a file path, cmp-path will suggest completions based on the file and directory names in your filesystem, making it easier to reference or include files in your project without having to remember or type out the full, exact paths.

- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
  - `cmp_luasnip` is a source plugin for the `hrsh7th/nvim-cmp` completion framework in Neovim. This plugin integrates `Luasnip` with `nvim-cmp`, allowing `Luasnip` snippets to be provided as completion items.
  - `Luasnip` is a fast, extensible snippet engine for Neovim. It allows users to define snippets of code or text that can be inserted into their code with various placeholders and transformations to speed up the coding process.
  - by integrating `Luasnip` with `nvim-cmp` through `saadparwaiz1/cmp_luasnip`, users can access their snippets directly from the auto-completion menu provided by `nvim-cmp`, making it even more convenient to use snippets while coding.

- [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
  - `cmp-nvim-lua` is another source plugin for the `hrsh7th/nvim-cmp` auto-completion framework for Neovim. As the name suggests, cmp-nvim-lua provides Lua-specific completions, likely based on the Lua runtime and libraries available within the Neovim environment.
  - This means that when you're writing Lua code, particularly when you're working with your Neovim configuration (which is commonly written in Lua), this source will provide autocompletion suggestions relevant to the Lua language and Neovim’s Lua API.

- [L3MON4D3/Luasnip](https://github.com/L3MON4D3/LuaSnip)
  - `Luasnip` is a snippet engine plugin for Neovim. It's a Lua-based, fast, and extensible snippet solution for Neovim that allows you to define and insert snippets of text quickly, enhancing coding efficiency. Snippets are small pieces of reusable code or text that you can insert into your files, and they often have placeholders that you can jump between and fill out.

- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
  - `friendly-snippets` is a collection of snippets that are meant to be used with snippet engines available for Neovim, like L3MON4D3/Luasnip, hrsh7th/vim-vsnip, and others. It's a community-driven collection, and it aims to provide a rich set of pre-made snippets for various programming languages, frameworks, and libraries, allowing developers to enhance their coding efficiency.

- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
  - `toggleterm` is a Neovim plugin written in Lua, designed to help manage terminal windows within Neovim. The plugin allows users to toggle Neovim's built-in terminal easily, meaning you can show or hide the terminal window with a single command or key mapping.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Toggle Mechanism_**: Allows you to easily toggle between the terminal and your regular Neovim window
    - **_Multiple Terminals_**: Supports managing multiple terminals and provides commands to navigate between them
    - **_Persistent Layout_**: Terminals can maintain their size and layout between toggles
    - **_Customization_**: It can be customized to fit your needs, including custom commands, size, and direction preferences
    - **_Integration_**: Works well with other Neovim plugins and follows Neovim's conventions for terminal windows

- [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment)
  - `nvim-comment` is a Neovim plugin written in Lua, which provides an easy and efficient way to comment out lines of code in multiple programming languages. Commenting is a common task in coding, and this plugin helps automate and streamline the process.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Single and Multi-line Commenting_**: The plugin allows users to comment out both single and multiple lines of code
    - **_Nested Commenting_**: Supports nested commenting in languages that have appropriate syntax for it
    - **_Toggling Comments_**: It offers a toggle feature that allows users to either comment or uncomment lines depending on their current state
    - **_Custom Comment Strings_**: Users can configure custom comment strings for different filetypes
    - **_Performance_**: Being written in Lua, it is more performance-efficient for Lua-based Neovim setups

- **jhlgns/naysayer88.vim** - No Git Link
  -  `naysayer88.vim` is a vim/nvim colorscheme

- [CreaturePhil/vim-handmade-hero](https://github.com/CreaturePhil/vim-handmade-hero)
  -  `vim-handmade-hero` is a vim/nvim colorscheme

---
### Language Severs, LSPs, Linters & Formatters

- [bash-language-server (bashls)](https://github.com/bash-lsp/bash-language-server)
  - `bash-language-server` is a language server for Bash, implemented by the bash-lsp project.

- [dockerfile-language-server (dockerls)](https://github.com/rcjsuen/dockerfile-language-server-nodejs)
  -  `dockerfile-language-server` is a language server implementation for Dockerfiles, written in TypeScript.
  
- eslint-lsp (eslint) - No Git Link
  - `eslint-lsp` refers to the integration of ESLint with Language Server Protocol (LSP). ESLint is a widely-used tool in the JavaScript (and TypeScript) community for identifying and fixing problems in your code, and it’s commonly integrated into development workflows to improve code quality and maintain coding standards

- [gopls](https://github.com/golang/tools/tree/master/gopls)
  - `gopls` (pronounced "go please") is the official language server for the Go programming language. It's developed by the Go team, and it provides IDE-like features to text editors and integrated development environments (IDEs) that support the Language Server Protocol (LSP).

- [helm-ls (helm_ls)](https://github.com/mrjosh/helm-ls)
  - `helm-ls` is an implementation of a Language Server Protocol (LSP) for the Helm templating language.
    
- [pyright](https://github.com/microsoft/pyright)
  - `pyright` is a static type checker and LSP for Python, developed by Microsoft. It is designed to address Python’s dynamic typing by using static type annotations, allowing developers to catch type errors before runtime, improve code quality, and enhance developer productivity. It is written in TypeScript and runs on Node.js.

- [terraform-ls (terraformls)](https://github.com/hashicorp/terraform-ls)
  - `terraform-ls` is the official Language Server Protocol (LSP) implementation for Terraform, developed by HashiCorp.

- [typescript-language-server (tsserver)](https://github.com/typescript-language-server/typescript-language-server)
  - `typescript-language-server` is an implementation of the Language Server Protocol (LSP) for TypeScript. It's built on top of the TypeScript compiler to provide rich language features, like auto-completions and diagnostics, to editors and Integrated Development Environments (IDEs) that support the LSP.

- [rust-analyzer (rust_analyzer)](https://github.com/rust-lang/rust-analyzer)
  - `rust-analyzer` is an implementation of a Language Server Protocol (LSP) for the Rust programming language. It is developed by the Rust community with the intention of making it the official Rust language server, eventually replacing the Rust Language Server (RLS).

---
### Nvim Config Installation Prerequisites

**Nvim Clipboard Provider Related**

  Neovim has no direct connection to the system clipboard. Instead it depends on a _provider_ which transparently uses shell commands to communicate with the system clipboard or any other clipboard backend 

  - The clipboard experience varies depending on if you are using a headless version of a linux distribution or one that supports a GUI.
    - **`XServer/GUI`:**
      - if you are using a linux distro that has a GUI compoment, you can leverage a more robust and user friendly clipboard provider like `xclip` or `xsel`.
      - The presence of a working clipboard tool such as  `xclip` or `xsel` will implictly enable the `+` and `*` registers. Basically just install xclip and neovim will automatically boostrap the clipboard provider allowing for automatiic integration.
      
    - **`Headless Linux Server`:**
      -  ATM the current config really only supports `tmux` as a clipboard provider for headless linux distros. Clipboard providers such as `xclip` and `xsel` will not function as there is no 'display' to hook into (XServer is not present), thus are not viable options.
      - if you are feeling savy, feel free into into other supported clipboard providers, which can support SSH forwarding and other functionality for headless
      linux servers.

  - It should be noted that the default behavior for `neovim` when it is invoked within a tmux session is to use the `tmux` _clipboard proivder_, unless a more suitable _provider_ is already installed (e.g. `xclip`, `xsel`).
    - If you want to use `tmux` as the clipboard provider regardless if you already have another clipboard provider installed, you can set the `NVIM_CLIP` environment variable to `tmux` in your respective rc file.
      ```bash
      # entry in your repsective rc file (e.g. ~/.bashrc)
      export NVIM_CLIP="tmux"
      ```

  - If you want nothing to do with the clipboard setup, ignore related config errors and allow neovim to implicitly handle things (which also could mean doing nothing), simply set the `NVIM_SKIP_CLIP` env var to `true` in your respective rc file.
    ```bash
    # entry in your repsective rc file (e.g. ~/.bashrc)
    export NVIM_SKIP_CLIP=true
    ```

  - to see more details regarding how neovim clipboard providers integrate with neovim and their respective functions, issue the `:help g:clipboard` command 

**Telescope Nvim Plugin Related**
  - `telescope` depends on [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) for grep-like operations.
    -  the easiest way to deal with this is to install `ripgrep` system wide
      - `sudo apt-get install ripgrep`
    - **_OTHERWISE_**, when you run the `PackerInstall` command, `ripgrep` will automatically be installed via `packer`; as it is included in the `packer` setup config. HOWEVER, you will need to make the binary accessible to `$PATH`.
      - <code style="color : red"><b>IMPORTANT</b></code> 
        - <code style="color : red"> you will need to include the full path of where the `ripgrep` binary was installed in `$PATH`</code> 
  
  - `telescope` **_optionally_** depends on [sharkdp/fd](https://github.com/sharkdp/fd) for file finding functionality.
    -  the easiest way to deal with this is to install `fd-find` system wide
      - `sudo apt-get install fd-find`
      - after successful installation, you will also need to create a _symbolic link_ to for `fd-find`, to be available for use as expected in documentation and by nvim plugins (i.e. called by `fd` and not `fdfind`).
        - `ln -s $(which fdfind) ~/.local/bin/fd`
          - Ensure that `$HOME/.local/bin` is in your `$PATH`.

**Treesitter Nvim Plugin Related**
  - if you encounter any parser-related errors when excuting the `:checkhealth` command in neovim, do not be alarmed. This is most likely caused by the tresitter pareser components wither missing on intial install or update to the `"nvim-treesitter.configs"` setup; to resolve this run the following command 
    - `:TSUpdate`
    -  [Please see a related Github issue for more details](https://github.com/LunarVim/LunarVim/issues/3680#issuecomment-1372345560)

**Python Related**
  - If you will be using the Python LSP, you may notice a number of warnings related to Python when you execute the `:checkhealth` command in neovim. These warnings should be recommend optional resolutions; however, if the issues no longer are optional or if you encounter issues with the Python env or LSP, Install the follow modules globally and address any other issues raised:
    - **`pythonX-pip`:**
      ```bash
      # install pip module for python3 at the system level
      sudo apt install python3_pip
      ```
    - **`pythonX-neovim`:**
      ```bash
      # install the neovim module for python3 at the system level
      sudo apt install python3_neovim
      ```

**ChatGPT Nvim Plugin Related**
  - If you would like use the `jackMort/ChatGPT.nvim` plugin to integrate neovim with the OpenAI's ChatGPT, there are a couple of prerequisites
    - you will need a valid OpenAI API Key
    - you will have to securely store said key - this will dictate how you configure the `chatgpt` setup config
      - if you would like to leverage an enviornment variable (env var), create an env var named `OPENAI_API_KEY` in your respective shell's _rc_ (i.e. Run Commands) file.
        - e.g.) `export OPENAI_API_KEY={SECRET_KEY}`
      - **_OTHERWISE_**, you can leverage password manager or keystore to store the API key and have the `chatgpt` plugin retrieve it a system command.
        - if you decide to go down this route, you will need to update the `chatgpt` setup config to invoke a command under the `api_key_cmd` config field. Examples below: <br /><br />

          The following configuration would use 1Passwords CLI, `op`, to fetch the API key from the `credential` field of the `OpenAI` entry.

          ```lua
          require("chatgpt").setup({
            -- example using the 1Password Secret Store CLI
            api_key_cmd = "op read op://private/OpenAI/credential --no-newline"
          })
          ```
          The following configuration would use `GPG` to decrypt a local file containing the
          API key.

          ```lua
          local home = vim.fn.expand("$HOME")
          require("chatgpt").setup({
              -- example using GPG
              api_key_cmd = "gpg --decrypt " .. home .. "/secret.txt.gpg"
          })
          ```

---
### Nvim Config Validation

After addressing [Nvim Config Installation Prerequisites](#nvim-config-installation-prerequisites), you should check the overall status of your neovim setup by excuting the `:checkhealth` command

The `:checkhealth` command runs a series of diagnostic tests to check the health of your Neovim installation. If it uncovers any problems, it usually offers suggestions on how to fix them, or where to go to learn more.

If you find and relvant `Warnings` which may impact your nvim setup or experience, OR any `Errors`, follow the guidance provide and address their resolution accordingly.

---
### References

- [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol)

- [Neovim LSP client configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

- [Codicons](https://github.com/microsoft/vscode-codicons)
  - codicons is a dependency of dapui, which leverages codicons as part of the UI's debugger pane
  - the codicon font will required to be patched by tools like nerd-fonts' font-patcher; possibly in conjunction with fontforge. 
  - patching is required for successful rending of codicon fonts in the terminal
  - once a font is patched, move the respective .ttf file to the running user's font dir (e.g. `/home/{USER}/.local/share/fonts`)
  - **_How to Patch Fonts_**:
    - https://github.com/mortepau/codicons.nvim#how-to-patch-fonts
    - https://github.com/ryanoasis/nerd-fonts#option-9-patch-your-own-font
