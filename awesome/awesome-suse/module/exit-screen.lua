local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local clickable_container = require('widget.material.clickable-container')
local apps = require('configuration.apps')

-- Appearance
local icon_size = beautiful.exit_screen_icon_size or 140

local buildButton = function(icon)
  local abutton =
    wibox.widget {
    wibox.widget {
      wibox.widget {
        wibox.widget {
          image = icon,
          widget = wibox.widget.imagebox
        },
        top = 16,
        bottom = 16,
        left = 16,
        right = 16,
        widget = wibox.container.margin
      },
      shape = gears.shape.rounded_rect,
      forced_width = icon_size -10,
      forced_height = icon_size -30,
      widget = clickable_container
    },
    left = 24,
    right = 24,
    widget = wibox.container.margin
  }

  return abutton
end

function suspend_command()
  exit_screen_hide()
  awful.spawn.with_shell(apps.default.lock .. ' & systemctl suspend')
end
function exit_command()
  awesome.quit()
end
function lock_command()
  exit_screen_hide()
  awful.spawn.with_shell('sleep 1 && ' .. apps.default.lock)
end
function poweroff_command()
  awful.spawn.with_shell('systemctl poweroff')
  awful.keygrabber.stop(exit_screen_grabber)
end
function reboot_command()
  awful.spawn.with_shell('systemctl reboot')
  awful.keygrabber.stop(exit_screen_grabber)
end

local poweroff = buildButton(icons.power, 'Shutdown')
poweroff:connect_signal(
  'button::release',
  function()
    poweroff_command()
  end
)

local reboot = buildButton(icons.restart, 'Restart')
reboot:connect_signal(
  'button::release',
  function()
    reboot_command()
  end
)

local suspend = buildButton(icons.sleep, 'Sleep')
suspend:connect_signal(
  'button::release',
  function()
    suspend_command()
  end
)

local exit = buildButton(icons.logout, 'Logout')
exit:connect_signal(
  'button::release',
  function()
    exit_command()
  end
)

local lock = buildButton(icons.lock, 'Lock')
lock:connect_signal(
  'button::release',
  function()
    lock_command()
  end
)

-- Get screen geometry
local screen_geometry = awful.screen.focused().geometry

-- Create the widget
exit_screen =
  wibox(
  {
    screen = 1,
    x = screen_geometry.x +220,
    y = screen_geometry.y +275,
    visible = false,
    ontop = true,
    type = 'splash',
    shape = gears.shape.rounded_rect,
    height = screen_geometry.height -550,
    width = screen_geometry.width -440
  }
  )
  
  exit_screen.border_color = beautiful.accent_nrm
    exit_screen.border_width = (2)

    exit_screen.shape = function(cr, w, h)
      gears.shape.rounded_rect(cr, w, h, 10)
    end

    
exit_screen.bg = beautiful.bg_normal .. 'dd'
exit_screen.fg = beautiful.fg_normal

local exit_screen_grabber

function exit_screen_hide()
  awful.keygrabber.stop(exit_screen_grabber)
  exit_screen.visible = false
end

function exit_screen_show()
  exit_screen_grabber =
    awful.keygrabber.run(
    function(_, key, event)
      if event == 'release' then
        return
      end

      if key == 's' then
        suspend_command()
      elseif key == 'o' then
        exit_command()
      elseif key == 'l' then
        lock_command()
      elseif key == 'p' then
        poweroff_command()
      elseif key == 'r' then
        reboot_command()
      elseif key == 'Escape' or key == 'q' or key == 'x' then
        exit_screen_hide()
      end
    end
  )
  exit_screen.visible = true
end

exit_screen:buttons(
  gears.table.join(
    -- Middle click - Hide exit_screen
    awful.button(
      {},
      2,
      function()
        exit_screen_hide()
      end
    ),
    -- Right click - Hide exit_screen
    awful.button(
      {},
      3,
      function()
        exit_screen_hide()
      end
    )
  )
)

local bye = wibox.widget{
  markup = 'Go to sleep already,' .. os.getenv('USER') .. '!',
  font = 'JetBrainsMono Nerd Font bold 20px',
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

local action = wibox.widget {
  poweroff,
  reboot,
  suspend,
  exit,
  lock,
  layout = wibox.layout.fixed.horizontal
}

-- Item placement
exit_screen:setup {
  nil,
  {
    nil,
    {   
      bye,
      action,
      layout = wibox.layout.align.vertical
    },
    nil,
    expand = 'none',
    layout = wibox.layout.align.horizontal
  },
  nil,
  expand = 'none',
  layout = wibox.layout.align.vertical
  
}
