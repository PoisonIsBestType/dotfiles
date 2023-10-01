local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local apps = require('configuration.apps')

local tags = {
  {
    icon = icons.task,
    type = 'any',
    layout = awful.layout.suit.tile,
    defaultApp = apps.default.rofi,
    screen = 1
  },
  {
    icon = icons.files,
    type = 'files',
    layout = awful.layout.suit.tile,
    defaultApp = apps.default.files,
    screen = 1
  },
  {
    icon = icons.browser,
    type = 'browser',
    layout = awful.layout.suit.tile,
    defaultApp = apps.default.browser,
    screen = 1
  },
  {
    icon = icons.terminal,
    type = 'terminal',
    layout = awful.layout.suit.tile,
    defaultApp = apps.default.terminal,
    screen = 1
  },
  {
    icon = icons.media,
    type = 'media',
    layout = awful.layout.suit.tile.top,
    defaultApp = apps.default.music,
    screen = 1
  },
  {
    icon = icons.game,
    type = 'game',
    layout = awful.layout.suit.tile,
    defaultApp = apps.default.game,
    screen = 1
  },
  {
    icon = icons.list,
    type = 'list',
   layout = awful.layout.suit.floating,
    defaultApp = apps.default.terminal,
    screen = 1
  }
  
}

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.top,
  awful.layout.suit.floating
}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon = tag.icon,
          icon_only = true,
          layout = tag.layout,
          gap_single_client = true,
          gap = 5,
          screen = s,
          defaultApp = tag.defaultApp,
          selected = i == 1
        }
      )
    end
  end
)
