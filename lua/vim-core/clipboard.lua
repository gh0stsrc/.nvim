--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                             NeoVim Clipboard Bootstrapping                                               ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

local Helpers = require("utils.helpers")
local Logger  = require("utils.logger")
local async = require("plenary.async")

-- call the check_clipboard_providers function and store the result in the clipboard_providers variable
local clipboard_providers = Helpers.check_clipboard_providers()

-- check if no clipboard provider has been found AND if the user has NOT set the NVIM_SKIP_CLIP environment variable
if #clipboard_providers == 0 and (Helpers.to_boolean(os.getenv("NVIM_SKIP_CLIP")) ~= true) then
    -- If no providers were found, raise an error
    error(("No clipboard providers found, either install one of the compatible clipboards or enable the `NVIM_SKIP_CLIP` env var to ignore clipboard errors; compatible clipboards -> " .. "[" .. table.concat(clipboard_providers, ", ") .. "]"), 1)
else
  -- if one or more providers were found, print a message listing the found clipboard providers
  if (string.upper(os.getenv("NVIM_LOG_LVL") or "nil" ) == "DEBUG") then

    async.run(function()
      Logger.log(
        "Started in DEBUG mode",
        "debug"
      )
      Logger.log(("- CLIPBOARD PROVIDERS FOUND: " .. "[" .. table.concat(clipboard_providers, ", ") .. "]"), "debug")
    end)

  end
end

-- IMPORTANT:
--             [:help g:clipboard]
--             Neovim has no direct connection to the system clipboard. Instead it depends on a `provider` which transparently uses shell commands to communicate with the system 
--             clipboard or any other clipboard backend 
--
--             The presence of a working clipboard tool implicitly enables the '+' and '*' registers. neovim looks for these clipboard tools in order priority of :
--               - g:clipboard
--               - pbcop, pbpaste (macOS)
--               - wl-copy, wl-paste (if $WAYLAND_DISPLAY is set)
--               - xclip (if $DISPLAY is set)
--               - xsel (if $DISPLAY is set)
--               - lemonade (for SSH)
--               - doitclient (for SSH)
--               - win32yank (Windows)
--               - termux (via termux-clipboard-set, termux-clipboard-set)
--               - tmux (if $TMUX is set)
--
--             This means that if xclip or xsel are installed and their dependent environment variable (i.e. $DISPLAY) defining which xserver display to attach to are present, 
--             neovim will implicitly create the necessary hooks and enable the required registers ('+', '*'). Ultimately resulting in a turn-key clipboard solution for GUI versions 
--             of GUI-based linux distributions (e.g. ubuntu + xserver)

-- NOTE: 
--        - if tmux is the only provider, neovim will implicitly enable hooks and registers for the clipboard; however the key bindings below will not be enabled; to do so
--          you will need to set the `NVIM_CLIP` environment variable to any permutation of upper and lower case characters of 'tmux'.
--        - this impacts terminal only/headless users (no use of xserver - headless server - No GUI)

-- check if the user explitily would like to leverage tmux as the clipboard provider OR if the only provider available is tmux AND ensure that a tmux session is attached
if (string.upper(os.getenv("NVIM_CLIP") or "nil") == "TMUX" or string.upper(clipboard_providers[1]) == "TMUX") and (os.getenv("TMUX") ~= nil) then
  -- explictly set tmux as the neovim clipboard provider
  vim.g.clipboard = {
    name = "tmux",
    copy = {
      ["+"] = {"tmux", "load-buffer", "-"},
      ["*"] = {"tmux", "load-buffer", "-"},
    },
    paste = {
      ["+"] = {"tmux", "save-buffer", "-"},
      ["*"] = {"tmux", "save-buffer", "-"},
    },
    cache_enabled = true
  }

  --TODO: move to keybindings module
  -- visual mode key binding for copying
  vim.api.nvim_set_keymap("v", "<Leader>y", ":w !tmux load-buffer -<CR>", { noremap = true, silent = true })
  -- normal mode key binding for pasting
  vim.api.nvim_set_keymap("n", "<Leader>p", ":r !tmux save-buffer -<CR>", { noremap = true, silent = true })
end

