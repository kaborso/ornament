-- @module canvas
function newCanvas(opts)
  local opts = opts or {}
  local self = {
    width = opts.width or 640,
    height = opts.height or 480,
    xScale = opts.xScale or 64,
    yScale = opts.yScale or 48,
    size = opts.size or 10
  }

  local row = string.rep(".", self.size) .. "\n"
  local rows = string.rep(row, self.size)

  self.canvas = rows

  --- Computes coordinates relative to an upper-left origin.
  local coords = function (vector2)
    return vec2(math.floor(vector2[1] + (self.width / 2)),
                math.floor(self.height / 2 - vector2[2]))
  end

  --- Replaces character at a point in string representation of a grid.
  local setCharacter = function (target_x, target_y, character)

    local old_canvas = self.canvas:gsub("\n", "_")
    local new_canvas = ""
    local target_x = 1 + math.floor(((target_x + (self.width / 2)) + self.size) / (self.width / self.size))
    local target_y = 1 + math.floor((((self.height / 2) + self.size) - target_y) / (self.height / self.size))
    local rows = ""
    local row = ""
    local index = 1

    for y=1,self.size do
      for x=1,self.size + 1 do
        if (x == target_x and y == target_y) then
          row = row .. character
        else
          row = row .. self.canvas:sub(index, index)
        end
        index = 1 + index
      end
      rows = rows .. row
      row = ""
    end
    self.canvas = rows
    return rows
  end

  return {
    string = self.canvas,
    height = self.height,
    width = self.width,
    xScale = self.xScale,
    yScale = self.yScale,
    size = self.size,
    coords = coords,
    setCharacter = setCharacter
  }
end

return newCanvas
