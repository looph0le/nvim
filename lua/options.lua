require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g

o.relativenumber = true -- enable relative line numbers

-- neovide config
-- o.guifont = "Iosevka Nerd Font Mono:h9.5" -- set the font for GUI applications
o.guifont = "CaskaydiaCove Nerd Font:h12" -- set the font for GUI applications
g.neovide_opacity = 0.9 -- set the opacity for Neovide
-- g.neovide_scale_factor = 2.0  -- default zoom level
g.neovide_cursor_vfx_mode = "pixiedust"
g.neovide_cursor_vfx_particle_density = 2.0
g.neovide_cursor_vfx_particle_lifetime = 0.8
g.neovide_cursor_vfx_particle_highlight_lifetime = 0.9
vim.g.neovide_window_blurred = true

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
