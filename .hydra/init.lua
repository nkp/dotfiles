-- refers to grid.lua in this directory, taken from the Hydra wiki: https://github.com/sdegutis/hydra/wiki/Useful-Hydra-libraries
package.loaded["grid"] = nil
-- package.loaded["workspaces"] = nil

require "grid"
-- require "workspaces"

hydra.alert "Hydra, at your service."

--pathwatcher.new(os.getenv("HOME") .. "/.hydra/", hydra.reload):start()
--autolaunch.set(true)

menu.show(function()
    return {
      {title = "About Hydra", fn = hydra.showabout},
      {title = "Reload Config", fn = hydra.reload},
      {title = "-"},
      {title = "Quit", fn = os.exit},
    }
end)

local mash = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}

local function opendictionary()
  hydra.alert("Lexicon, at your service.", 0.75)
  application.launchorfocus("Dictionary")
end

applicationwindows = {}

local function nextapplicationwindow()
  local win = window.focusedwindow()
  local wins = fnutils.filter(window.orderedwindows(), function (w) return w ~= win end)
  for _, v in ipairs(wins) do
    if win ~= v then
      v:focus()
      break
    end
  end
end

local function _nextapplicationwindow()
  local win = window.focusedwindow()
  local app = win:application()
  local bundleid = app:bundleid()
  local wins = nil

  wins = app:allwindows()
  applicationwindows[bundleid] = app:allwindows()
  for i = 2, #wins do
    if win == wins[i] then
      table.insert(wins, 1, table.remove(wins, i))
    end
  end

  wins  = applicationwindows[bundleid]
  
  if #wins < 2 then
    return
  end

  table.insert(wins, table.remove(wins, 1))

  wins[1]:focus()
end

hotkey.bind(mash, 'D', opendictionary)

hotkey.bind(mash, ';', function() ext.grid.snap(window.focusedwindow()) end)
hotkey.bind(mash, "'", function() fnutils.map(window.visiblewindows(), ext.grid.snap) end)

hotkey.bind(mash, '=', function() ext.grid.adjustwidth( 1) end)
hotkey.bind(mash, '-', function() ext.grid.adjustwidth(-1) end)
hotkey.bind(mashshift, '=', function() ext.grid.adjustheight( 1) end)
hotkey.bind(mashshift, '-', function() ext.grid.adjustheight(-1) end)


hotkey.bind(mashshift, 'H', function() window.focusedwindow():focuswindow_west() end)
hotkey.bind(mashshift, 'L', function() window.focusedwindow():focuswindow_east() end)
hotkey.bind(mashshift, 'K', function() window.focusedwindow():focuswindow_north() end)
hotkey.bind(mashshift, 'J', function() window.focusedwindow():focuswindow_south() end) 
hotkey.bind(mash, 'M', ext.grid.maximize_window)

hotkey.bind(mash, 'N', ext.grid.pushwindow_nextscreen)
hotkey.bind(mash, 'P', ext.grid.pushwindow_prevscreen)

--hotkey.bind(mash, 'E', ext.workspaces.next_workspace)
--hotkey.bind(mash, 'Q', ext.workspaces.next_workspace)
--hotkey.bind(mash, 'W', ext.workspaces.save_new_workspace)
--hotkey.bind(mash, 'S', ext.workspaces.save_workspace)
--hotkey.bind(mash, 'A', ext.workspaces.new_workspace)

hotkey.bind(mash, 'J', ext.grid.pushwindow_down)
hotkey.bind(mash, 'K', ext.grid.pushwindow_up)
hotkey.bind(mash, 'H', ext.grid.pushwindow_left)
hotkey.bind(mash, 'L', ext.grid.pushwindow_right)

hotkey.bind(mash, 'U', ext.grid.resizewindow_taller)
hotkey.bind(mash, 'Y', ext.grid.resizewindow_shorter)
hotkey.bind(mash, 'O', ext.grid.resizewindow_wider)
hotkey.bind(mash, 'I', ext.grid.resizewindow_thinner)

hotkey.bind(mash, 'T', ext.grid.nextcell_window)

hotkey.bind(mash, ',', nextapplicationwindow)

hotkey.bind(mash, 'X', logger.show)
hotkey.bind(mash, "R", repl.open)

updates.check()
