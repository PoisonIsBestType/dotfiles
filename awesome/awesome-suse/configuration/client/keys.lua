local awful = require('awful')
require('awful.autofocus')
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local clientKeys =
  awful.util.table.join(
  awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

  awful.key(
    {modkey},
    'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = 'toggle fullscreen', group = 'client'}
  ),

  awful.key(
    { modkey },
    "space",
    function ()
      awful.client.floating.toggle()
    end,
    {description = "toggle floating", group = "client"}
  ),
  
  awful.key(
    {modkey, 'Control'},
    'Right',
    function()
      awful.client.swap.bydirection("right")
    end,
    {description = 'swap right', group = 'client'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Left',
    function()
      awful.client.swap.bydirection("left")
    end,
    {description = 'swap left', group = 'client'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Up',
    function()
      awful.client.swap.bydirection("up")
    end,
    {description = 'swap up', group = 'client'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Down',
    function()
      awful.client.swap.bydirection("down")
    end,
    {description = 'swap down', group = 'client'}
  ),

  awful.key(
    {modkey},
    'q',
    function(c)
      c:kill()
    end,
    {description = 'close', group = 'client'}
  )
)

return clientKeys
