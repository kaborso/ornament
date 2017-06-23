local Canvas = require('canvas')

function main(canvas)
  win = am.window{
      title = "ornament",
      width = canvas.width,
      height = canvas.height,
  }

  win.scene =
    am.group{
      -- am.scale(canvas.xScale, canvas.yScale)
      am.scale(canvas.xScale, canvas.yScale)
      ^ am.sprite(canvas.string):tag"canvas"
      ,
      am.translate(-(win.width * .4), -(win.height * .45))
      ^ am.text(""):tag"mouse_coords"
  }

  win.scene:action(function(scene)
    local mouse_pos = win:mouse_position()
    local mouse_coords = canvas.coords(mouse_pos)

    scene:replace("mouse_coords", am.text(mouse_coords[1] .. ", " .. mouse_coords[2]):tag"mouse_coords")

    if win:mouse_pressed"left" then
        local canvas_img = canvas.setCharacter(mouse_pos[1], mouse_pos[2], 'y')
        scene:replace("canvas", am.sprite(canvas_img):tag"canvas")
    end
  end)
end

window = {width = 640, height = 480, xScale = 64, yScale = 48, size = 10}
main(Canvas(window))
