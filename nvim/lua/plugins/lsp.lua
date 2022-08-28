require('nvim-lsp-installer').setup {}

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'tsserver', 'sumneko_lua' }

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
  }
end
