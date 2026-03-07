return {
  {
    -- Popup that shows available keybindings by prefix.
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    -- Statusline.
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    -- Indentation guides.
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      indent = { char = '┊' },
    },
  },
}
