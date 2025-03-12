return {
  'nvim-treesitter/nvim-treesitter',
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "csv", "dockerfile", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "html", "http", "java", "javascript", "json", "lua", "make", "perl", "php", "python", "regex", "ruby", "rust", "sql", "strace", "tmux", "typescript", "vim", "xml", "kotlin" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  },
}
