return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      cmdline = { enabled = true },
      messages = { enabled = true },
      -- disable popupmenu to avoid overlap with blink.cmp
      popupmenu = { enabled = false },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      routes = {
        { filter = { event = "msg_show" }, opts = { skip = true } },
      },
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = { enabled = true },
      select = { enabled = true },
    },
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      focus = true,
      modes = {
        preview = { multiline = true },
      },
    },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble diagnostics" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble buffer diagnostics" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Trouble quickfix" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Trouble loclist" },
      { "<leader>xs", "<cmd>Trouble symbols toggle<CR>", desc = "Trouble symbols" },
    },
  },

  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    opts = { func_map = { vsplit = "", split = "" } },
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      "*",
      css = { css_fn = true },
      html = { mode = "foreground" },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
    },
  },
}
