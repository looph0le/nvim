require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g

o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber = true -- enable relative line numbers

-- neovide config
o.guifont = "SF Mono:h9.5" -- set the font for GUI applications
g.neovide_opacity = 1.0 -- set the opacity for Neovide
g.neovide_scale_factor = 1.0  -- default zoom level
