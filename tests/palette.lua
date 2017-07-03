-- @module palette_test_suite
local palette_test_suite = {}
local lunatest = require('lunatest.lunatest')
local assert_true, assert_false = lunatest.assert_true, lunatest.assert_false
local assert_equal, assert_not_equal = lunatest.assert_equal, lunatest.assert_not_equal
local assert_match, assert_not_match = lunatest.assert_match, lunatest.assert_not_match
local Palette = require('src.palette')

function palette_test_suite.test_init()
end

return palette_test_suite
