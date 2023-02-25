require'utils'
utils.bootstrap_lazy()
require'lazy'.setup({
  { 'nvim-treesitter/nvim-treesitter',
    build = function()
      -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
      local ts_update = require'nvim-treesitter.install'.update{with_sync = true}
      ts_update()
    end,
    config = function()
      require'nvim-treesitter.configs'.setup{
        ensure_installed = "all",
      }
    end,
  },
  },
  {
    concurrency = 16,
    ui = {
      border = "single",
    },
  }
)
