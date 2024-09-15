return {
  {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      dependencies = {
          --- Uncomment the two plugins below if you want to manage the language servers from neovim
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- LSP Support
          {'neovim/nvim-lspconfig'},
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      },
      config = function ()
local cmp = require("cmp")
-- cmp.setup({
    --   --mapping = cmp.mapping.preset.insert
    require('lsp-zero')
    require('lspconfig').lua_ls.setup({})
    require('lspconfig').rust_analyzer.setup{}

    require('cmp').setup({
        mapping = cmp.mapping.preset.insert({
            -- confirm completion
            ['<CR>'] = cmp.mapping.confirm({select = true}),
            -- scroll up and down the documentation window
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
    })


        
      end
  },
}
