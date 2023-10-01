-------------------------------------------------
-- The Ultimate Volume Widget for Awesome Window Manager
-- More details could be found here:
-- https://github.com/streetturtle/widget.todo/tree/master/volume-widget

-- @author Pavel Makhov
-- @copyright 2020 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local gears = require("gears")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
local utils = require("widget.volume.utils")


local function GET_VOLUME_CMD(device) return 'pamixer --get-volume-human' end
local function INC_VOLUME_CMD(device, step) return 'pamixer -i 5'  end
local function DEC_VOLUME_CMD(device, step) return 'pamixer -d 5'  end
local function TOG_VOLUME_CMD(device) return 'pamixer --toggle-mute' end


local widget_types = {
    arc = require("widget.volume.arc-widget"),
}
local volume = {}


local function build_main_line(device)
    if device.active_port ~= nil and device.ports[device.active_port] ~= nil then
        return device.properties.device_description .. ' · ' .. device.ports[device.active_port]
    else
        return device.properties.device_description
    end
end


local function worker(user_args)

    local args = user_args or {}

    local mixer_cmd = args.mixer_cmd or 'pavucontrol'
    local widget_type = arc
    local refresh_rate = args.refresh_rate or 1
    local step = args.step or 5
    local device = args.device or 'pulse'

    if widget_types[widget_type] == nil then
        volume.widget = widget_types['arc'].get_widget(args.arc_args)
    else
        volume.widget = widget_types[widget_type].get_widget(args)
    end

    local function update_graphic(widget, stdout)
        --local mute = string.match(stdout, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off]
        --if mute == 'off' then widget:mute()
        --elseif mute == 'on' then widget:unmute()
        --end
        local mute = string.match(stdout, "%[(o%D%D?)%]")
        if mute == "muted" then widget:mute()
        else widget:unmute()
        end
        local volume_level = string.match(stdout, "(%d%d)%%") -- (\d?\d?\d)\%)
        --string.format("% 3d", volume_level)
        widget:set_volume_level(volume_level)
    end

    function volume:inc(s)
        spawn.easy_async(INC_VOLUME_CMD(device, s or step), function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:dec(s)
        spawn.easy_async(DEC_VOLUME_CMD(device, s or step), function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:toggle()
        spawn.easy_async(TOG_VOLUME_CMD(device), function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:mixer()
        if mixer_cmd then
            spawn.easy_async(mixer_cmd)
        end
    end

    volume.widget:buttons(
            awful.util.table.join(
                    awful.button({}, 4, function() volume:inc() end),
                    awful.button({}, 5, function() volume:dec() end),
                    awful.button({}, 2, function() volume:mixer() end),
                    awful.button({}, 1, function() volume:toggle() end)
            )
    )

    watch(GET_VOLUME_CMD(device), refresh_rate, update_graphic, volume.widget)

    return volume.widget
end

return setmetatable(volume, { __call = function(_, ...) return worker(...) end })
