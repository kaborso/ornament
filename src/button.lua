-- @module button
local Button = require('src.button')

function button(opts)
  local opts = opts or {}
  local self = {
    height = opts.height or 48,
    width = opts.width or 64,
    color = opts.color or "*",
    col = opts.col or 1,
    row = opts.row or 1,
    window_x = 0,
    window_y = 0
  }

  self.x = self.width * self.col
  self.y = self.height * self.row

  local prepare_bounds = function(x, y, callback)
    self.window_x = x
    self.window_y = y
    self.ymax = self.window_y + (self.height / 2)
    self.ymin = self.window_y - (self.height / 2)
    self.xmax = self.window_x + (self.width / 2)
    self.xmin = self.window_x - (self.width / 2)
    callback(x, y)
  end

  local check_collision = function(x, y)
    if (x < self.xmax) and (x > self.xmin) and (y < self.ymax) and (y > self.ymin) then
      return true
    else
      return false
    end
  end

  return {
    height = self.height,
    width  = self.width,
    color  = self.color,
    sprite  = self.color .. "\n",
    x = self.x,
    y = self.y,
    window_x = self.window_x,
    window_y = self.window_y,
    prepare_bounds = prepare_bounds,
    check_collision = check_collision
  }
end

return button
