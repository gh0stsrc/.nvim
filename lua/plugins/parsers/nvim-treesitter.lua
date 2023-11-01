--* --------------------------------------------------------------- *--
--?                          treesitter Setup                       ?--
--* --------------------------------------------------------------- *--

-- NOTE      : tree-sitter is a parser generator tool and an incremental parsing library. 
--             It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited.
-- IMPORTANT : required for IDE functionality such as parsing, syntax highlighting, code analysis and incremental selection.

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" -- IMPORTANT: `c`, `lua`, `vim`, `vimdoc` and `query` should ALWAYS be installed
  ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "go", "javascript", "typescript", "rust", "dockerfile", "python", "bash", "hcl", "terraform", "rego", "markdown_inline"},
  -- enabled highlighting
  highlight = {
    enable = true,
  }
})

