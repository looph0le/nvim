return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      size = 20,
      hide_numbers = true,
      start_in_insert = true,
      direction = "float",
      float_opts = { border = "rounded" },
    },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Float terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<CR>", desc = "Vertical terminal" },
    },
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.stdpath "state" .. "/sessions/",
      options = { "buffers", "curdir", "tabpages", "winsize" },
    },
    keys = {
      { "<leader>qs", function() require("persistence").save() end, desc = "Save session" },
      { "<leader>ql", function() require("persistence").load() end, desc = "Load last session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Stop session persistence" },
    },
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undotree toggle" },
    },
  },

  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-python") {
            dap = { justMyCode = false },
          },
          require "neotest-plenary",
        },
      }
    end,
    keys = {
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tR", function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run file tests" },
      { "<leader>td", function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug nearest test" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output.open() end, desc = "Open test output" },
    },
  },
}
