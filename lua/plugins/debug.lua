return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.after.event_terminated["dapui_config"] = dapui.close
      dap.listeners.after.event_exited["dapui_config"] = dapui.close

      require("nvim-dap-virtual-text").setup()

      -- Python adapter
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.stdpath "data" .. "/mason/bin/debugpy-adapter",
        args = {},
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return vim.fn.input("Path to python: ", vim.fn.getcwd() .. "/.venv/bin/python")
          end,
        },
      }
    end,
  },
}
