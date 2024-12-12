return { -- legacy plugins from my old vim configuration
  -- Send text from vim buffer to tmux
  { "jgdavey/tslime.vim" },

  -- Run tests in tmux
  {
    "jgdavey/vim-turbux",
    keys = {
      { '\\t', '<Plug>SendTestToTmux<CR>', desc = 'Run entire test' },
      { '\\T', '<Plug>SendFocusedTestToTmux<CR>', desc = 'Run nearest test' },
    }
  },

  -- case coercions
  { "tpope/vim-abolish" },

  -- git blame
  { "tpope/vim-fugitive" },

  -- project configs
  { "tpope/vim-projectionist" },

  -- default rails projections
  { "tpope/vim-rails" },

  -- emacs bindings
  { "tpope/vim-rsi" },

  {
    'eandrju/cellular-automaton.nvim',
    keys = {
      { '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>' }
    }
  }
}
