--* --------------------------------------------------------------- *--
--?                      	  lazygit Setup   	                      ?--
--* --------------------------------------------------------------- *--

local command_exists = require("utils.helpers").command_exists

-- NOTE: ONLY configure toggle terminal to open terminal window running lazygit, if lazy it is installed (i.e. can be found on $PATH)
if command_exists("lazygit") then
	-- load and save toggle terminal's terminal module Terminal object, for direct terminal window creation
	Terminal = require('toggleterm.terminal').Terminal
	-- Create a new Terminal instance for lazygit
	LazyGit = Terminal:new({
	  cmd = "lazygit",       -- command to execute in the terminal
	  dir = "git_dir",       -- directory for terminal to be opened within
	  direction = "float",   -- set terminal to float over the current neovim window 
	  float_opts = {
		border = "double",     -- set a double boarder around the floating window 
	  },

	  -- function to run on opening of the terminal
	  on_open = function(term)
		vim.cmd("startinsert!") -- start in INSERT mode
		-- map the `q` key in normal mode to close the lazygit terminal window
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
	  end,

	  -- function to run on closing the terminal
	  on_close = function(term)
		vim.cmd("startinsert!") -- Resume INSERT mode upon closing the terminal window
	  end,
	})

	-- function to toggle the lazygit terminal
	function _lazygit_toggle()
	  LazyGit:toggle()
	end

  -- TODO: find a better home for this key binding 
  -- set a keymap in normal mode: that will toggle the lazygit terminal
  vim.api.nvim_set_keymap("n", "<M-g>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
end

