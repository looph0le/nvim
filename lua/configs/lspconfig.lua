require("nvchad.configs.lspconfig").defaults()

local servers = {"html", "cssls" , "ts_ls", "rust_analyzer"}

local lspconfig = require("lspconfig")
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = require("nvchad.configs.lspconfig").on_attach,
    capabilities = require("nvchad.configs.lspconfig").capabilities,
  }
end
-- read :h vim.lsp.config for changing options of lsp servers 
