--* --------------------------------------------------------------- *--
--?                   TODO Terminal UI (TUI) Setup   	              ?--
--* --------------------------------------------------------------- *--

local command_exists = require("utils.helpers").command_exists
local todo_tui_cmd = os.getenv("NVIM_TODO_TUI")

if todo_tui_cmd ~= nil then
  -- NOTE: ONLY configure toggle terminal to open terminal window running the Todo Terminal UI tool of your choice, based on the value set via the `NVIM_TODO_TUI` environment variable and if the TUI is installed (i.e. can be found on $PATH)
  if command_exists(todo_tui_cmd) then
    -- load and save toggle terminal's terminal module Terminal object, for direct terminal window creation
    Terminal = require('toggleterm.terminal').Terminal
    -- Create a new Terminal instance for the Todo TUI
    local TodoTUI = Terminal:new({
      cmd = todo_tui_cmd,   -- command to execute in the terminal
      dir = "./",           -- directory for terminal to be opened within
      direction = "float",  -- set terminal to float over the current neovim window 
      float_opts = {
      border = "double",    -- set a double boarder around the floating window 
      },

      -- function to run on opening of the terminal
      on_open = function(term)
        vim.cmd("startinsert!") -- start in INSERT mode
        -- map the `q` and `qq` keys in normal and terminal mode respectively, to close the Todo TUI terminal window
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "qq", "<cmd>close<CR>", {noremap = true, silent = true})

    end,

      -- function to run on closing the terminal
      on_close = function(term)
      vim.cmd("startinsert!") -- Resume INSERT mode upon closing the terminal window
      end,
    })

    -- function to toggle the Todo TUI terminal
    function _todo_tui_toggle()
      TodoTUI:toggle()
    end

    -- TODO: find a better home for this key binding 
    -- set a keymap in normal mode, that will toggle the Todo TUI  terminal
    vim.api.nvim_set_keymap("n", "<M-t>", "<cmd>lua _todo_tui_toggle()<CR>", {noremap = true, silent = true})
  end
end

