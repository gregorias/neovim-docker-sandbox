local M = {}
utils = M

-- | Fetches Packer if not present.
--
-- Returns whether it has installed Packer.
function M.bootstrap_packer()
  -- https://github.com/wbthomason/packer.nvim#bootstrapping
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

return utils
