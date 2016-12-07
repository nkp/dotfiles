-- grid.lua v2014.06.29

ext.grid = {}

ext.grid.MARGINX = 2
ext.grid.MARGINY = 2
ext.grid.GRIDWIDTH = 7
ext.grid.GRIDHEIGHT = 3
ext.grid.cells = {}

local function next_in_cell(index)
  local t = ext.grid.cells[index]
  n = table.remove(t)
  table.insert(t, 1, n)
  return n
end

local function serialise_frame(f)
  return 'x' .. f.x .. 'y' .. f.y .. 'w' .. f.w .. 'h' .. f.h
end

local function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

local function windowid(win)
  return win:application():bundleid() .. win:title()
end

function ext.grid.get(win)
  if not win then return nil end
  local winframe = win:frame()
  local screenrect = win:screen():frame_without_dock_or_menu()
  local segmentwidth = screenrect.w / ext.grid.GRIDWIDTH
  local segmentheight = screenrect.h / ext.grid.GRIDHEIGHT
  return {
    x = round((winframe.x - screenrect.x) / segmentwidth),
    y = round((winframe.y - screenrect.y) / segmentheight),
    w = math.max(1, round(winframe.w / segmentwidth)),
    h = math.max(1, round(winframe.h / segmentheight)),
  }
end

function ext.grid.set(win, grid, screen)
  local screenrect = screen:frame_without_dock_or_menu()
  local segmentnwidth = screenrect.w / ext.grid.GRIDWIDTH
  local segmentheight = screenrect.h / ext.grid.GRIDHEIGHT
  local newframe = {
    x = (grid.x * segmentnwidth) + screenrect.x,
    y = (grid.y * segmentheight) + screenrect.y,
    w = grid.w * segmentnwidth,
    h = grid.h * segmentheight,
  }

  newframe.x = newframe.x + ext.grid.MARGINX
  newframe.y = newframe.y + ext.grid.MARGINY
  newframe.w = newframe.w - (ext.grid.MARGINX * 2)
  newframe.h = newframe.h - (ext.grid.MARGINY * 2)

  win:setframe(newframe)
end

function ext.grid.snap(win)
  if win:isstandard() then
    ext.grid.set(win, ext.grid.get(win), win:screen())
  end
end

function ext.grid.adjustwidth(by)
  if ext.grid.GRIDWITH == 1 then
    hydra.alert("grid minimum size")
    return
  end
  ext.grid.GRIDWIDTH = math.max(1, ext.grid.GRIDWIDTH + by)
  hydra.alert("grid is now " .. tostring(ext.grid.GRIDWIDTH) .. " tiles wide", 1)
  fnutils.map(window.visiblewindows(), ext.grid.snap)
end

function ext.grid.adjustheight(by)
  if ext.grid.GRIDHEIGHT == 1 and by < 0 then
    hydra.alert("grid minimum size")
    return
  end
  ext.grid.GRIDHEIGHT = math.max(1, ext.grid.GRIDHEIGHT + by)
  hydra.alert("grid is now " .. tostring(ext.grid.GRIDHEIGHT) .. " tiles tall", 2)
  fnutils.map(window.visiblewindows(), ext.grid.snap)
end

function ext.grid.printer()
  hydra.alert("Hello")
end

function ext.grid.adjust_focused_window(fn)
  local win = window.focusedwindow()
  if not win then return end
  local f = ext.grid.get(win)
  fn(f)
  ext.grid.set(win, f, win:screen())
end

function ext.grid.nextcell_window()
  local win = window.focusedwindow()
  local win_f = ext.grid.get(win)

  ext.grid.cells = {}

  local cells = ext.grid.cells

  for x = 0, ext.grid.GRIDWIDTH - 1 do
    for y = 0, ext.grid.GRIDHEIGHT - 1 do
      for w = 1, ext.grid.GRIDWIDTH do
        for h = 1, ext.grid.GRIDHEIGHT do
          f = {x = x, y = y, w = w, h = h}
          cells[serialise_frame(f)] = {}
        end
      end
    end
  end

  for i, v in ipairs(window.orderedwindows()) do
    local f = ext.grid.get(v)
    if (ext.grid.cells[serialise_frame(f)]) == nil then
      ext.grid.snap(v)
      f = ext.grid.get(v)
      f.x = 0
      f.y = 0
      ext.grid.set(v, f, v:screen())
    end
    table.insert(ext.grid.cells[serialise_frame(f)], v)
  end

  if (#ext.grid.cells[serialise_frame(win_f)] > 1) then
    n = next_in_cell(serialise_frame(win_f))
    if n == win then
      n = next_in_cell(serialise_frame(win_f))
    end
    n:focus()
  end
end

function ext.grid.maximize_window()
  local win = window.focusedwindow()
  local f = {x = 0, y = 0, w = ext.grid.GRIDWIDTH, h = ext.grid.GRIDHEIGHT}
  ext.grid.set(win, f, win:screen())
end

function ext.grid.pushwindow_nextscreen()
  local win = window.focusedwindow()
  ext.grid.set(win, ext.grid.get(win), win:screen():next())
end

function ext.grid.pushwindow_prevscreen()
  local win = window.focusedwindow()
  ext.grid.set(win, ext.grid.get(win), win:screen():previous())
end

function ext.grid.pushwindow_left()
  ext.grid.adjust_focused_window(function(f)
    f.x = math.max(f.x - 1, 0)
  end)
end

function ext.grid.pushwindow_right()
  ext.grid.adjust_focused_window(function(f)
    f.x = math.min(f.x + 1, ext.grid.GRIDWIDTH - f.w)
  end)
end

function ext.grid.resizewindow_wider()
  ext.grid.adjust_focused_window(function(f)
    f.w = math.min(f.w + 1, ext.grid.GRIDWIDTH - f.x)
  end)
end

function ext.grid.resizewindow_thinner()
  ext.grid.adjust_focused_window(function(f)
    f.w = math.max(f.w - 1, 1)
  end)
end

function ext.grid.pushwindow_down()
  ext.grid.adjust_focused_window(function(f)
    f.y = math.min(f.y + 1, ext.grid.GRIDHEIGHT - f.h)
  end)
end

function ext.grid.pushwindow_up()
  ext.grid.adjust_focused_window(function(f)
    f.y = math.max(f.y - 1, 0)
  end)
end

function ext.grid.resizewindow_taller()
  ext.grid.adjust_focused_window(function(f)
    f.h = math.min(f.h + 1, ext.grid.GRIDHEIGHT - f.y)
  end)
end

function ext.grid.resizewindow_shorter()
  ext.grid.adjust_focused_window(function(f)
    f.h = math.max(f.h - 1, 1)
  end)
end


hydra.alert('loaded grid')
