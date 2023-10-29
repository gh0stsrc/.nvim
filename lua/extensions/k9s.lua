--* --------------------------------------------------------------- *--
--?                      	      k9s Setup   	                      ?--
--* --------------------------------------------------------------- *--

local command_exists = require("utils.helpers").command_exists

-- NOTE: ONLY configure toggle terminal to open terminal window running k9s, if it is installed (i.e. can be found on $PATH)
if command_exists("k9s") then
	-- load and save toggle terminal's terminal module Terminal object, for direct terminal window creation
	Terminal = require('toggleterm.terminal').Terminal
	-- Create a new Terminal instance for k9s
	local K9s = Terminal:new({
	  cmd = "k9s",          -- command to execute in the terminal
	  dir = "./",           -- directory for terminal to be opened within
	  direction = "float",  -- set terminal to float over the current neovim window 
	  float_opts = {
		border = "double",    -- set a double boarder around the floating window 
	  },

	  -- function to run on opening of the terminal
	  on_open = function(term)
      vim.cmd("startinsert!") -- start in INSERT mode
      -- map the `q` and `qq` keys in normal and terminal mode respectively, to close the k9s terminal window
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
		  vim.api.nvim_buf_set_keymap(term.bufnr, "t", "qq", "<cmd>close<CR>", {noremap = true, silent = true})

      --NOTE:the uncommented code below is how you would clear the buffer associated the to k9s toggleterm window
      --vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>bd!<CR>", {noremap = true, silent = true})  -- see git issue for command reasoning https://github.com/akinsho/toggleterm.nvim/issues/160
		  --vim.api.nvim_buf_set_keymap(term.bufnr, "t", "qq", "<cmd>bd!<CR>", {noremap = true, silent = true}) -- see git issue for command reasoning https://github.com/akinsho/toggleterm.nvim/issues/160
  end,

	  -- function to run on closing the terminal
	  on_close = function(term)
		vim.cmd("startinsert!") -- Resume INSERT mode upon closing the terminal window
	  end,
	})

	-- function to toggle the k9s terminal
	function _k9s_toggle()
	  K9s:toggle()
	end

  -- TODO: find a better home for this key binding 
  -- set a keymap in normal mode, that will toggle the k9s terminal
  vim.api.nvim_set_keymap("n", "k9s", "<cmd>lua _k9s_toggle()<CR>", {noremap = true, silent = true})
end

