-- @module canvas_test_suite
local canvas_test_suite = {}
local lunatest = require('lunatest.lunatest')
local assert_true, assert_false = lunatest.assert_true, lunatest.assert_false
local assert_equal, assert_not_equal = lunatest.assert_equal, lunatest.assert_not_equal
local assert_match, assert_not_match = lunatest.assert_match, lunatest.assert_not_match
local Canvas = require('src.canvas')

img = [[
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

four_three = {width = 640, height = 480, xScale = 64, yScale = 48, size = 10}
sixteen_nine = {width = 1280, height = 720, xScale = 128, yScale = 72, size = 100}

function canvas_test_suite.test_init()
  local c = Canvas()
  assert_equal(c.string, img)
end

function canvas_test_suite.test_coords_zero()
  local c = Canvas()
  local coords = c.coords(vec2(0, 0))
  assert_equal(coords.x, 320)
  assert_equal(coords.y, 240)
end
function canvas_test_suite.test_coords_negative()
  local c = Canvas()
  local coords = c.coords(vec2(-10, -10))
  assert_equal(coords.x, 310)
  assert_equal(coords.y, 250)
end

function canvas_test_suite.test_setCharacter()
  local c = Canvas({size = 2})
  assert_match("..\n.*", c.setCharacter(2, 2, "*"))
end

return canvas_test_suite
