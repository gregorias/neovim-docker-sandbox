-- | Fetches Lazy if not present.
local function bootstrap_lazy()
  local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system{
      'git', 'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)
end
bootstrap_lazy()

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
