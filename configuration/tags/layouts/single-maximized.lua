---------------------------------------------------------------------------
--- Maximized and fullscreen layouts module for awful
--
-- @author Julien Danjou &lt;julien@danjou.info&gt;
-- @copyright 2008 Julien Danjou
-- @module awful.layout
---------------------------------------------------------------------------

-- Grab environment we need
local pairs = pairs

local max = {}

local function fmax(p, fs)
    -- Fullscreen
    local area
    if fs then
        area = p.geometry
    else
        area = p.workarea
    end
    local focused_client = client.focus
    for _, c in pairs(p.clients) do
        local g = {
            x = area.x,
            y = area.y,
            width = area.width,
            height = area.height
        }
        p.geometries[c] = g
    end
end
