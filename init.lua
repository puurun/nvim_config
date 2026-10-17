require('core.options')
require('core.autocmds')
if not vim.g.vscode then
  require('core.keymaps')
end
require('lazy_setup')
