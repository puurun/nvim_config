-- Remap for space to not interfere with leader
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Set highlight on search
vim.o.hlsearch = false

-- Toggle Line numbers and relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Enable 24-bit terminal colors
vim.o.termguicolors = true

-- Enusre I have some space when I am scrolling
vim.opt.scrolloff = 8

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


