local Canvas = require('src.canvas')
local Palette = require('src.palette')

function main(canvas, palette)
  win = am.window{
      title = "ornament",
      width = canvas.width,
      height = canvas.height + palette.height
  }

  win.scene =
    am.group{
      am.scale(canvas.xScale, canvas.yScale)
      ^ am.sprite(canvas.string):tag"canvas"
      ,
      am.translate((win.width * .4), (win.height * .45))
      ^ am.text(""):tag"mouse_coords",
  }

  local left_color = 'r'
  local mid_color = 'g'
  local right_color = 'b'

  for i, button in pairs(palette.buttons) do
    palette.buttons[i].
      prepare_bounds(
        button.x + -(win.width * .5),
        -(-button.y + (button.height / 2)+ (win.height / 2)),
        function(x, y)
          win.scene:append(am.translate(x, y)
          ^ am.scale(button.width, button.height)
          ^ am.sprite(button.sprite):tag("btn_" .. button.color))
        end)
  end

  win.scene:action(function(scene)
    local mouse_pos = win:mouse_position()
    local mouse_coords = canvas.coords(mouse_pos)

    scene:replace("mouse_coords", am.text(mouse_coords[1] .. ", " .. mouse_coords[2]):tag"mouse_coords")

    if win:mouse_pressed"left" then
      if mouse_coords.y < canvas.height then
        local canvas_img = canvas.setCharacter(mouse_pos[1], mouse_pos[2], left_color)
        scene:replace("canvas", am.sprite(canvas_img):tag"canvas")
      else
        left_color = palette.update_color(left_color, mouse_pos)
      end
    end
    if win:mouse_pressed"right" then
      if mouse_coords.y < canvas.height then
        local canvas_img = canvas.setCharacter(mouse_pos[1], mouse_pos[2], right_color)
        scene:replace("canvas", am.sprite(canvas_img):tag"canvas")
      else
        right_color = palette.update_color(right_color, mouse_pos)
      end
    end
    if win:mouse_pressed"middle" then
      if mouse_coords.y < canvas.height then
        local canvas_img = canvas.setCharacter(mouse_pos[1], mouse_pos[2], mid_color)
        scene:replace("canvas", am.sprite(canvas_img):tag"canvas")
      else
        mid_color = palette.update_color(mid_color, mouse_pos)
      end
    end
  end)
end

main(Canvas(), Palette({height = 192}))
