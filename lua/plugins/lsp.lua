vim.g.coq_settings = { auto_start = 'shut-up' }

require("neodev").setup {
  library = { plugins = { "nvim-dap-ui" }, types = true },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.hls.setup {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  },
  capabilities = capabilities,
}

lspconfig.svls.setup {
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
}

local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
      },
    mapping = cmp.mapping.preset.insert {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
