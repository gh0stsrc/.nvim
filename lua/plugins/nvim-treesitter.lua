--* --------------------------------------------------------------- *--
--?                          treesitter Setup                       ?--
--* --------------------------------------------------------------- *--
--* Note      : tree-sitter is a parser generator tool and an incremental parsing library. 
--*             It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited.
--! IMPORTANT : required for IDE functionality such as parsing, syntax highlighting, code analysis and incremental selection.

require("nvim-treesitter.configs").setup({
  ensure_installed = {"c", "lua", "vim", "go", "javascript", "typescript", "rust", "dockerfile", "python", "bash", "hcl", "rego", "markdown_inline"},
  highlight = {
    enable = true,
  }
})

