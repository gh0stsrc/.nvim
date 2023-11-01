--* --------------------------------------------------------------- *--
--?            Language Server Protocol & interface Setup           ?--
--* --------------------------------------------------------------- *--

local lsp = require("lsp-zero").preset("recommended")

-- list of language servers, debugger adapters, linters and formatters to be installed by mason and leveraged by lsp-zero
lsp.ensure_installed({
  "lua_ls",
  "tsserver",
  "gopls",
  "eslint",
  "rust_analyzer",
  "terraformls",
  "tflint",
  "bashls",
  "dockerls",
  "helm_ls", -- TODO: need to figure out why the Helm language server is not rendering properly
  "pyright",
  "marksman",
  -- "yamls", -- IMPORTANT: disabled on purpose, see configurations for more details
})

-- configure lsp preferences
lsp.set_preferences({
  sign_icons = {}
})

-- integration and keybindings for telescope functionality (on attach - before setup)
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({{buffer = bufnr}})
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer = true})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- hover over documentation preview
  vim.keymap.set("n", "<M-r>", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "hl", function() vim.lsp.buf.document_highlight() end, opts)
  vim.keymap.set("n", "hc", function() vim.lsp.buf.clear_references() end, opts)
  vim.keymap.set("n", "ds", function() vim.lsp.buf.document_symbol() end, opts)
  vim.keymap.set("n", "ws", function() vim.lsp.buf.workspace_symbol() end, opts)
end)

-- invoke lsp setup
lsp.setup()

-- attach lsp handler(s)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    virtual_text = true,
    underline = false,
  }
)

