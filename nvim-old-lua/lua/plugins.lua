-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end
  }

  -- Wait until 0.8
  --  use {
  --    'smjonas/inc-rename.nvim',
  --    config = function()
  --      require('inc_rename').setup()
  --    end
  --  }

  use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = [[ require('plugins/bqf') ]],
    requires = {
      'junegunn/fzf',
      opt = true
    }
  }

  use {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = [[ require('plugins/null-ls') ]],
    run = 'npm i -g prettier_d_slim'
  }

  use {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    config = [[ require('plugins/cmp') ]],
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc'
    }
  }

  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-calc'

  use {
    'neovim/nvim-lspconfig',
    config = [[ require('plugins/lsp') ]]
  }

  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
  }

  use {
    'williamboman/nvim-lsp-installer',
    requires = {
      'neovim/nvim-lspconfig'
    }
  }

  -- Post-install/update hook with neovim command
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[ require('plugins/treesitter') ]]
  }

  use {
    'navarasu/onedark.nvim',
    config = function() require('plugins/onedark') end
  }

  use 'nvim-lua/popup.nvim'

  use 'nvim-lua/plenary.nvim'

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = [[ require('plugins/telescope') ]],
    requires = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('plugins/lualine') end,
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

end)
