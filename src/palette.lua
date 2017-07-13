-- @module palette
local Button = require('src.button')

function palette(opts)
  local opts = opts or {}
  local self = {
    height = opts.height or 96,
    toprow = opts.toprow or {"W", "K", "R", "Y", "G", "C", "B", "M", "O"},
    botrow = opts.botrow or {"w", "k", "r", "y", "g", "c", "b", "m", "o"},
    buttons = {}
  }

  for i,v in ipairs(self.toprow) do
    self.buttons[i] =
      Button({color = v, col = i, row = 2})
  end

  for i,v in ipairs(self.botrow) do
    self.buttons[i + table.getn(self.toprow)] =
      Button({color = v, col = i, row = 1})
  end

  function update_color(color, coords)
    for i, button in pairs(self.buttons) do
      if button.check_collision(coords.x, coords.y) then
        color = button.color
      end
    end
    return color
  end

  return {
    height = self.height,
    width = self.width,
    buttons = self.buttons,
    update_color = update_color
  }
end

return palette
