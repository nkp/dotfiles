-- workspaces.lua

ext.workspaces = {}
ext.workspaces.spaces = {}
ext.workspaces.current = 0

-- TODO: Add multi-screen support (May require a serializable screen id)
local function print_contents(t)

  for k, v in pairs(t) do
    print(k, ':', v:title())
  end

end


function ext.workspaces.save_new_workspace()
  table.insert(ext.workspaces.spaces, {})
  ext.workspaces.current = #ext.workspaces.spaces
  ext.workspaces.save_workspace()
end

function ext.workspaces.new_workspace()
  fnutils.map(window.visiblewindows(), window.minimize)
  ext.workspaces.save_new_workspace()
end

function ext.workspaces.save_workspace()
  local win = window.focusedwindow()
  local space = nil
  ext.workspaces.spaces[ext.workspaces.current] = {}
  space = ext.workspaces.spaces[ext.workspaces.current]
  for i, v in ipairs(window.visiblewindows()) do
    if v ~= win then
      table.insert(space, v)
    end
  end
  table.insert(space, win)
  print_contents(space)
  hydra.alert('Workspace saved')
end

function ext.workspaces.load_workspace(n)
  local space = ext.workspaces.spaces[n]
  for _, v in ipairs(window.visiblewindows()) do
    print(v:title())
    v:minimize()
  end
  print_contents(space)
  print(n) 
  print(#space) 
  for i = 0, #space do
    space[i]:unminimize()
  end
  space[#space]:focus()
end

function ext.workspaces.next_workspace()
  ext.workspaces.current = ext.workspaces.current + 1
  ext.workspaces.current = ((ext.workspaces.current + #ext.workspaces.spaces) % #ext.workspaces.spaces) + 1
  ext.workspaces.load_workspace(ext.workspaces.current)
end

function ext.workspaces.prev_workspace()
  ext.workspaces.current = ext.workspaces.current - 1
  ext.workspaces.current = ((ext.workspaces.current + #ext.workspaces.spaces) % #ext.workspaces.spaces) + 1
  ext.workspaces.load_workspace(ext.workspaces.current)
end

ext.workspaces.save_new_workspace()
