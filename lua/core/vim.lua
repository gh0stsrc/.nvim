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
-- disables line numbering in the left margin of the buffer
vim.opt.number = false
-- enables relative line numbering, which displays line numbers relative to the current cursor position (e.g., the current line is displayed as 0, the line above it as -1, and so on)
vim.opt.relativenumber = true
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

