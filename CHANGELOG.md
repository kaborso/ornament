# Change Log
All notable changes to this project will be documented in this file. This change log follows the conventions of [keepachangelog.com](http://keepachangelog.com/).

## [Unreleased] - 2017-07-13
### Added
- Spiked out color changing solution & support for button 'clicking'
- New funs *(need coverage)*
  - `button.lua`  -- `prepare_bounds()` & `check_collision()`
  - `palette.lua` -- `update_color()`

### Changed
- Corrected sleep-deprived typos
- Palette rendering loop
- Main scene's action fun
  - Now supports three kinds of mouse clicks
  - Now offers three colors for 'painting'
  - Distinguish clicks between canvas and palette

## [Unreleased] - 2017-07-04
### Added
- Fleshed out basic rendering and positioning for palette buttons

### Changed
- Moved where mouse coordinates appear
- Changed `main()` to take palette instance as parameter
- Window height now equals palette height + canvas height

## [Unreleased] - 2017-06-16
### Added
- Basic project files (license, .gitignore, readme)
- Main Lua file
