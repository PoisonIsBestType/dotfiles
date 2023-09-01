local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local TaskList = require('widget.task-list')
local TagList = require('widget.tag-list')
local gears = require('gears')
local clickable_container = require('widget.material.clickable-container')
local mat_icon_button = require('widget.material.icon-button')
local mat_icon = require('widget.material.icon')
local icons = require('theme.icons')
local blacklotus = require('theme.blacklotus')

-- systray
local systray = wibox.widget.systray()
  systray:set_horizontal(true)
  systray:set_base_size(25)
  systray.forced_height = 32
  beautiful.systray_icon_spacing = 2

  -- Clock / Calendar 24h format (using as data / calendar)
local textclock = wibox.widget.textclock('<span font="JetBrainsMono Nerd Font Mono 11">%d/%m/%y</span>')

 --Center Clock
local my_textclock = wibox.widget.textclock('<span font="JetBrainsMono Nerd Font Mono bold 17">%H:%M</span>')

-- Add a calendar (credits to kylekewley for the original code)
local month_calendar = awful.widget.calendar_popup.month({
  screen = s,
  start_sunday = true,
  opacity = 0.8,
  week_numbers = false,
})
month_calendar:attach(my_textclock, 'tm')
month_calendar.shape = function(cr, w, h)
  gears.shape.rounded_rect(cr, w, h, 5)
end

local clock_widget = wibox.container.margin(textclock, 13, 13, 8, 8)

-- Create an imagebox widget which will contains an icon indicating which layout we're using.
-- We need one layoutbox per screen.
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

local TopPanel = function(s)
  
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
      bg = blacklotus.background.nrm,
      fg = blacklotus.foreground.nrm,
    }
    )
    
    panel.border_color = blacklotus.normal.blue
    panel.border_width = (2)

    panel.shape = function(cr, w, h)
      gears.shape.rounded_rect(cr, w, h, 8)
    end

    panel:struts(
      {
        top = 46
      }
    )

  --Sysmonitor

    -- Call for info
    local cpuTemp = awful.widget.watch('bash -c "(sensors | grep -Eo \'Package id 0:.{0,10}\') | grep -Eo \'[1-9].{0,1}\' |  sed \'s/$/°C/\'"', 5)
    --local gpuTemp = awful.widget.watch('bash -c "echo "ɢᴘᴜ" && nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader | grep -Eo [0-9]* |  sed \'s/$/°C/\'"', 5)
    local cpuUtil = awful.widget.watch('bash -c "echo ""$[100-$(vmstat 1 2|tail -1|awk \'{print $15}\')]"%""', 2)
    local ramUtil = awful.widget.watch('bash -c "free -h | awk \'/^Mem/ {print $3}\'"', 10)
    local weather = awful.widget.watch('bash -c "inxi -w | awk \'/temperature/ {print int($3  + 0.5)}\' |  sed \'s/$/°C/\'"', 300)

    -- Info widget
    local Temp = wibox.widget{
      markup = '<span color="#3f6cad">󰏈 :</span>',
      font = 'JetBrainsMono Nerd Font bold 13',
      align  = 'center',
      valign = 'center',
      widget = wibox.widget.textbox
    }
    local Cpu = wibox.widget{
      markup = '<span color="#3f6cad"> :</span>',
      font = 'JetBrainsMono Nerd Font bold 13',
      align  = 'center',
      valign = 'center',
      widget = wibox.widget.textbox
    }
    local Ram = wibox.widget{
      markup = '<span color="#3f6cad"> :</span>',
      font = 'JetBrainsMono Nerd Font bold 13',
      align  = 'center',
      valign = 'center',
      widget = wibox.widget.textbox
    }
    local separator = wibox.widget{
      markup = '<span color="#3f6cad">|</span>',
      font = 'JetBrainsMono Nerd Font 16',
      align  = 'center',
      valign = 'center',
      widget = wibox.widget.textbox,
    }
    local spacer = wibox.widget{
      markup = ' ',
      font = 'JetBrainsMono Nerd Font 13',
      align  = 'center',
      valign = 'center',
      widget = wibox.widget.textbox,
    }
    local weather_icon = wibox.widget{
      markup = '󰖐 ',
      font = 'JetBrainsMono Nerd Font bold 14',
      align  = 'center',
      valign = 'center',
      widget = wibox.widget.textbox,
    }
    local clock = wibox.widget{
      weather_icon,
      weather,
      separator,
      my_textclock,
      separator,
      textclock,
      layout = wibox.layout.fixed.horizontal,
    }
    
    


    


    panel:setup {
      layout = wibox.layout.stack,
    {
        layout = wibox.layout.align.horizontal,
        {
          layout = wibox.layout.fixed.horizontal,
          TagList(s),
          spacer,
          TaskList(s),
          
        },
        nil,
        {
          layout = wibox.layout.fixed.horizontal,
          
          wibox.container.margin(Cpu, 4, 2, 5, 5),
          wibox.container.margin(cpuUtil, 2, 6, 5, 5),
          separator,
          wibox.container.margin(Ram, 6, 2, 5, 5),
          wibox.container.margin(ramUtil, 2, 6, 5, 5),
          separator,
          wibox.container.margin(Temp, 6, 2, 5, 5),
          --wibox.container.margin(gpuTemp, 2, 5, 0, 0),
          wibox.container.margin(cpuTemp, 2, 6, 5, 5),
          separator,
          wibox.container.margin(systray, 6, 0, 6, 4),
          separator,

          LayoutBox(s),
        },
      },
      {
          clock,
          valign = "center",
          halign = "center",
          layout = wibox.container.place
      }      
  }

  return panel
end

return TopPanel
