return {
  { 'folke/tokyonight.nvim', lazy = false, },
  { 'oxfist/night-owl.nvim', lazy = false, },
	{ "ellisonleao/gruvbox.nvim", lazy = false, },
	{ "shaunsingh/nord.nvim", lazy = false, },
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
    -- priority = 1000,
    -- config = function()
    --   require('kanagawa').setup({
    --     theme = "wave",
    --     overrides = function(colors)
    --       return {
    --         Type = { fg = colors.palette.lotusRed2 },
    --       }
    --     end,
    --   })
    --
    --   vim.cmd([[colorscheme kanagawa]])
    -- end,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = true,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
  },
  {
    'UtkarshVerma/molokai.nvim',
    lazy = true,
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = "deep"
      })

      vim.cmd([[colorscheme onedark]])
    end
  },
}
