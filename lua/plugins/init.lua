local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
    {
        'echasnovski/mini.nvim',
        config = 'plugins.statusline',
    },
    {
        'iamcco/markdown-preview.nvim',
        run = function ()
            vim.fn["mkdp#util#install"]()
        end,
        config = 'plugins.markdown',
    },
    {
        "NeogitOrg/neogit",
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('neogit').setup {}
        end,
    },
    {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'folke/neodev.nvim',
            'L3MON4D3/LuaSnip',
        },
        config = 'plugins.lsp',
    },
    {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        branch = '0.1.x',
        config = 'plugins.telescope',
    },
    {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        config = 'plugins.tree',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        requires = 'yaocccc/nvim-hl-mdcodeblock.lua',
        run = ':TSUpdate',
        config = 'plugins.treesitter',
    },
    {
        'tanvirtin/monokai.nvim',
        config = 'colors',
    },
    {
        'rcarriga/nvim-dap-ui',
        requires = {
            'mfussenegger/nvim-dap',
        },
        config = 'plugins.dap',
    },
}

