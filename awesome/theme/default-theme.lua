local filesystem = require('gears.filesystem')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local gears = require('gears')
local blacklotus = require('theme.blacklotus')

local theme = {}

theme.icons = theme_dir .. '/icons/'
theme.font = 'JetBrainsMono Nerd Font medium 12'


local awesome_overrides =
  function(theme)
  theme.dir = os.getenv('HOME') .. '/.config/awesome/theme'
  theme.icons = theme.dir .. '/icons/'
  theme.wallpaper = '#e0e0e0'
  theme.font = 'JetBrainsMono Nerd Font medium 12'
  theme.title_font = 'JetBrainsMono Nerd Font medium 13'

  theme.fg_normal = blacklotus.foreground.alt

  theme.fg_focus = blacklotus.foreground.nrm
  theme.fg_urgent = blacklotus.white
  theme.bat_fg_critical = blacklotus.bright.black

  theme.bg_normal = blacklotus.background.nrm
  theme.bg_focus = blacklotus.background.nrm
  theme.bg_urgent = blacklotus.background.alt
  theme.bg_systray = blacklotus.background.nrm

  -- Borders

  theme.border_width = (2)
  theme.border_normal = blacklotus.normal.blue
  theme.border_focus = blacklotus.bright.blue
  theme.border_marked = blacklotus.bright.red

  -- Menu

  theme.menu_height = (16)
  theme.menu_width = (160)

  -- Tooltips
  theme.tooltip_bg = blacklotus.background.nrm
  theme.tooltip_border_color = blacklotus.normal.blue
  theme.tooltip_border_width = 2
  theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, 3)
  end

  -- Layout

  theme.layout_floating = theme.icons .. 'layouts/free.png'
  theme.layout_tile = theme.icons .. 'layouts/right.png'
  theme.layout_tiletop = theme.icons .. 'layouts/down.png'

  -- Taglist

  theme.taglist_bg_empty = blacklotus.background.nrm
  theme.taglist_bg_occupied = blacklotus.background.nrm
  theme.taglist_bg_urgent =
    'linear:0,0:' ..
    (40) ..
      ',0:0,' ..
        blacklotus.normal.red ..
          ':0.08,' .. blacklotus.normal.red.. ':0.08,' .. blacklotus.background.alt .. ':1,' .. blacklotus.background.alt
  theme.taglist_bg_focus = blacklotus.normal.blue 

  -- Tasklist

  theme.tasklist_font = 'JetBrainsMono Nerd Font medium 11'
  theme.tasklist_bg_normal = blacklotus.background.nrm
  theme.tasklist_bg_focus =
    'linear:0,0:0,' ..
    (30) ..
      ':0,' ..
        blacklotus.background.nrm ..
          ':0.95,' .. blacklotus.background.nrm .. ':0.95,' .. blacklotus.normal.blue .. ':1,' .. blacklotus.normal.blue
  theme.tasklist_bg_urgent = blacklotus.background.alt
  theme.tasklist_fg_focus = blacklotus.foreground.nrm
  theme.tasklist_fg_urgent = blacklotus.bright.red
  theme.tasklist_fg_normal = blacklotus.foreground.alt

  theme.icon_theme = 'Reversal-purple-dark'

  
  --Client
  theme.border_width = (2)
  theme.border_focus = blacklotus.bright.blue
  theme.border_normal = blacklotus.normal.blue
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
