-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          cmd = {
            "omnisharp",
          },
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "dprint" },
        typescript = { "dprint" },
        javascriptreact = { "dprint" },
        typescriptreact = { "dprint" },
        css = { "dprint" },
        html = { "dprint" },
      },
    },
  },
}
