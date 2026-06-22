local ensure = {
  -- LSP servers
  "lua-language-server",
  "pyright",
  "rust-analyzer",
  "typescript-language-server",
  "html-lsp",
  "css-lsp",
  "json-lsp",
  "yaml-language-server",
  "bash-language-server",
  "tailwindcss-language-server",
  "emmet-ls",
  -- DAP adapters
  "debugpy",
  "codelldb",
  -- Formatters & linters
  "stylua",
  "prettier",
  "ruff",
  "shfmt",
}

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = { ensure_installed = ensure },
  },
}
