--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                                     Helper Functions                                                      ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- define a table to represent the module
local M  = {}

-- helper func used to see if a particular command exists on the system (i.e. is reachable via $PATH)
function M.command_exists(cmd)
	-- create file handle with the output stream of the executed command 
    local handle = io.popen("command -v " .. cmd) -- `command -v` returns information pertaining to a particular command if it exists
	-- read the file handle in its entirety (should only be the path of the binary for the command if it exists)
    local result = handle:read("*a") -- format string to read all of the data
    -- close file handler
	handle:close()
	-- return result to the caller
    return result and result ~= ""
end


-- helper func to convert strings to booleans - primarily for env var comparison
function M.to_boolean(str)
  local bool = false
  if str == "true" then
      bool = true
  end
  return bool
end


-- helper func to check if neovim compatible clipboard providers are currently installed
function M.check_clipboard_providers()
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

-- return the module as a table
return M

