local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')

-- Key bindings

local globalkeys =
  awful.util.table.join(

  -- Hotkeys

  awful.key(
    {modkey},
     'F1',
      hotkeys_popup.show_help,
       {description = 'Show help', group = 'awesome'}
  ),
  awful.key(
    {modkey},
    'F4',
    function()
      exit_screen_show()
    end,
    {description = 'Log Out Screen', group = 'awesome'}
  ),
  awful.key(
    {modkey},
     'F5',
      awesome.restart,
       {description = 'reload awesome', group = 'awesome'}
  ),
  awful.key(
    {modkey, 'Control'},
     'q',
      awesome.quit,
       {description = 'quit awesome', group = 'awesome'}
  ),
  awful.key(
    {modkey},
    'Pause',
    function()
      awful.spawn(apps.default.lock)
    end,
    {description = 'Lock the screen', group = 'awesome'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Print',
    function()
      awful.util.spawn_with_shell(apps.default.delayed_screenshot)
    end,
    {description = 'Mark an area and screenshot it 10 seconds later (clipboard)', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {''},
    'Print',
   function()
      awful.util.spawn_with_shell(apps.default.screenshot)
    end,
    {description = 'Take a screenshot of your active monitor and copy it to clipboard', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {modkey},
    'Print',
    function()
      awful.util.spawn_with_shell(apps.default.region_screenshot)
    end,
    {description = 'Mark an area and screenshot it to your clipboard', group = 'screenshots (clipboard)'}
  ),

  
  -- Client control
  
  awful.key(
    {modkey},
    'Right',
    function()
      awful.client.focus.bydirection("right")
    end,
    {description = 'Focus right', group = 'client'}
  ),
  awful.key(
    {modkey},
    'Left',
    function()
      awful.client.focus.bydirection("left")
    end,
    {description = 'Focus left', group = 'client'}
  ),
  awful.key(
    {modkey},
    'Up',
    function()
      awful.client.focus.bydirection("up")
    end,
    {description = 'Focus up', group = 'client'}
  ),
  awful.key(
    {modkey},
    'Down',
    function()
      awful.client.focus.bydirection("down")
    end,
    {description = 'Focus down', group = 'client'}
  ),
  awful.key(
    {altkey},
    'Tab',
    function()
      awful.client.focus.byidx(1)
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = 'Switch to next window', group = 'client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'equal',
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = 'Increase the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'minus',
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = 'Decrease the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'equal',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = 'Increase the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'minus',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = 'Decrease the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'space',
    function()
      awful.layout.inc(1)
    end,
    {description = 'Select next', group = 'layout'}
  ),

  -- Open default program for tag

  awful.key(
    {modkey},
    'Return',
    function()
      awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
    end,
    {description = 'Open default program for tag/workspace', group = 'tag'}
  ),

  -- Launcher

  awful.key(
    {modkey},
    'r',
    function()
      awful.spawn('rofi -show drun')
    end,
    {description = 'Main menu', group = 'awesome'}
  ),
  awful.key(
    {altkey},
    'space',
    function()
      awful.spawn('rofi -show run')
    end,
    {description = 'Show main menu', group = 'awesome'}
  ),
--awful.key(
--  {modkey},
--  'e',
--  function()
--    awful.util.spawn(apps.default.editor)
--  end,
--  {description = 'Open a text/code editor', group = 'launcher'}
--),
  awful.key(
    {modkey},
    'b',
    function()
      awful.util.spawn(apps.default.browser)
    end,
    {description = 'Open a browser', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    't',
    function()
      awful.spawn(apps.default.terminal)
    end,
    {description = 'Open a terminal', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'm',
    function()
      awful.spawn('alacritty -o font.size=4.4 -e bpytop')
    end
  ),
  awful.key(
    {modkey},
    'h',
    function()
      awful.spawn('alacritty -e ranger')
    end
  ),
  awful.key(
    {modkey},
    'g',
    function()
      awful.util.spawn(apps.default.files)
    end,
    {description = 'filebrowser', group = 'hotkeys'}
  ),
  awful.key(
    {modkey},
    'y',
    function()
      awful.spawn('firefox --new-window www.youtube.com')
    end
  ),
  
  
  

  -- Brightness

  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      awful.spawn('xbacklight -inc 10')
    end,
    {description = '+10%', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      awful.spawn('xbacklight -dec 10')
    end,
    {description = '-10%', group = 'hotkeys'}
  ),

  -- Volume control

  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      awful.spawn('pamixer -i 5 843')
    end,
    {description = 'volume up', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      awful.spawn('pamixer -d 5 843')
    end,
    {description = 'volume down', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('pamixer --toggle-mute 843')
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerOff',
    function()
      exit_screen_show()
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  

  -- Kill aplication

  --[awful.key(
  --  {modkey},
  --  'r',
  --  function()
  --    awful.util.spawn_with_shell('killall -9 aplication')
  --  end
  --),


-- Tag browsing
  awful.key(
    {modkey,},
   'equal',
    awful.tag.viewprev,
     {description = 'view previous', group = 'tag'}
  ),
  awful.key(
    {modkey,},
   'minus',
    awful.tag.viewnext,
     {description = 'view next', group = 'tag'}
  ),
  awful.key(
    {modkey},
    'Tab',
     awful.tag.history.restore,
      {description = 'go back', group = 'tag'}
  ),

  
-- "AWSDZXC" Tag Control

  -- View tag only.
    awful.key(
    {modkey},
    'w',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[1]
      if tag then
        tag:view_only()
      end
    end,
    {description = 'View tag', group = 'tag'}
    ),
  awful.key(
    {modkey},
    'a',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[2]
      if tag then
       tag:view_only()
      end
    end
  ),
  awful.key(
    {modkey},
    's',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[3]
      if tag then
        tag:view_only()
      end
    end
  ),
  awful.key(
    {modkey},
    'd',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[4]
      if tag then
        tag:view_only()
      end
    end
  ),
  awful.key(
    {modkey},
    'z',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[5]
      if tag then
        tag:view_only()
     end
    end
  ),
  awful.key(
    {modkey},
    'x',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[6]
      if tag then
        tag:view_only()
      end
    end
  ),
  awful.key(
    {modkey},
    'c',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[7]
      if tag then
        tag:view_only()
     end
    end
  ),

  -- Toggle tag display.
  awful.key(
    {modkey, 'Shift'},
    'w',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[1]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
    {description = 'Toggle tag', group = 'tag'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'a',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[2]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end
  ),
  awful.key(
    {modkey, 'Shift'},
    's',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[3]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end
  ),
  awful.key(
    {modkey, 'Shift'},
    'd',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[4]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end
  ),
  awful.key(
    {modkey, 'Shift'},
    'z',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[5]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end
  ),
  awful.key(
    {modkey, 'Shift'},
    'x',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[6]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end
  ),
  awful.key(
    {modkey, 'Shift'},
    'c',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[7]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end
  ),

  -- Move client to tag.
  awful.key(
    {modkey, 'Control'},
    'w',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[1]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
    {description = 'Move client to tag', group = 'tag'}
  ),
  awful.key(
    {modkey, 'Control'},
    'a',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[2]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end
  ),
  awful.key(
    {modkey, 'Control'},
    's',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[3]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end
  ),
  awful.key(
    {modkey, 'Control'},
    'd',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[4]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end
  ),
  awful.key(
    {modkey, 'Control'},
    'z',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[5]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end
  ),
  awful.key(
    {modkey, 'Control'},
    'x',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[6]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end
  ),
  awful.key(
    {modkey, 'Control'},
    'c',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[7]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end
  ),

  -- Toggle tag on focused client.
  awful.key(
    {modkey, 'Control', 'Shift'},
    'w',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[1]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
    {description = 'Toggle tag in focused client', group = 'tag'}
  ),
  
  awful.key(
    {modkey, 'Control', 'Shift'},
    'a',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[2]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end
  ),
 
  awful.key(
    {modkey, 'Control', 'Shift'},
    's',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[3]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end
  ),
  
  awful.key(
    {modkey, 'Control', 'Shift'},
    'd',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[4]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end
  ),
  awful.key(
    {modkey, 'Control', 'Shift'},
    'z',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[5]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end
  ),
  
  awful.key(
    {modkey, 'Control', 'Shift'},
    'x',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[6]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end
  ),
  
  awful.key(
    {modkey, 'Control', 'Shift'},
    'c',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[7]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end
  )
)

return globalkeys
