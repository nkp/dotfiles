-- tile.lua

-- Available space on the screen is a "bucket"
-- Buckets can use up the same space (2x1 bucket equivalent to 2 1x1 buckets)
--
-- Tiles go in buckets. Put biggest tiles first.


ext.tile = {}

function ext.tile.tile_screen(win)

  local wins = win:otherwindows_samescreen()
  local grid = ext.grid

  local frames = fnutils.map(wins, window.frame)
  table.sort(frames)

  for i = #frames, 1, -1 do
    
  end

end
