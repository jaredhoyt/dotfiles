return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    branch = 1, -- use git branch to save session
  },
  keys = {
    { "<leader>q.", function() require("persistence").load() end, desc = 'Load session for current dir' },
    { "<leader>qs", function() require("persistence").select() end, desc = 'Select a session to load' },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = 'Load last session' },
    { "<leader>qq", function() require("persistence").stop() end, desc = "Don't save session" },
  },
}
