require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- change scale function
local function change_scale(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
end

local function change_trans(delta)
  local new_trans = vim.g.neovide_opacity + delta
  if new_trans <= 1.0 and new_trans >= 0.0 then
    vim.g.neovide_opacity = vim.g.neovide_opacity + delta
  end
end

-- mapping to change neovide scale factor
map("n", "<C-=>", function() change_scale(0.05) end, { desc = "Increase font size" })
map("n", "<C-->", function() change_scale(-0.05) end, { desc = "Decrease font size" })
map("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end, { desc = "Reset font size" })

-- mapping to change neovide transparency
map("n", "<C-+>", function() change_trans(0.1) end, { desc = "Increase transparency" })
map("n", "<C-_>", function() change_trans(-0.1) end, { desc = "Decrease transparency" })
