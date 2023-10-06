local filesystem = require('gears.filesystem')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local gears = require('gears')
local blacklotus = require('theme.blacklotus')
local oldbook = require('theme.oldbook')

local theme = {}

-- CHANGE COLORS HERE
colorscheme = blacklotus
theme.icons = theme_dir .. '/icons/blacklotus/'
-- Change also:
-- All <span> on "layout/top-panel.lua" and "widget/net-speed/net-speed.lua", "#3F6CAD" for BlackLotus and "#585148" for OldBook
-- Background and Lockscreen in "configuration/apps.lua"

local awesome_overrides =
  function(theme)
  theme.dir = os.getenv('HOME') .. '/.config/awesome/theme'
  theme.font = 'JetBrainsMono Nerd Font medium 12px'
  theme.title_font = 'JetBrainsMono Nerd Font medium 13px'
  --Colors
  theme.fg_normal = colorscheme.foreground.alt
  theme.fg_focus = colorscheme.foreground.nrm
  theme.fg_urgent = colorscheme.accent.brt_alt
  theme.bg_normal = colorscheme.background.nrm
  theme.bg_focus = colorscheme.background.alt
  theme.bg_urgent = colorscheme.background.fcs
  theme.bg_systray = colorscheme.background.alt
  -- Accents
  theme.accent_nrm = colorscheme.accent.nrm
  theme.accent_alt = colorscheme.accent.alt
  theme.accent_brt_nrm = colorscheme.accent.brt_nrm
  theme.accent_brt_alt = colorscheme.accent.brt_alt


  -- Borders

  theme.border_width = (2)
  theme.border_normal = theme.accent_nrm
  theme.border_focus = theme.accent_brt_nrm
  theme.border_marked = theme.accent_brt_alt

  -- Menu

  theme.menu_height = (16)
  theme.menu_width = (160)

  -- Tooltips
  theme.tooltip_bg = theme.bg_normal
  theme.tooltip_border_color = theme.accent_nrm
  theme.tooltip_border_width = 2
  theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, 3)
  end

  -- Layout

  theme.layout_floating = theme.icons .. 'layouts/free.png'
  theme.layout_tile = theme.icons .. 'layouts/right.png'
  theme.layout_tiletop = theme.icons .. 'layouts/down.png'

  -- Taglist

  theme.taglist_bg_empty = theme.bg_focus
  theme.taglist_bg_occupied = theme.bg_focus
  theme.taglist_bg_urgent =
    'linear:0,0:' ..
    (40) ..
      ',0:0,' ..
        theme.accent_brt_alt ..
          ':0.08,' .. theme.accent_brt_alt.. ':0.08,' .. theme.bg_urgent .. ':1,' .. theme.bg_urgent
  theme.taglist_bg_focus = theme.accent_nrm 

  -- Tasklist

  theme.tasklist_font = 'JetBrainsMono Nerd Font medium 11px'
  theme.tasklist_bg_normal = theme.bg_normal
  theme.tasklist_bg_focus =
    'linear:0,0:0,' ..
    (30) ..
      ':0,' ..
        theme.bg_normal..
          ':0.95,' .. theme.bg_normal.. ':0.95,' .. theme.accent_nrm .. ':1,' .. theme.accent_nrm
  theme.tasklist_bg_urgent = theme.bg_urgent
  theme.tasklist_fg_focus = theme.fg_focus
  theme.tasklist_fg_urgent = theme.accent_brt_alt
  theme.tasklist_fg_normal = theme.fg_normal

  theme.icon_theme = 'Reversal-purple-dark'

  
  --Client
  theme.border_width = (2)
  theme.border_focus = theme.accent_brt_nrm
  theme.border_normal = theme.accent_nrm
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
