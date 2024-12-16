local Type = require "mb.units.base.type"

local Prefix = require "mb.units.prefix"
local Length = require "mb.units.length"

--- Area units.
local Area = Type.new()

Area:register_base(Length["base"] ^ 2)
Area:register(Length["mm"] ^ 2)
Area:register(Length["cm"] ^ 2)
Area:register(Length["dm"] ^ 2)
Area:register(Length["m"] ^ 2)
Area:register(Length["km"] ^ 2)
Area:register(Area["m^2"] * 100 .. "a") -- Are.
Area:register(Prefix["h"] * Area["a"])
Area:register(Length["in"] ^ 2 .. "sq in") -- Square inch.
Area:register(Length["ft"] ^ 2 .. "sq ft") -- Square foot.
Area:register(Length["yd"] ^ 2 .. "sq yd") -- Square yard.
Area:register(Length["rd"] ^ 2 .. "perch") -- Square rod/pool/perch.
Area:register(Length["furlong"] * Length["rd"] .. "rood") -- Rood.
Area:register(Length["furlong"] * Length["ch"] .. "acre") -- Acre.
Area:register(Length["mi"] ^ 2 .. "sq mi") -- Square mile.

return Length
