return {
  {
    'folke/tokyonight.nvim',
		lazy = false
  },
	{
		"rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme kanagawa-wave]])
    end,
	},
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = false,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
  }
}
