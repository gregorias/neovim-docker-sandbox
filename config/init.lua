require'utils'
local packer_bootstrap = utils.bootstrap_packer()
require'packer'.startup(function(use)
  use'wbthomason/packer.nvim'
  if packer_bootstrap then
    require'packer'.sync()
  end
end)
