local nls = require('null-ls')
local util = require 'vim.lsp.util'

local sources = {
  nls.builtins.diagnostics.tsc.with({
    prefer_local = 'node_modules/.bin'
  }),
  --  nls.builtins.diagnostics.sqlfluff.with({
  --    extra_args = { "--dialect", "postgres" }
  --  }),
  --  nls.builtins.formatting.sqlfluff.with({
  --    extra_args = { "--dialect", "postgres" }
  --  }),
  nls.builtins.formatting.prettier.with({
    prefer_local = 'node_modules/.bin',
  }),
}

nls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>p', function()
      local params = util.make_formatting_params({})
      client.request('textDocument/formatting', params, nil, bufnr)
    end, { buffer = bufnr })
  end

})
