--* --------------------------------------------------------------- *--
--?                gruvbox/Neovim Color Scheme Setup                ?--
--* --------------------------------------------------------------- *--

local Helpers = require("utils.helpers")

--* ------------------------------------ *--
--?     gruvbox config initialization    ?--
--* ------------------------------------ *--

-- desired generic overrides for gruvbox
local gruvbox_overrides = {
  -- use a treesitter group/LSP semantic override to force the colour of comments to green (supported for all installed LSPs)
  ["@comment"] = { fg = "#2ea542" }
}

-- default palette overrides for gruvbox - defaults to nil as palette overrides will only be leveragd if issues with an LSP arise
local gruvbox_palette_overrides

-- NOTE: if you are encountering issues with either treesitter or any LSP client, where comment code is not respecting configuration set by the `overrides` filed for gruvbox's
--       setup, you can manually force the colour change via the use of the `NVIM_ENABLE_BACKUP_COMMENT_COLOR` environment variable  
if Helpers.to_boolean(os.getenv("NVIM_ENABLE_BACKUP_COMMENT_COLOR")) == true then
  -- override the gray colour used for comments to green
  gruvbox_palette_overrides = {
    gray = "#2ea542", -- comments are overridden to be green
  }

  -- set the gruvbox_overrides to nil as they will not be leverage since Backup Comment Colour will be used
  gruvbox_overrides = nil

  -- add the same comment color in each theme via autocmd group
  vim.cmd([[
    augroup CustomCommentColor
      autocmd!
      autocmd VimEnter * hi Comment guifg=#2ea542
    augroup END
  ]])
end

-- NOTE: if you do not like bracket matching highlighting, you can disable it by setting the `NVIM_DISABLE_MATCHING_HL` environment variable to `true`
--  disable matching bracket/brace and other jazz highlighting via autocmd group
if Helpers.to_boolean(os.getenv("NVIM_DISABLE_MATCHING_HL")) == true then
	vim.cmd([[
		augroup NoMatchHL
		autocmd!
		autocmd VimEnter * NoMatchParen 
	  augroup END
	]])
end

--* ------------------------------------ *--
--?             gruvbox setup            ?--
--* ------------------------------------ *--

require("gruvbox").setup({
  -- set gruvbox to present a harderd contrast, preferred option when using Dark Mode
  contrast = "hard",
  --* if the env `NVIM_ENABLE_BACKUP_COMMENT_COLOR` is NOT set, `overrides` will be set the initial value set of the local var `gruvbox_overrides`; otherwise it will be set to nil
  --* use a treesitter group/LSP semantic override to force the colour of comments to green (supported for all installed LSPs)
  overrides = gruvbox_overrides,
  --* if the env `NVIM_ENABLE_BACKUP_COMMENT_COLOR` IS  set, `palette_overrides` will be set to the value by the respective conditonal control flow; otherwise it will remain as nil
  --* NOTE: this should only be used when the treesitter group/LSP semantic override to force the colour of comments is NON functional
  palette_overrides = gruvbox_palette_overrides, -- default value is nil 
})

