require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g

o.relativenumber = true -- enable relative line numbers

-- neovide config
o.guifont = "SF Mono:h9.5" -- set the font for GUI applications
g.neovide_opacity = 1.0 -- set the opacity for Neovide
g.neovide_scale_factor = 2.0  -- default zoom level
g.neovide_cursor_vfx_mode = "pixiedust"
g.neovide_cursor_vfx_particle_density = 2.0
g.neovide_cursor_vfx_particle_lifetime = 0.8
g.neovide_cursor_vfx_particle_highlight_lifetime = 0.9
o.cmdheight = 0
