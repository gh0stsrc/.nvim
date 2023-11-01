```
    ███╗   ██╗███████╗ ██████╗ ████████╗███████╗██╗   ██╗███████╗███████╗
    ████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██╔════╝██║   ██║██╔════╝╚══███╔╝
    ██╔██╗ ██║█████╗  ██║   ██║   ██║   █████╗  ██║   ██║███████╗  ███╔╝ 
    ██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══╝  ██║   ██║╚════██║ ███╔╝  
    ██║ ╚████║███████╗╚██████╔╝   ██║   ███████╗╚██████╔╝███████║███████╗
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝ ╚══════╝╚══════╝
```

# NeoVim Config 

This is a simple but useful setup for neovim, it will continue to grow overtime.

**Disclaimer:** This configuration and the instructions outlined, were implemented on a `Ubuntu 23.04 (Lunar Lobster)` system using a `v0.9.2` neovim app image; instructions may need to be tailored for other linux distributions or neovim versions.

#### Have Fun!

---
### Plugin Inventory

- [packer.nvim](https://github.com/wbthomason/packer.nvim):
  - `packer` is plugin/package manager for neovim

- [gruvbox](https://github.com/morhetz/gruvbox)
  - `gruvbox`, the color scheme is known for its warm and retro-inspired color palette, which many developers find visually pleasing and comfortable for coding. It often includes variations for different languages and file types to make syntax highlighting more readable and aesthetically pleasing.

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
  - `alpha` a fast and fully programmable dashbboard plugin for neovim

- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
  - `bufferline` is a popular Neovim plugin that provides a customizable and feature-rich buffer/tabline for managing open buffers in Neovim. It enhances the visual representation of buffers in Neovim, making it easier to navigate and manage multiple open files.
  - <code style="color : blue"><b>Features</b></code>
    - **_Tabline Replacement_**: It replaces Neovim's default tabline with a more informative and visually appealing bufferline. This bufferline can display icons, buffer names, and other metadata for each open buffer.
    - **_Buffer Sorting_**: You can configure how buffers are sorted within the bufferline, whether it's based on the order of creation, file name, or other criteria.
    - **_Buffer Icons_**: bufferline.nvim supports displaying file icons next to buffer names, making it easier to identify file types.
    - **_Close Buttons_**: It allows you to add close buttons to individual buffers in the bufferline for easy buffer closing.
    - **_Customization_**: The plugin is highly customizable, allowing you to tailor the appearance and behavior of the bufferline to your preferences.
    - **_Integration with Other Plugins_**: It can integrate with other Neovim plugins, such as nvim-web-devicons for file icons and nvim-bufferline.lua for enhanced functionality.

- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
  - `indent-blankline.nvim` is a plugin is designed to enhance the visibility of indentation levels within your code or text documents.
  - <code style="color : blue"><b>Features</b></code>
    - Displaying vertical lines at each indentation level for improved readability.
    - Customizable appearance: You can adjust the color, style, and behavior of the indentation lines according to your preferences.
    - Support for various types of indentation, including spaces and tabs.
    - Compatibility with other Neovim features and plugins.

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - `treesitter` is a parser generator tool and an incremental parsing library
    It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited
  - **_nvim-treesitter is required for IDE functionality such as parsing, syntax highlighting, code analysis and incremental selection_**

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - `telescope` is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core
  - <code style="color : red"><b>Dependencies</b></code> 
    - `plenary`
    - `codicons`
    - `nvim-tree/nvim-web-devicons`
    - `ripgrep`
    - `fd` _(optionally)_

- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)
  - `harpoon` is a productivity plugin for Neovim that aims to help developers quickly navigate between files, terminals, and marks within their development environment. It provides a way to create shortcuts to frequently accessed resources, making it faster and more convenient to switch between different parts of a project.
  - <code style="color : blue"><b>Features</b></code> 
    - **_File Navigation_**: Quickly jump between a predefined set of files.
    - **_Terminal Integration_**: Access and manage multiple terminals within Neovim.
    - **_Marks_**: Set marks in files for rapid navigation.
    - **_Ease of Use_**: Intuitive commands and shortcuts to improve workflow.

- [folke/flash.nvim](https://github.com/folke/flash.nvim)
  - `flash` lets you navigate your code with search labels, enhanced character motions, and Treesitter integration.
  - <code style="color : blue"><b>Features</b></code>
    - Search Integration: integrate flash.nvim with your regular search using / or ?. Labels appear next to the matches, allowing you to quickly jump to any location. Labels are guaranteed not to exist as a continuation of the search pattern.
    - type as many characters as you want before using a jump label.
    - Enhanced `f`, `t`, `F`, `T` motions
    - Treesitter Integration: all parents of the Treesitter node under your cursor are highlighted with a label for quick selection of a specific Treesitter node.
    - Jump Mode: a standalone jumping mode similar to search
    - Search Modes: `exact`, `search` (regex), and `fuzzy` search modes
    - Multi Window jumping
    - Remote Actions: perform motions in remote locations
    - dot-repeatable jumps
    - highly extensible: check the [examples](https://github.com/folke/flash.nvim#-examples)

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
  - <code style="color : red"><b>Dependencies</b></code> 
      - `plenary`
      - `telescope`
      - `nui`
      - <code style="color : red">Patched Fonts (e.g. Nerd Fonts); PLEASE REFER TO [REFERENCES SECTION](#references) TO SEE HOW TO PATCH A FONT</code>

- [MunifTanjim/nui.nvim"](https://github.com/MunifTanjim/nui.nvim)
  - `nui` is a plugin for Neovim, and it's a highly customizable UI component framework based on Lua. This plugin aims to provide developers with components such as prompts, menus, and dialogs to help build interactive user interfaces within Neovim.

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - `plenary` is a neovim library that provides lua functions required for the development and use of various neovim plugins.

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - `lualine` is a blazing fast and easy to configure neovim statusline written in Lua.
  - <code style="color : red"><b>Dependencies</b></code> 
    - `nvim-web-devicons`

- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
  - `nvim-web-devicons` is a lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.

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
  - <code style="color : red"><b>Dependencies</b></code> 
    - `neodev`
    - `codicons`
    - <code style="color : red">Patched Codicons Font; PLEASE REFER TO [REFERENCES SECTION](#references)TO SEE HOW TO PATCH THIS FONT</code>
    
- [leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)
  - `nvim-dap-go` is an extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests.

- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
  - `neodev` setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  - It is highly recommended to use neodev to enable type checking for nvim-dap-ui to get type checking, documentation and autocompletion for all API functions.

- [mortepau/codicons.nvim](https://github.com/mortepau/codicons.nvim)
  - `codicons` is a small library containing the codicons from VS Code and some functions to simplify the usage of them.

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

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
  - `autopairs` is designed to automatically close pairs of characters like parentheses, brackets, and quotes as you type, providing a smoother and faster coding experience.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Auto Closing_**: Automatically insert the closing character when you type an opening character (e.g., typing ( results in () with the cursor placed between the parentheses).
    - **_Auto Jumping_**: If the cursor is next to a closing character, typing that closing character will move the cursor to the right of it, instead of inserting another closing character.
    - **_Fast Wrap_**: Allows you to quickly wrap existing text with pairs of characters.
    - **_Intelligent Deletion_**: Helps with deleting pairs of characters intelligently to avoid leaving behind orphaned characters.
    - **_Support for Multiple File Types_**: The plugin can be configured to work with various programming languages and file types, respecting their unique syntax and characteristics.
    - **_Integration with Other Plugins_**: nvim-autopairs can be integrated with other Neovim plugins like completion plugins, providing a seamless coding experience.

- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
  - `toggleterm` is a Neovim plugin written in Lua, designed to help manage terminal windows within Neovim. The plugin allows users to toggle Neovim's built-in terminal easily, meaning you can show or hide the terminal window with a single command or key mapping.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Toggle Mechanism_**: Allows you to easily toggle between the terminal and your regular Neovim window
    - **_Multiple Terminals_**: Supports managing multiple terminals and provides commands to navigate between them
    - **_Persistent Layout_**: Terminals can maintain their size and layout between toggles
    - **_Customization_**: It can be customized to fit your needs, including custom commands, size, and direction preferences
    - **_Integration_**: Works well with other Neovim plugins and follows Neovim's conventions for terminal windows

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
  - `Comment.nvim` is a Neovim plugin written in Lua, which provides an easy and efficient way to comment out lines of code in multiple programming languages. Commenting is a common task in coding, and this plugin helps automate and streamline the process. 
  - <code style="color : blue"><b>Features</b></code>
    - Supports treesitter. [Read more](https://github.com/numToStr/Comment.nvim#treesitter)
    - Supports `commentstring`. Read `:h comment.commentstring`
    - Supports line (`//`) and block (`/* */`) comments
    - Dot (`.`) repeat support for gcc, gbc and friends
    - Count support for `[count]gcc` and `[count]gbc`
    - Left-right (`gcw` `gc$`) and Up-Down (`gc2j` `gc4`k) motions
    - Use with text-objects (`gci{` `gbat`)
    - Supports pre and post hooks
    - Ignore certain lines, powered by Lua regex 

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - `gitsigns` is a Neovim plugin designed to enhance the user's experience when working with Git repositories by providing signs in the 'signcolumn' (the area just left of the line numbers). These signs indicate changes relative to the Git index (staged changes). The plugin is written in Lua and is optimized for performance, making it a popular choice among Neovim users.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Change Indicators_**: It shows added, modified, and removed lines using different signs.
    - **_Inline Blame_**: It can display Git blame information directly within the editor.
    - **_Staging/Unstaging_**: The plugin allows you to stage or unstage hunks of changes directly from Neovim.
    - **_Navigation_**: You can navigate between different hunks of changes easily using provided key mappings.
    - **_Customizable_**: gitsigns.nvim offers a variety of customization options. You can adjust the signs' appearance, choose the colors, or change the key mappings.
    - **_Integration with Native LSP_**: Some functionalities of the plugin can benefit from the integration with Neovim's built-in LSP (Language Server Protocol), if available.
    - **_Preview Hunks_**: gitsigns.nvim also provides a way to preview the differences in a hunk without navigating to them, which can be helpful to get a quick glance at the changes.

- [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim)
  - `diffview` is a Neovim plugin written in Lua, which provides a simple, unified, single tabpage interface that lets you easily review all changed files for any git revision.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Diff Viewer_**: It allows users to view Git diffs directly inside Neovim. This includes staged changes, unstaged changes, and historical diffs.
    - **_File Navigation_**: It provides a file tree for navigating between different files in a diff. This can be especially useful when reviewing changes in a large commit or set of staged changes.
    - **_Integration with Neovim's Native LSP_**: The plugin has features that can take advantage of Neovim's built-in LSP (Language Server Protocol) for things like symbol outlining in the diff view.
    - **_Customization_**: Like many Neovim plugins, diffview.nvim is customizable. Users can configure its appearance, key mappings, and more.
  - <code style="color : red"><b>Dependencies</b></code> 
    - `nvim-web-devicons`
    - <code style="color : red">Patched Fonts (e.g. Nerd Fonts)</code>

- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
  - `fzf` is a Neovim plugin that provides a Lua interface to the popular fzf fuzzy finder. fzf is a command-line tool that allows for interactive searching and filtering of lists, and it has been integrated into many editors and shells to provide enhanced fuzzy searching capabilities.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Rich Features_**: fzf-lua provides a range of features to make the most of fzf within Neovim, such as:
      - Fuzzy finding files, buffers, Git files, and more.
      - Searching for text with ripgrep (or other tools) and viewing results in fzf.
      - Browsing Neovim's help system.
      - Integrations with LSP (Language Server Protocol) for actions like finding references, document symbols, workspace symbols, and more.
      - Preview window with customizable rendering, including tree-like file browsing and colored syntax highlighting.
    - **_Customizable_**: The plugin offers a wide range of customization options, from visual appearance to underlying tools and commands. For instance, while it defaults to using ripgrep for text searches, you can configure it to use other tools if you prefer.
    - **_Performance_**: fzf-lua is designed to be fast and efficient, offering the power of fzf without unnecessary overhead.
    **_Integrated Experience_**: One of the main goals of the plugin is to offer a seamless and integrated fzf experience within Neovim, making common tasks quicker and more intuitive.

- [nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua)
  - `neoclip` is a clipboard manager for neovim inspired by for example [`clipmenu`](https://github.com/cdown/clipmenu). It records everything that gets yanked in your vim session (up to a limit which is by default 1000 entries but can be configured). You can then select an entry in the history using telescope or fzf-lua which then gets populated in a register of your choice. 

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
  - `nvim-tree` is a popular file explorer plugin for Neovim, written in Lua. It provides a visual tree-like structure to navigate your file system, making it easier to browse, open, and manage files and directories directly from Neovim. This plugin is designed to be highly customizable and extendable, fitting seamlessly into a modern Neovim setup that utilizes Lua for configuration and plugins.
  - <code style="color : blue"><b>Features</b></code>
    - **_File Browsing_**: Navigate through your file system, open files, and directories.
    - **_Git Integration_**: Show git status of files (added, modified, untracked, etc.).
    - **_Customizable_**: Customize its appearance and behavior to suit your workflow.
    - **_Actions_**: Perform various actions on files/directories like copy, paste, rename, delete, etc.
    - **_Icons and Colors_**: Supports file icons and color highlighting based on file type or status.
    - **_Integration with Other Plugins_**: Can be integrated with other popular Neovim plugins and tools.
    - **_LSP_**: Supports LSP (Language Server Protocol) for various file operations.
    - **_File Operations_**: Perform operations like create, delete, rename, and move on files and directories.
    - **_Search_**: Quickly search and jump to files or directories.
    - **_Keybindings_**: Comes with default keybindings, but allows for full customization.

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

- [lua-language-server](https://github.com/LuaLS/lua-language-server)
  - `lua-language-server` (lua_ls) is a language server for the Lua programming language. Using the LSP protocol it provides completion, goto definition, find references, rename refactoring, diagnostics, and more.

- [marksman](https://github.com/artempyanykh/marksman)
  - `marksman` is a program that integrates with your editor to assist you in writing and maintaining your Markdown documents. Using the LSP protocol it provides completion, goto definition, find references, rename refactoring, diagnostics, and more.


---
### Terminal UI (TUI) Extensions

- [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)
  - `lazygit` is a **_NOT_** a Neovim plugin, but rather a simple terminal UI for Git commands, built with Go. It offers a more visual and interactive way to manage and visualize Git repositories directly from the terminal, without needing to remember or type out individual Git commands.
  - <code style="color : blue"><b>Features</b></code> 
    - **_Interactive UI_**: lazygit provides a visual interface in the terminal, where you can see the status of your repository, such as changed files, branches, commits, and stashes.
    - **_Key Bindings_**: It offers various key bindings for common Git tasks. For example, you can stage files, commit changes, switch branches, and more, all with a few key presses.
    - **_Commit Visualization_**: lazygit allows you to view a detailed log of commits, where you can navigate through your commit history interactively.
    - **_File Diff_**: It shows a side-by-side diff of the changes in your files, making it easier to understand what has been modified.
    - **_Stashing_**: You can quickly stash your changes and apply or pop stashes directly from the interface.
    - **_Merge Conflict Resolution_**: lazygit provides tools for resolving merge conflicts, showing the conflicting changes and allowing you to choose which changes to accept.
    - **_Customization_**: lazygit offers a range of configuration options, including custom key bindings, themes, and other preferences.

- [derailed/k9s](https://github.com/derailed/k9s)
  - `k9s` is a popular open-source terminal-based console (TUI) for managing and interacting with Kubernetes clusters. It provides a powerful and convenient way to view, navigate, and manipulate Kubernetes resources and clusters directly from your terminal. K9s is designed to simplify Kubernetes administration tasks and provide real-time insights into your cluster.
  - <code style="color : blue"><b>Features</b></code>
    - **_Interactive User Interface_**: K9s offers an interactive, ncurses-based user interface that displays your cluster's resources in a tabular format, making it easy to browse and manage them.
    - **_Resource Navigation_**: You can navigate through various Kubernetes resources, including pods, services, deployments, configmaps, and more, using keyboard shortcuts.
    - **_Resource Details_**: K9s provides detailed information about selected resources, including logs, events, and YAML manifests.
    - **_Resource Operations_**: You can perform actions on resources, such as deleting, scaling, and editing, directly from the K9s interface.
    - **_Context and Namespace Switching_**: K9s allows you to switch between different Kubernetes contexts and namespaces, making it convenient for managing multiple clusters or namespaces.
    - **_Search and Filter_**: You can search for specific resources and filter them based on different criteria.
    - **_Customization_**: K9s is highly customizable and supports configuration files, allowing you to tailor it to your needs.

- **_Todo/Tracker TUI_**
  - you can plugin whichever Todo/Tracker TUI you desire and it will autmatically be bootstrapped by the neovim config and integrated with `toggleterm`. Todo so (pun indended), set the `NVIM_TODO_TUI` environment variable to the command of your desired TUI (e.g. `todui`). This will _ONLY_ work if the command is installed on your system (i.e. avaialble via `$PATH`).


---
### Nvim Config Environment Variables
 - `NVIM_LOG_LVL`: by setting this environment variable to either ["TRACE" | "DEBUG" | "INFO" | "WARN" | "ERROR" | "OFF" ], the [`rcarriga/nvim-notify`](https://github.com/rcarriga/nvim-notify) plugin will be configured to display notifications upto the desired log level. If the env var `NVIM_LOG_LVL` is not set, the log level is deafult to `INFO`.

 Neovim will open with debugging info, such as the compatible clipboard providers that have been detected, etc.
by setting this environment variable to `true`, Neovim will open with debugging info, such as the compatible clipboard providers that have been detected, etc.
</br>
 
 - `NVIM_SKIP_CLIP`: by setting this environment variable to `true`, you are choosing to skip the configuration of prefered clipboard providers (xclip, xsel, tmux, termux, etc...) and dismiss related errors.
</br>
 
 - `NVIM_CLIP`: Depending on your preference of clipboard provider for Neovim and your currently installed clipboard providers on your system, Neovim may implicitly select a provider and connect the respective registers. If you prefer not to leverage a clipboard like `xclip` or do not have a display (i.e. headless server), you can explictly select `tmux` as your prefered clipboard provider. 

   - To do so, set the `NVIM_CLIP` environment variable to `tmux`. This will configure `tmux` to be your preferred clipboard provider, connect the appropriate registers and set the `<leader> + y`, `<leader> + p` key bindings for copying and pasting, respectively.
 
   - <code style="color : green"><b>Note</b></code>**:** To see more information about clipboard configurations, please see the `Nvim Clipboard Provider Related` subsection of [Nvim Config Installation Prerequisites](#nvim-config-installation-prerequisites).
</br>
 
 - `NVIM_ENABLE_GPT`: by setting this environment variable to `true`, the `jackMort/ChatGPT.nvim` plugin will be able to be installed via the `PackerInstall` command upon Neovim restart. In addition, the respective key bindings outlined in the [Noteworthy Key Bindings](#noteworthy-key-bindings) section of this document will be bound.

    - <code style="color : green"><b>Note</b></code>**:** For more information regarding the `ChatGPT` plugin and its installation requirements, please see the respective subsection within [Nvim Config Installation Prerequisites](nvim-config-installation-prerequisites).
    </br>

- `NVIM_DISABLE_MATCHING_HL`: by setting this environment variable to `true`, you will be disabling all symbol match highlighting (e.g. matching open and closing brackets/braces). 
</br>

- `NVIM_ENABLE_BACKUP_COMMENT_COLOR`: This environment variable should **_ONLY_** be used when you are encountering issues with either treesitter or LSPs, where comments are no longer being rendered in green text.

  - To manually override the `gruvbox` colorscheme to render comments in green text, when either treesitter or LSPs are **_NON_**-FUNCTIONAL, set the environment variable to `true`.

- `NVIM_TODO_TUI`: by setting this environment variable to the command of your desired Todo/Tracker TUI (e.g. `todui`), the neovim will automatically bootstrap the integration with `toggleterm`; this will _ONLY_ work if the command is installed on your system (i.e. avaialble via `$PATH`).


---
### Nvim Config Installation Prerequisites

**Terminal Font Related**
  The configuration file `init.lua` explictly references a number of Patched fonts and plugins like `nvim-dap-ui`, `diffview` and `ChatGPT.nvim` leverage implictly do aswell. 
  
  If you do not either patch or get the required patched fonts, `Nerd Fonts` (e.g. Ubuntu Nerd Font) and `Codicons`, you will see _unknown symbols_ and/or warnings from the aforementioned plugins.

  To see how to patch fonts, refer to the [References Section](#references)  

**Lazy Git**
  See the `lazygit` extension subsection in [Terminal UI (TUI) Extensions](#terminal-ui-tui-extensions), to learn more about this git worklfow tool and how it works **_amazingly well_** with `toggleterm`.

  If you decide to join the dark side, all you need to do is simply install `lazygit` on your system ([follow their installation guide](https://github.com/jesseduffield/lazygit/tree/master#installation)) and the neovim config will automatically bootstrap `toggleterm` with `lazygit` for you. A dedicated floating terminal window will be available to toggle using the keybindings outlined in the [Noteworthy Key Bindings](#noteworthy-key-bindings) section of this document.

**k9s**
  See the `k9s` extension subsection in [Terminal UI (TUI) Extensions](#terminal-ui-tui-extensions), to learn more about this amazing TUI for interacting with k8s clusters. Its time to leave the plain jane `kubectl` cli in the dust!

  Simply install `k9s` on your system ([follow their installation guide](https://github.com/derailed/k9s#installation)) and the neovim config will automatically bootstrap `toggleterm` with `k9s` for you. A dedicated floating terminal window will be available to toggle using the keybindings outlined in the [Noteworthy Key Bindings](#noteworthy-key-bindings) section of this document.

**Todo/Tracker TUI**
    - you can plugin whichever Todo/Tracker TUI you desire and it will autmatically be bootstrapped by the neovim config and integrated with `toggleterm`. Todo so (pun indended), set the `NVIM_TODO_TUI` environment variable to the command of your desired TUI (e.g. `todui`). This will _ONLY_ work if the command is installed on your system (i.e. avaialble via `$PATH`).
    - see the respective [environment variable section](#nvim-config-environment-variables) for more details

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
### Noteworthy Key Bindings

<code style="color : green"><b>Note</b></code>**:** by deafult the leader key binding is set to the `<space>` key

**General Bindings**
- `[TERMINAL Mode]: j + j`  - Exit TERMINAL mode and enter normal mode
- `[INSERT Mode]: j + j`    - Exit INSERT mode and enter normal mode
- `<alt-b>`                 - Go back/exit current window

**Commenting**
  - For commenting lines or blocks of code please refer to the default key-bindings for [`numToStr/Comment.nvim`](https://github.com/numToStr/Comment.nvim#-usage)

  - For navigating `folke/todo-comments.nvim` comment tags please refer to the below key bindings:
    - `t + t`    - View all Todo Comment tags using telescope
    - `] + t` - Jump to the next `TODO` tag 
    - `[ + t` - Jump to the previous `TODO` tag 
    - `] + h` - Jump to the next `HACK` tag 
    - `[ + h` - Jump to the previous `HACK` tag 
    - `] + b` - Jump to the next `BUG/FIX` tag 
    - `[ + b` - Jump to the previous `BUG/FIX` tag 
    - `] + i` - Jump to the next `IMPORTANT` tag 
    - `[ + i` - Jump to the previous `IMPORTANT` tag 
    - `] + w` - Jump to the next `WARN` tag 
    - `[ + w` - Jump to the previous `WARN` tag 
    - `] + p` - Jump to the next `PERF` tag 
    - `[ + p` - Jump to the previous `PERF` tag 
    - `] + n` - Jump to the next `NOTE` tag 
    - `[ + n` - Jump to the previous `NOTE` tag 
    - `] + T` - Jump to the next `TEST` tag 
    - `[ + T` - Jump to the previous `TEST` tag 

**Split Screen & Navigation**
  - `<leader> + v` **OR** `<alt-v>` - Split the screen vertically (uses currently opened file as default file to open)
  - `<leader> + h` **OR** `<alt-h>` - Navigate one screen to the left
  - `<leader> + l` **OR** `<alt-l>` - Navigate one screen to the right

**Nvim-Tree**
  - `<alt>-n`     - Toggle the nvim-tree file explorer pane
  - ``` ` + ` ``` - Open nvim-tree file explorer pane, if not opened and set focus

<code style="color : green"><b>Note</b></code>**:** for all built-in `nvim-tree` keybindings, please either see the [keymap code](https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/keymap.lua) in github, or use the `g + ?` keybinding while maintaining focus in the `nvim-tree` file explorer pane 

**Toggleterm**
  - `<alt-j>` - Toggle a persistent terminal pane at the bottom of the window horizontally (small)
  - `<alt-k>` - Toggle a floating persistent terminal pane that hovers over the main window (large)

**Harpoon (Marking)**
  - `h + x` - Mark the current buffer
  - `h + r` - Remove the mark on the current buffer
  - `h + n` - Navigate to the next marked (harpooned) buffer
  - `h + p` - Navigate to the previous marked (harpooned) buffer
  - `h + m` - Open window with all marked (harpooned) buffers using telescope

**Flash**
 - `<leader> + s` - Activate flash search (Modes: `n`, `x`, `o`)
 - `<leader> + t` - Activate flash search in `treesitter` mode (Modes: `n`, `x`, `o`)
 - `<leader> + r` - Activate flash in remote mode (Modes: `o`)

**Bufferline**
  - `<alt>-c`     - Closes the current buffer
  - `c + l`       - Closes all buffers to the left of the current buffer (visible in the bufferline)
  - `c + r`       - Closes all buffers to the right of the current buffer (visible in the bufferline)
  - `c + o`       - Closes all buffers other than the current buffer
  - `n + n`       - Move the current buffer one index to the right
  - `p + p`       - Move the current buffer one index to the left
  - `<space> + ]` - Open the next buffer to the right
  - `<space> + [` - Open the previous buffer to the left
  - `<space> + 1` - Open the buffer with the visible oridnal of `1` (relative positioning)
  - `<space> + 2` - Open the buffer with the visible oridnal of `2` (relative positioning)
  - `<space> + 3` - Open the buffer with the visible oridnal of `3` (relative positioning)
  - `<space> + 4` - Open the buffer with the visible oridnal of `4` (relative positioning)
  - `<space> + 5` - Open the buffer with the visible oridnal of `5` (relative positioning)
  - `<space> + 6` - Open the buffer with the visible oridnal of `6` (relative positioning)
  - `<space> + 7` - Open the buffer with the visible oridnal of `7` (relative positioning)
  - `<space> + 8` - Open the buffer with the visible oridnal of `8` (relative positioning)
  - `<space> + 9` - Open the buffer with the visible oridnal of `9` (relative positioning)
  - `<alt>-1`     - Open the buffer with the absolute oridnal/index of `1` (absolute positioning)
  - `<alt>-2`     - Open the buffer with the absolute oridnal/index of `2` (absolute positioning)
  - `<alt>-3`     - Open the buffer with the absolute oridnal/index of `3` (absolute positioning)
  - `<alt>-4`     - Open the buffer with the absolute oridnal/index of `4` (absolute positioning)
  - `<alt>-5`     - Open the buffer with the absolute oridnal/index of `5` (absolute positioning)
  - `<alt>-6`     - Open the buffer with the absolute oridnal/index of `6` (absolute positioning)
  - `<alt>-7`     - Open the buffer with the absolute oridnal/index of `7` (absolute positioning)
  - `<alt>-8`     - Open the buffer with the absolute oridnal/index of `8` (absolute positioning)
  - `<alt>-9`     - Open the buffer with the absolute oridnal/index of `9` (absolute positioning)

**neoclip**
  - `<space> + c` - Open searchable clipboard window using telescope

**Lazygit**
  <code style="color : green"><b>Note</b></code>**:** The below key bindings are only available if `lazygit` is installed on your system (i.e. avaialble via `$PATH`). The neovim config will automatically bootstrap `toggleterm` with `lazygit` for you, ONLY if `lazygit` is installed.
  - `<leader> + g` - Open a floating terminal running `lazygit`
  - `<leader> + q` OR `q` - Close the floating terminal running `lazygit`
  
  For a comprehensive list of built-in key mappings for `lazygit`, refer to its respective [documentation](https://github.com/jesseduffield/lazygit/tree/master/docs/keybindings).

**k9s**
  <code style="color : green"><b>Note</b></code>**:** The below key bindings are only available if `k9s` is installed on your system (i.e. avaialble via `$PATH`). The neovim config will automatically bootstrap `toggleterm` with `k9s` for you, ONLY if `k9s` is installed.
  - `k + 9 + s` - Open a floating terminal running `k9s`
  - `q`         - Close the floating terminal running `k9s` **_(while in NORMAL MODE)_**
  - `q + q`     - Close the floating terminal running `k9s` **_(while in TERMINAL MODE)_**

  For a comprehensive list of built-in key mappings for `k9s`, refer to its respective [documentation](https://github.com/derailed/k9s#key-bindings).

**notify**
  - `n + h` - Open searchable window of messages/logs using telescope

**Telescope**
  - `<leader> + <shift>-? `     - Find recently opened files
  - `<leader> + <space>`        - Find recent telescope fuzzy finder buffers
  - `<leader> + f`              - Fuzzily search in current buffer
  - `<leader> + p` OR `<alt>-p` - Search for files within the current directory structure (recursive)
  package functions)
  - `<leader> + s + w`          - Search current buffer for references of a particular word or sequence of characters
  - `<leader> + s + g`          - Search current buffer files for a particular regex pattern (basic regex, notPCRE compliant)
  - `<leader> + s + d`          - Search telescope related diagnostics
  - `<leader> + s + h`          - Search help documentation (e.g. go's fmt package functions)

**Language Server Protocol (LSP) Client**
  - `g + d`       - Go to the definition of the symbol under the cursor
  - `g + r`       - Get references of the symbol under the cursor
  - `<shift>-K`   - Display information about the symbol (e.g. godocs) under the cursor in a floating window 
  - `<alt>-r`     - Rename the symbol under the cursor throughout the document
  - `h + s`       - Highlight the symbol under the cursor throughout the document
  - `h + c`       - Clear highlighting of symbols throughout the document
  - `d + s`       - Lists all symbols (e.g. structs, interfaces, fields, functions, etc.) in the current buffer (scope limited to the document), within the quickfix window.
  - `w + s`       - Lists all symbols (e.g. structs, interfaces, fields, functions, etc.) in the current workspace, within the quickfix window.

**LSP Client Autocomplete**
  - `<ctrl>-y`      - Accept autocomplete suggeston
  - `<ctrl>-e`      - Abort the autocomplete suggestion window
  - `<ctrl>-u`      - Scoll the autocomplete suggestion window up
  - `<ctrl>-d`      - Scoll the autocomplete suggestion window down
  - `<up-arrow>`    - Select the _previous_ option in the autocomplete suggestion window
  - `<down-arrow>`  - Select the _next_ option in the autocomplete suggestion window
  - `<ctrl>-p`      - If the autocomplete suggestion window is visible this key combination will select the _previous_ option in the autocomplete suggestion window
  - `<ctrl>-n`      - If the autocomplete suggestion window is visible this key combination will select the _next_ option in the autocomplete suggestion window 

**Dubug Adaptor Protocol (DAP)**
  - `<leader> + d + u`  - Toggle the DAP debugger User Interface (UI)
  - `<leader> + d + b`  - Toggle breakpoint on current line
  - `<leader> + d + c`  - Invoke _continue_ debugger operation
  - `<leader> + d + o`  - Invoke _step over_ debugger operation
  - `<leader> + d + i`  - Invoke _step into_ debugger operation
  - `<leader> + d + 0`  - Invoke _step out_ debugger operation
  - `<leader> + d + l`  - Invoke _run last debugger operation
  - `<leader> + d + r`  - Toggle the DAP Read-Eval-Print Loop (REPL)

**ChatGPT**

<code style="color : green"><b>Note</b></code>**:** Only functions exposed by the ChatGPT plugin have been mapped to keys explictly and can be seen below. To see all keybindings related to the ChatGPT plugin, refer to [plugin's documentation](https://github.com/jackMort/ChatGPT.nvim#interactive-popup).</br>

  - `g + p + t`     - Invokes the `ChatGPT` command of the ChatGPT Plugin
    - Opens an interactive window to maintain a dialogue with ChatGPT
  - `g + p + t + a` - Invokes the `ChatGPTActAs` command of the ChatGPT Plugin
    - Opens a prompt selection from [Awesome ChatGPT Prompts](https://github.com/f/awesome-chatgpt-prompts), which primes ChatGPT with a vartiety of selectable personas (e.g. Cyber Security Specialist, {POSITION} Interviewer, Linux Terminal, Python Interpreter) 
  - `g + p + t + e` - Invokes the `ChatGPTEditWithInstructions` command of the ChatGPT Plugin
    -  opens an interactive window to edit selected text or whole window
  - `g + p + t + r` - Invokes the `ChatGPTRun` command of the ChatGPT Plugin
    -  command which runs specific actions -- see [actions](https://github.com/jackMort/ChatGPT.nvim/blob/main/lua/chatgpt/flows/actions/actions.json) for a detailed list. Some available actions are:
        - `grammar_correction`
        - `translate`
        - `keywords`
        - `docstring`
        - `add_tests`
        - `optimize_code`
        - `summarize`
        - `fix_bugs`
        - `explain_code`
        - `roxygen_edit`
        - `code_readability_analysis` - see [demo](https://youtu.be/zlU3YGGv2zY)

---
### References

- [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol)

- [Neovim LSP client configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

- [Nerd Fonts](https://www.nerdfonts.com/)
  - plugins such as `diffview`, `ChatGPT.nvim` are configured to use [Patched Fonts](https://github.com/ryanoasis/nerd-fonts#patched-fonts) for rendering icons within the terminal and ultimately Neovim.
  - [Github](https://github.com/ryanoasis/nerd-fonts)

- [Codicons](https://github.com/microsoft/vscode-codicons)
  - plugin(s) such as `nvim-dap-ui` are configured to use the `codicons` Font, as part of the UI's debugger pane.
  - the `codicons` font will required to be patched by tools like nerd-fonts' font-patcher; possibly in conjunction with fontforge. See the `How to Patch Fonts` subsection within `References` for details on how to deal with Font Patching.

- **_How to Patch Fonts_**:
    - Manually Patching a Font
      - [Font Patching Procedure](https://github.com/ryanoasis/nerd-fonts#option-9-patch-your-own-font)
      - Once a font is patched, move the respective `.ttf` file to the running user's font dir (e.g. `~/.local/share/fonts/FontName.ttf`) or in a well named subdirectory (e.g. `~/.local/share/fonts/Ubuntu/FontName.ttf`
    - Using already Patched Fonts
      - Dowload a patched font from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
      - Move the respective `.ttf` file(s) to the running user's font dir (e.g. `~/.local/share/fonts/FontName.ttf`) or in a well named subdirectory (e.g. `~/.local/share/fonts/Ubuntu/FontName.ttf`)
