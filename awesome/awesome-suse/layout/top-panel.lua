local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
--local TaskList = require('widget.task-list')
local TagList = require('widget.tag-list')
local gears = require('gears')
local clickable_container = require('widget.material.clickable-container')
local mat_icon_button = require('widget.material.icon-button')
local mat_icon = require('widget.material.icon')
local icons = require('theme.icons')
local net_speed_widget = require('widget.net-speed.net-speed')
local calendar_widget = require('widget.calendar.calendar')
local volume_widget = require('widget.volume.volume')
local spotify_widget = require('widget.spotify.spotify')

local TopPanel = function(s)
  
-- CONFIG
  local panel =
  wibox(
  {
    ontop = true,
    screen = s,
    height = 30,
    width = s.geometry.width - 24,
    x = 10,
    y = 10,
    stretch = false,
    bg = beautiful.bg_focus,
    fg = beautiful.fg_normal,
  }
  )
  panel.border_color = beautiful.accent_nrm
  panel.border_width = (2)
  panel.shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, 8)
  end
  panel:struts(
    {
      top = 46
    }
  )


--CONTENT
  --LayoutBox
  local LayoutBox = function(s)
    local layoutBox = clickable_container(awful.widget.layoutbox(s))
    layoutBox:buttons(
      awful.util.table.join(
        awful.button(
          {},
          1,
          function()
            awful.layout.inc(1)
          end
        ),
        awful.button(
          {},
          3,
          function()
            awful.layout.inc(-1)
          end
        ),
        awful.button(
          {},
          4,
          function()
            awful.layout.inc(1)
          end
        ),
        awful.button(
          {},
          5,
          function()
            awful.layout.inc(-1)
          end
        )
      )
    )
    return layoutBox
  end

  --Systray
  local systray = wibox.widget.systray()
  systray:set_horizontal(true)
  systray:set_base_size(19)
  systray.forced_height = 32
  beautiful.systray_icon_spacing = 2

  -- Clock
  local my_textclock = wibox.widget.textclock('<span font="JetBrainsMono Nerd Font Mono bold 14px">%H:%M</span>')
  
  local Time = wibox.widget{
    markup = '<span color="#3f6cad">󱑍 </span>',
    font = 'JetBrainsMono Nerd Font bold 15px',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }
  -- Date
  local textclock = wibox.widget.textclock('<span font="JetBrainsMono Nerd Font Mono 12px">%a, %d/%m</span>')

  local Date = wibox.widget{
    markup = '<span color="#3f6cad"> </span>',
    font = 'JetBrainsMono Nerd Font bold 13px',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }

  -- Calendar
  local cw = calendar_widget({
  theme = 'nord',
  placement = 'top_left',
  start_sunday = true,
  radius = 8,
  })

  -- Connect calendar to clock/date
  my_textclock:connect_signal("button::press",
  function(_, _, _, button)
      if button == 1 then cw.toggle() end
  end)
  textclock:connect_signal("button::press",
  function(_, _, _, button)
    if button == 1 then cw.toggle() end
  end)
  Date:connect_signal("button::press",
  function(_, _, _, button)
      if button == 1 then cw.toggle() end
  end)
  Time:connect_signal("button::press",
  function(_, _, _, button)
      if button == 1 then cw.toggle() end
  end)

  --Get Info
  local cpuTemp = awful.widget.watch(
    'bash -c "(sensors | grep -Eo \'Package id 0:.{0,10}\') | grep -Eo \'[1-9].{0,1}\' |  sed \'s/$/°C/\'"',
    5
  )
  local cpuUtil = awful.widget.watch(
    'bash -c "echo ""$[100-$(vmstat 1 2|tail -1|awk \'{print $15}\')]"%""',
    2
  )
  local ramUtil = awful.widget.watch(
    'bash -c "free -h | awk \'/^Mem/ {print $3}\'"',
    10
  )
  local weatherTemp = awful.widget.watch(
    'bash -c "curl wttr.in/diamantina?format=%t |  sed \'s/+//g\'"',
    1800
  )
  local weatherCond = awful.widget.watch(
    'bash -c "curl wttr.in/Diamantina?format=%c |  sed \'s/ //g\'"',
    1800
  )
  weatherCond.font = 'JetBrainsMono Nerd Font bold 10px'
  weatherCond.color = "#3f6cad"

  -- Info Symbol
  local Temp = wibox.widget{
    markup = '<span color="#3f6cad">󰏈 </span>',
    font = 'BrainsMono Nerd Font bold 13px',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }
  local Cpu = wibox.widget{
    markup = '<span color="#3f6cad"> </span>',
    font = 'JetBrainsMono Nerd Font bold 13px',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }
  local Ram = wibox.widget{
    markup = '<span color="#3f6cad"> </span>',
    font = 'JetBrainsMono Nerd Font bold 13px',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }
  local separator = wibox.widget{
    markup = '<span color="#3f6cad">|</span>',
    font = 'JetBrainsMono Nerd Font 17px',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
  }
  local spacer = wibox.widget{
    markup = ' ',
    font = 'JetBrainsMono Nerd Font 4px',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
  }
  local Temperature = wibox.widget{
    markup = '<span color="#3f6cad"> </span>',
    font = 'JetBrainsMono Nerd Font bold 13px',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }
  local weather = wibox.widget{
    wibox.container.margin(Temperature, 0, 0, 5, 5),
    wibox.container.margin(weatherCond, 0, 0, 5, 5),
    wibox.container.margin(weatherTemp, 1, 0, 5, 5),
    layout = wibox.layout.fixed.horizontal
  }
  weather.forced_width = 57


-- SETUP

  panel:setup {
    layout = wibox.layout.stack,
  {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.container.margin(volume_widget{widget_type = 'arc'},8, 2, 0, 0),
        separator,
        wibox.container.margin(Time, 2, 2, 5, 5),
        wibox.container.margin(my_textclock, 0, 2, 0, 0),
        separator,
        wibox.container.margin(Date, 2, 2, 5, 5),
        wibox.container.margin(textclock, 2, 2, 6, 5),
        separator,
        wibox.container.margin(weather, 2, 2, 0, 0),
        separator,
        wibox.container.margin(spotify_widget(), 6, 2, 2, 2),
        --TaskList(s),
        
      },
      nil,
      {
        layout = wibox.layout.fixed.horizontal,
        separator,
        wibox.container.margin(Cpu, 2, 2, 5, 5),
        wibox.container.margin(cpuUtil, 2, 6, 5, 5),
        separator,
        wibox.container.margin(Ram, 2, 2, 5, 5),
        wibox.container.margin(ramUtil, 2, 6, 5, 5),
        separator,
        wibox.container.margin(Temp, 2, 2, 5, 5),
        wibox.container.margin(cpuTemp, 2, 6, 5, 5),
        separator,
        wibox.container.margin(net_speed_widget(), 2, 2, 0, 0),
        wibox.container.margin(systray, 2, 0, 5, 5),
        separator,
        wibox.container.margin(LayoutBox(s), 0, 5, 0, 0),
      },
    },
    {
        TagList(s),
        valign = "center",
        halign = "center",
        layout = wibox.container.place
    }      
  }

  return panel
end

return TopPanel
