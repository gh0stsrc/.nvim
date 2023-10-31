--* --------------------------------------------------------------- *--
--?                         Core / Init Setup                       ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: This file is loaded before plugins, so if you need something to be executed before importing modules/libs put it here

-- NOTE: inform neovim to treat the `Netrw` plugin as if it was already loaded, preventing it from actually being loaded when launching neovim; required to load nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NOTE: set nvim-notify as the default noftication mechanism for all plugins that use vim.notify function (e.g. telescope)
vim.notify = require("notify")

--* --------------------------------------------------------------- *--
--?                        Vim Customizations                       ?--
--* --------------------------------------------------------------- *--

-- set  the cursor shape to a block (i:block) when you are in insert mode (i). The cursor shape changes visually to indicate the mode you are in
vim.opt.guicursor = "i:block"
-- set the number of spaces a tab character should display as. In this case, it's set to 2 spaces
vim.opt.tabstop = 2
-- sets the number of spaces used for auto-indentation and when shifting lines with << or >> commands to 2 spaces
vim.opt.shiftwidth = 2
-- specifies the number of spaces inserted for a <Tab> keypress or during auto-indentation. This ensures that pressing <Tab> inserts 2 spaces
vim.opt.softtabstop = 2
-- use spaces for indentation instead of tab characters when you press <Tab> or use auto-indentation.
vim.opt.expandtab = true
-- enables line numbering in the left margin of the buffer
vim.opt.number = true
-- disables the creation of swap files. Swap files are used for crash recovery and can be helpful, but this configuration turns them off
vim.opt.swapfile = false
-- enables highlight search results, causing text matching your search pattern to be highlighted.
vim.o.hlsearch = true
-- enables mouse support for all modes ('a'). This allows you to use the mouse to select, scroll, and interact with Vim
vim.o.mouse = 'a'
-- enables automatic line breaking with the breakindent feature, which helps maintain proper indentation when a line wraps
vim.o.breakindent = true
-- enables undo file support, which allows you to persist undo history across sessions
vim.o.undofile = true
-- makes searches case-insensitive by default. When you search for text, Vim will match regardless of case
vim.o.ignorecase = true
-- Sets the interval (in milliseconds) for updating the screen and triggering various autocmd events; this can improve responsiveness
vim.o.updatetime = 250
-- Enables the use of timeouts for key mappings and commands
vim.o.timeout = true
-- sets the timeout length (in milliseconds) for key mappings. If you don't complete a key sequence within this time, Vim will assume you intended to type the keys separately
vim.o.timeoutlen = 300
-- enables true color support in the terminal if supported by your terminal emulator. This allows for more colorful syntax highlighting
vim.o.termguicolors = true

--NOTE: configure automatic toggling between relative and absolute number mode dynamically based on events
vim.cmd([[
 augroup numbertoggle
   autocmd!
   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif " NOTE: ENABLE relative numbering when entering a buffer, gaining neovim focus, leaving insert mode or when entering a window
   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif " NOTE: DISABLE relative number (set abolsute), when leaving a buffer, losing focus, entering insert mode and leaving a window
 augroup END
]])

