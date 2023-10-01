-- Config originally created by PapyElGringo

local gears = require('gears')
local awful = require('awful')
local wibox = require("wibox")
require('awful.autofocus')
local beautiful = require('beautiful')
local globalkeys = require('configuration.keys.global')

-- Theme
beautiful.init(require('theme'))


-- Layout
require('layout')

-- Init all modules
require('module.notifications')
require('module.auto-start')
require('module.decorate-client')
--require('module.backdrop')
require('module.exit-screen')

-- Setup all configurations
require('configuration.client')
require('configuration.tags')
root.keys(globalkeys)

-- Signal function to execute when a new client appears.
_G.client.connect_signal(
  'manage',
  function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not _G.awesome.startup then
      awful.client.setslave(c)
    end

    if _G.awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end
)

-- Make the focused window have a glowing border
_G.client.connect_signal(
  'focus',
  function(c)
    c.border_color = beautiful.border_focus
  end
)
_G.client.connect_signal(
  'unfocus',
  function(c)
    c.border_color = beautiful.border_normal
  end
)
