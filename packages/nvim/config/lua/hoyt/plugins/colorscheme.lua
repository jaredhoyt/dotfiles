return {
  { 'folke/tokyonight.nvim', lazy = false, },
  { 'oxfist/night-owl.nvim', lazy = false, },
	{ "ellisonleao/gruvbox.nvim", lazy = false, },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd([[colorscheme catppuccin]])
    -- end,
  },
	{
		"rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end,
	},
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = true,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
  }
}
