-- @module button
local Button = require('src.button')

function button(opts)
  local opts = opts or {}
  local self = {
    height = opts.height or 48,
    width = opts.width or 64,
    color = opts.color or "*",
    col = opts.col or 1,
    row = opts.row or 1
  }

  return {
    height = self.height,
    width  = self.width,
    color  = self.color,
    sprite  = self.color .. "\n",
    x = self.width * self.col,
    y = self.height * self.row
  }
end

return button
