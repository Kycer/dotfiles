vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- UI

  use "lewis6991/impatient.nvim"
  use "rcarriga/nvim-notify"
  -- lua functions
  use "nvim-lua/plenary.nvim"
  -- neovim ui components
  use "MunifTanjim/nui.nvim"
  use "stevearc/dressing.nvim"
  -- icon
  use "kyazdani42/nvim-web-devicons"
   -- status line
  use "windwp/windline.nvim"
  -- clickable buffer line
  use "akinsho/nvim-bufferline.lua"
  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly'
  }
  use "norcalli/nvim-colorizer.lua"
  use "j-hui/fidget.nvim"

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "romgrk/nvim-treesitter-context"

  use "Mofiqul/dracula.nvim"

  -- Telescope
  use "nvim-telescope/telescope-live-grep-args.nvim"
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-rg.nvim"

  -- LSP
  -- lsp support
  use "neovim/nvim-lspconfig"
  -- symbol outline by lsp
  use "williamboman/nvim-lsp-installer"
  use "kosayoda/nvim-lightbulb"
  use "ray-x/lsp_signature.nvim"

  -- auto pairs
  use "windwp/nvim-autopairs"
  -- auto tags
  use "windwp/nvim-ts-autotag"
  use "terrortylor/nvim-comment"
  use "Shatur/neovim-session-manager"
  -- cmp plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  use "ethanholz/nvim-lastplace"
  use "tpope/vim-repeat"
  use "tpope/vim-surround"
  use "folke/which-key.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use 'sindrets/diffview.nvim'

  use "voldikss/vim-translator"
  use "ravenxrz/vim-local-history"
  use "Pocco81/AutoSave.nvim"
  use "djoshea/vim-autoread"

end)
