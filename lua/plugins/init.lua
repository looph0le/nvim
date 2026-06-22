return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css",
        "typescript", "javascript", "python", "rust",
        "go", "yaml", "json", "bash", "markdown",
        "markdown_inline", "regex", "diff",
      },
    },
  },

  { "github/copilot.vim", lazy = false },

  { import = "plugins.lsp" },
  { import = "plugins.debug" },
  { import = "plugins.editor" },
  { import = "plugins.ui" },
  { import = "plugins.tools" },
}
