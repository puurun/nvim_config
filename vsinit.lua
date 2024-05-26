require('before/vim_options')
require('lazy_setup')
require('plugins/basic')
require('after/keymaps')

local vscode = require('vscode-neovim')

vim.keymap.set("i", "<C-c>", function() 
  vim.cmd('stopinsert')
  vscode.action('workbench.action.files.save')
end)
