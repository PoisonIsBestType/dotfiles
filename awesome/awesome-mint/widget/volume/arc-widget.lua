local wibox = require("wibox")
local beautiful = require('beautiful')

local widget = {}

function widget.get_widget(widgets_args)
    local args = widgets_args or {}

    local thickness = 3
    local main_color = beautiful.accent_nrm
    local bg_color = beautiful.fg_normal..22
    local mute_color =  beautiful.fg_normal..22
    local size = 21

    return wibox.widget {
        {
            id = "icon",
            image = beautiful.icons .. '/volume/audio-volume-high-symbolic.svg',
            resize = true,
            widget = wibox.widget.imagebox,
        },
        max_value = 100,
        thickness = thickness,
        start_angle = 4.71238898, -- 2pi*3/4
        forced_height = size,
        forced_width = size,
        bg = bgcolor,
        paddings = 1,
        widget = wibox.container.arcchart,
        set_volume_level = function(self, new_value)
            self.value = new_value
        end,
        mute = function(self)
            self.color = { mute_color }
        end,
        unmute = function(self)
            self.colors = { main_color }
        end
    }

end


return widget
