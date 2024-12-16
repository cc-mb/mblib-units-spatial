local Type = require "mb.units.base.type"

local Volume = require "mb.units.volume"
local Time = require "mb.units.time"

--- Flow units.
local Flow = Type.new()

--- Units cross product.
---@param a string[] Volume units.
---@param b string[] Time units.
local function cross_product(a, b)
  for _, volume in ipairs(a) do
    for _, time in ipairs(b) do
      Flow:register(Volume[volume] / Time[time])
    end
  end
end

Flow:register_base(Volume["base"] / Time["base"])
cross_product({"mm^3", "cm^3", "dm^3", "m^3", "km^3"}, {"t", "s", "min", "h", "d"})
cross_product({"ml", "cl", "dl", "l"}, {"t", "s", "min", "h", "d"})
cross_product({"mB", "B"}, {"t", "s", "min", "h", "d"})
cross_product({"gal"}, {"t", "s", "min", "h", "d"})

return Flow
