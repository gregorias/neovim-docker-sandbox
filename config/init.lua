require'utils'
local packer_bootstrap = utils.bootstrap_packer()
require'packer'.startup(function(use)
  use'wbthomason/packer.nvim'
  use{
    'nvim-treesitter/nvim-treesitter',
    run = function()
      -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require'nvim-treesitter.configs'.setup{
        ensure_installed = "all",
      }
    end
  }
  if packer_bootstrap then
    require'packer'.sync()
  end
end)