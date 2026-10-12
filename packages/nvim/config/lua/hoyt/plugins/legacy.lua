return { -- legacy plugins from my old vim configuration
  -- Send text from vim buffer to tmux
  {
    "jgdavey/tslime.vim",
    init = function()
      vim.g["tslime_ensure_trailing_newlines"] = 1
    end,
  },

  -- Run tests in tmux
  -- {
  --   "jgdavey/vim-turbux",
  --   keys = {
  --     { '\\t', '<Plug>SendTestToTmux<CR>', desc = 'Run entire test' },
  --     { '\\T', '<Plug>SendFocusedTestToTmux<CR>', desc = 'Run nearest test' },
  --   }
  -- },

  -- Test runner
  {
    "vim-test/vim-test",
    init = function()
      vim.g["test#javascript#runner"] = "vitest"
      vim.g["test#strategy"] = "tslime"
    end,
    cmd = {
      "TestNearest",
      "TestFile",
      -- "TestSuite",
      -- "TestLast",
      -- "TestVisit",
    },
    keys = {
      { '\\t', '<cmd>TestFile<CR>', desc = 'Run test file' },
      { '\\T', '<cmd>TestNearest<CR>', desc = 'Run nearest test' },
    }
  },

  -- case coercions
  { "tpope/vim-abolish" },

  -- git blame
  { "tpope/vim-fugitive" },

  -- default rails projections
  {
    "tpope/vim-rails",
    dependencies = { "tpope/vim-projectionist" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "eruby.yaml",
        command = "set filetype=yaml",
      })
    end,
  },

  -- slim syntax highlighting
  {
    "slim-template/vim-slim",
    ft = "slim"
  },

  -- emacs bindings
  { "tpope/vim-rsi" },

  {
    'eandrju/cellular-automaton.nvim',
    keys = {
      { '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>' }
    }
  }
}
