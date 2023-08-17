local before = {
  'before.vim_options',
}

for _, module in ipairs(before) do
  require(module)
end

require('lazy_setup')

local after = {
  'after.keymaps',
}

for _, module in ipairs(after) do
  require(module)
end

