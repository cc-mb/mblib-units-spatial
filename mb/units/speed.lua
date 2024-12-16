local Type = require "mb.units.base.type"

local Length = require "mb.units.length"
local Time = require "mb.units.time"

--- Speed units.
local Speed = Type.new()

--- Units cross product.
---@param a string[] Length units.
---@param b string[] Time units.
local function cross_product(a, b)
  for _, length in ipairs(a) do
    for _, time in ipairs(b) do
      Speed:register(Length[length] / Time[time])
    end
  end
end

Speed:register_base(Length["base"] / Time["base"])
cross_product({"mm", "cm", "dm", "m", "km"}, {"t", "s", "h"})
cross_product({"in", "ft", "mi"}, {"t", "s", "h"})
cross_product({"ly"}, {"t", "s", "h"})
Speed:register(Length["nmi"] / Time["h"] .. "kt")

return Speed
