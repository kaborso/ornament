win = am.window{
    title = "ornament",
    width = 640,
    height = 480,
}

canvas_img = [[
..........
..........
..........
..........
..........
..........
..........
..........
..........
..........
]]

win.scene =
  am.group{
    am.scale(64, 48)
    ^ am.sprite(canvas_img):tag"canvas"
    ,
    am.translate(-(win.width * .4), -(win.height * .45))
    ^ am.text(""):tag"mouse_coords"
}

win.scene:action(function(scene)
  local mouse_pos = win:mouse_position()
  local mouse_coords = coords(mouse_pos)

  scene:replace("mouse_coords", am.text(mouse_coords[1] .. ", " .. mouse_coords[2]):tag"mouse_coords")

  if win:mouse_pressed"left" then
      canvas_img = setCharacter(canvas_img, mouse_pos[1], mouse_pos[2], 'y')
      scene:replace("canvas", am.sprite(canvas_img):tag"canvas")
  end
end)

--- Computes coordinates relative to an upper-left origin.
function coords(vector2)
  return vec2(math.floor(vector2[1] + (win.width / 2)),
              math.floor(win.height / 2 - vector2[2]))
end

--- Replaces character at a point in a "10x10" string.
function setCharacter(old_string, target_x, target_y, character)
  local new_string = ""
  local length = math.floor(string.len(old_string)/10)
  local index = 0
  local target_x = 1 + math.floor(((target_x + (win.width / 2)) + 10) / (win.width / 10))
  local target_y = 1 + math.floor((((win.height / 2) + 10) - target_y) / (win.height / 10))

  for y=1,length do
    for x=1,length do
      index = index + 1
      if (x == target_x and y == target_y) then
        new_string = new_string .. character
      else
        new_string = new_string .. string.sub(old_string, index, index)
      end
    end
  end

  return new_string
end
