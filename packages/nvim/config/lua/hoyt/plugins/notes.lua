return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*", -- Pin Neorg to the latest stable release
    keys = {
      { '<localleader>nq', "<Plug>Neorg return<CR>", desc = '[neorg] Close notes', silent = true }
    },
    config = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            folds = false
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.itero"] = {}
      },

      --   ["core.concealer"] = {
      --     config = {
      --       icons = {
      --       default_workspace = "notes",
      --         todo = {
      --           undone = {
      --             icon = " ",
      --           },
      --         },
      --       },
      --     },
      --   },
      --   -- ["core.export"] = {
      --   --   config = {
      --   --     export_dir = "~/log/",
      --   --   },
      --   -- },
      --   -- ["core.integrations.nvim-cmp"] = {},
      --   ["core.dirman"] = {
      --     config = {
      --       index = "main.norg",
      --     },
      --   },
    },
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
}
