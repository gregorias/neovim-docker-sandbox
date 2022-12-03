require'utils'
local packer_bootstrap = utils.bootstrap_packer()
vim.cmd('packadd packer.nvim')
require'packer'.startup(function(use)
  use{ 'wbthomason/packer.nvim',
    opt = true,
  }
  use{ 'nvim-treesitter/nvim-treesitter',
      -- Use a specific commit to prevent costly updates downstream.
    commit = '2568022',
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
