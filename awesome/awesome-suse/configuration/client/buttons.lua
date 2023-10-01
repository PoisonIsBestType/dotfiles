local awful = require('awful')
local modkey = require('configuration.keys.mod').modKey

return awful.util.table.join(
  awful.button(
    {},
    1,
    function(c)
      client.focus = c
      c:raise()
    end
  ),
  awful.button({modkey}, 1, awful.mouse.client.move),
  awful.button({modkey}, 3, awful.mouse.client.resize)
)
