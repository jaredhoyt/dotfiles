-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { ',e', ':Neotree float toggle<CR>', desc = 'NeoTree toggle', silent = true },
    { ',.', ':Neotree float reveal reveal_force_cwd<CR>', desc = 'NeoTree reveal', silent = true },
    { ',b', ':Neotree toggle show buffers right<CR>', desc = 'NeoTree buffers' },
    { ',g', ':Neotree float git_status<CR>', desc = 'NeoTree git status' },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "disabled",
      filtered_items = {
        hide_gitignored = false,
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".DS_Store",
          --"thumbs.db"
        },
        never_show_by_pattern = { -- uses glob style patterns
          "*.un~",
          "*.swp",
        },
      },
      window = {
        mappings = {
          -- These are mostly just old NerdTree settings
          -- (muscle memory is a hellofa drug)
          ['x'] = 'close_node',
          ['u'] = 'navigate_up',
          ['C'] = 'set_root'
        },
      },
    },
  },
}
