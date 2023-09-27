local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = '\\'

local prettier_filetypes = {
  "css",
  "graphql",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "less",
  "markdown",
  "scss",
  "typescript",
  "typescriptreact",
  "yaml",
}

vim.g.code_action_menu_show_diff = false
vim.g.code_action_menu_show_details = false
vim.g.code_action_menu_window_border = 'solid'

require('lazy').setup({
  { 'weilbith/nvim-code-action-menu' },
  {
    'MunifTanjim/prettier.nvim',
    ft = prettier_filetypes,
    opts = {
      ['null-ls'] = {
        function ()
          return require('prettier').config_exists({
            check_package_json = true
          })
        end
      },
      bin = 'prettier',
      filetypes = prettier_filetypes,
    }
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = {
      on_attach = function (client, bufnr)
        local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
        local event = "BufWritePre" -- or "BufWritePost"
        local async = event == "BufWritePost"

        if client.supports_method("textDocument/formatting") then
           vim.keymap.set("n", "<Leader>p", function()
             vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
           end, { buffer = bufnr, desc = "[lsp] format" })

         -- format on save
         vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
         vim.api.nvim_create_autocmd(event, {
           buffer = bufnr,
           group = group,
           callback = function()
             vim.lsp.buf.format({ bufnr = bufnr, async = async })
           end,
           desc = "[lsp] format on save",
         })
        end
      end
    },
    dependencies = {
      'MunifTanjim/prettier.nvim'
    }
  },
  { 'folke/neodev.nvim' },
  {
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd('autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey') -- to Show whitespace, MUST be inserted BEFORE the colorscheme command
      require('onedark').load()
    end,
    lazy = false
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim'
    },
    config = function ()
      local tele = require('telescope')
      local actions = require('telescope.actions')
      tele.load_extension('fzf')
      tele.setup{
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              width = 0.9,
              height = 0.9
            }
          },
          mappings = {
            n = {
              ['q'] = actions.close
            },
          },
        }
      }
    end
  },
  { 'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig'
    },
    lazy = false,
    config = function()
      require('mason').setup()
    end
  },
  { 'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup()
      require('mason-lspconfig').setup_handlers {
        function (server_name) -- default handler (optional)
          local lspconfig = require('lspconfig')
          local capabilities = require('cmp_nvim_lsp').default_capabilities()

          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                completion = {
                  callSnippet = "Replace"
                }
              }
            },
            capabilities = capabilities
          })
          lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = function ()
              vim.opt.signcolumn = "no"
            end
          }
        end,
      }
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'folke/neodev.nvim'
		},
    lazy = false
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
          automatic_installation = true,
          ensure_installed = {
            'bash',
            'c',
            'css',
            'csv',
            'git_rebase',
            'git_config',
            'gitcommit',
            'gitignore',
            'html',
            'javascript',
            'json',
            'lua',
            'query',
            'typescript',
            'sql',
            'vim',
            'vimdoc'
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },
  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    config = function()
      local cmp = require 'cmp'

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Esc>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.abort()
              fallback()
              -- NOTE
              -- Since `abort` does not change mode, but aborts autocompletion,
              -- abort + fallback are used in combination to return to normal mode
            else
              fallback()
            end
          end, { 'i', 'c' }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
          { name = 'calc' }
        }, {
          { name = 'buffer', option = { keyword_length = 6 } }
        }),
        enabled = function()
          -- disable completion in comments
          local context = require 'cmp.config.context'
          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture("comment")
              and not context.in_syntax_group("Comment")
          end
        end
      }


      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' },
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

    end,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc'
    }
  },
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    event = 'VeryLazy'
  },
  { 'saadparwaiz1/cmp_luasnip', event = 'VeryLazy' },
  { 'hrsh7th/cmp-nvim-lsp', event = 'VeryLazy' },
  { 'hrsh7th/cmp-buffer', event = 'VeryLazy' },
  { 'hrsh7th/cmp-path', event = 'VeryLazy' },
  { 'hrsh7th/cmp-cmdline', event = 'VeryLazy' },
  { 'hrsh7th/cmp-calc', event = 'VeryLazy' },
  { 'MunifTanjim/prettier.nvim', event = 'VeryLazy' }
})

-- Keybinds

local map = function (mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = '\\'

map('n', '<Leader>f', '<cmd>Telescope find_files<cr>')
map('n', '<Leader>F', '<cmd>Telescope live_grep<cr>')
map('n', '<Leader>w', '<cmd>Telescope grep_string<cr>')
map('n', '<Leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<Leader>c', '<cmd>Telescope git_bcommits<cr>')
map('n', '<Leader>C', '<cmd>Telescope git_commits<cr>')
map('n', '<C-f>', '<cmd>Telescope resume<cr>')

map('n', '<Leader>gd', '<cmd>Telescope lsp_definitions<cr>')
map('n', '<Leader>gr', '<cmd>Telescope lsp_references<cr>')
map('n', '<Leader>gt', '<cmd>Telescope lsp_type_definitions<cr>')
map('n', '<Leader>gi', '<cmd>Telescope lsp_implementations<cr>')
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', '<Leader>a', '<cmd>CodeActionMenu<cr>')
map('n', '<Leader>p', '<cmd>lua vim.lsp.buf.formatting()<cr>')
map('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
map('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
map('n', '<Leader>ev', '<cmd>edit $MYVIMRC<cr>')

-- Config

vim.opt.termguicolors = true

vim.opt.wildignore = vim.opt.wildignore + "*/tmp/*,*.so,*.swp,*.zip"
vim.opt.undofile = true
vim.opt.wrap = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.autoindent = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.secure = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt = 'menu,menuone'

--require('lua/plugins')
--require('nvim-2/keybinds')
--require('nvim-2/config')
