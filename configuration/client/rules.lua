local awful = require('awful')
local gears = require('gears')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false
    }
  },
  -- Floating clients
  {
    rule_any = {type = {'dialog'}, 
    class = {
    },
     name = {
      'Timeshift',
      'YaST',
      'Customize Look and Feel',
      'xdg-su: /sbin/yast2',
      'Volume Control',
      'Network Connections',
      'LightDM GTK+ Greeter: setting',
      'galculator', 
    }
  },
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      border_width = (2),
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 10)
        end
      end,
      skip_decoration = true
    }
  }
}
