return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- common
  use 'tpope/vim-fugitive' -- Git commands
  use 'rhysd/vim-grammarous' -- grammar check
  use 'andymass/vim-matchup' -- matching parens and more
  use 'bronson/vim-trailing-whitespace' -- highlight trailing spaces
  use 'rhysd/git-messenger.vim'
  use 'gruvbox-community/gruvbox' -- colorscheme
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-repeat'
  use 'mortepau/codicons.nvim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use { 'lewis6991/gitsigns.nvim', -- git added/removed in sidebar + inline blame
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        current_line_blame = false
      })
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- general dev
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'  -- use LspInstall 'language'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/eslint.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'nvim-treesitter/nvim-treesitter'
  use 'scrooloose/nerdcommenter' -- commenting shortcuts
  use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          require("lspsaga").setup({})
      end,
      requires = {
          {"nvim-tree/nvim-web-devicons"},
          -- Requires markdown and markdown_inline parser
          {"nvim-treesitter/nvim-treesitter"}
      }
  })

  require('nvim-treesitter.configs').setup {
  ensure_installed = { "html", "json", "lua", "python", "bash", "typescript" },
  auto_install = false,       -- disables auto-install of missing parsers
  sync_install = false,
  highlight = { enable = true },
}

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
  )
 -- require'lspsaga'.init_lsp_saga {
    -- error_sign = '!',
    -- warn_sign = '^',
    -- hint_sign = '?',
    -- infor_sign = '~',
    -- border_style = "round",
    -- code_action_prompt = {
      -- enable = false
    -- }
  -- }

  -- search
  use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
  --use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use 'tpope/vim-eunuch' -- wrappers UNIX commands
  use 'tpope/vim-surround' -- surround characters shortcuts
  use 'tpope/vim-vinegar' -- file browser
  use 'kyazdani42/nvim-web-devicons' -- icons when searching
  
  -- testing
  use 'kassio/neoterm' -- terminal wrapper
  use 'janko-m/vim-test' -- testing commands

  -- javascript
  use { 'HerringtonDarkholme/yats.vim', ft = 'typescript' }
  use { 'posva/vim-vue' } -- Vue highlighting
  use 'othree/javascript-libraries-syntax.vim'

  -- python
  use { 'Vimjas/vim-python-pep8-indent', ft = 'python' }


end)
