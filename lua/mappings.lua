require "nvchad.mappings"

local map = vim.keymap.set

-- Better escape & command
map("i", "jk", "<ESC>")
map("n", ";", ":", { desc = "CMD" })

-- Window navigation (Alt/Option + hjkl for Neovide / GUI)
map("n", "<M-h>", "<C-w>h", { desc = "Window left" })
map("n", "<M-j>", "<C-w>j", { desc = "Window down" })
map("n", "<M-k>", "<C-w>k", { desc = "Window up" })
map("n", "<M-l>", "<C-w>l", { desc = "Window right" })

-- Tab navigation
map("n", "<C-S-h>", "gT", { desc = "Prev tab" })
map("n", "<C-S-l>", "gt", { desc = "Next tab" })

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- Better paste
map("v", "p", '"_dP', { desc = "Paste without yank" })

-- Quick save & quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all" })

-- Clear search highlight on Esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })

-- Keep cursor centered after nav
map("n", "n", "nzzzv", { desc = "Next center" })
map("n", "N", "Nzzzv", { desc = "Prev center" })
map("n", "*", "*zzzv", { desc = "Search center" })
map("n", "#", "#zzzv", { desc = "Search back center" })
map("n", "g*", "g*zzzv", { desc = "Search word center" })
map("n", "g#", "g#zzzv", { desc = "Search word back center" })

-- Stay in visual after indent
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Quickfix navigation
map("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

-- DAP
map("n", "<F5>", function() require("dap").continue() end, { desc = "DAP continue" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "DAP step over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "DAP step into" })
map("n", "<F12>", function() require("dap").step_out() end, { desc = "DAP step out" })
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input "Condition: ") end, { desc = "Conditional breakpoint" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run last" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

-- Toggle options
map("n", "<leader>bb", "<cmd>nohlsearch<CR>", { desc = "No highlight" })

-- Neovide scale / transparency
local function change_scale(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
end

local function change_trans(delta)
  local t = vim.g.neovide_opacity + delta
  if t <= 1.0 and t >= 0.0 then
    vim.g.neovide_opacity = t
  end
end

map("n", "<C-=>", function() change_scale(0.05) end, { desc = "Increase font size" })
map("n", "<C-->", function() change_scale(-0.05) end, { desc = "Decrease font size" })
map("n", "<C-0>", function() vim.g.neovide_scale_factor = 1.0 end, { desc = "Reset font size" })
map("n", "<C-+>", function() change_trans(0.1) end, { desc = "Increase transparency" })
map("n", "<C-_>", function() change_trans(-0.1) end, { desc = "Decrease transparency" })
