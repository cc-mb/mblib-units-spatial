local Type = require "mb.units.base.type"

local Length = require "mb.units.length"
local Time = require "mb.units.time"

--- Acceleration units.
local Acceleration = Type.new()

--- Units cross product.
---@param a string[] Length units.
---@param b string[] Time units.
local function cross_product(a, b)
  for _, length in ipairs(a) do
    for _, time in ipairs(b) do
      Acceleration:register(Length[length] / Time[time] ^ 2)
    end
  end
end

Acceleration:register_base(Length["base"] / Time["base"] ^ 2)
cross_product({"mm", "cm", "dm", "m", "km"}, {"t", "s"})
cross_product({"in", "ft", "mi"}, {"t", "s"})

return Acceleration
