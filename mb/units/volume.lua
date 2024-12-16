local Type = require "mb.units.base.type"

local Prefix = require "mb.units.prefix"
local Length = require "mb.units.length"

--- Volume units.
local Volume = Type.new()

Volume:register_base(Length["base"] ^ 3)
Volume:register(Length["mm"] ^ 3)
Volume:register(Length["cm"] ^ 3)
Volume:register(Length["dm"] ^ 3)
Volume:register(Length["m"] ^ 3)
Volume:register(Length["km"] ^ 3)
Volume:register(Volume["dm^3"] .. "l") -- Litre.
Volume:register(Prefix["m"] * Volume["l"])
Volume:register(Prefix["c"] * Volume["l"])
Volume:register(Prefix["d"] * Volume["l"])
Volume:register(Prefix["h"] * Volume["l"])
Volume:register(Length["in"] ^ 3 .. "cu in") -- Cubic inch.
Volume:register(Length["ft"] ^ 3 .. "cu ft") -- Cubic foot.
Volume:register(Length["yd"] ^ 3 .. "cu yd") -- Cubic yard.
Volume:register(Length["mi"] ^ 3 .. "cu mi") -- Cubic mile.
Volume:register(Volume["ml"] * 28.4130625 .. "fl oz") -- Fluid ounce.
Volume:register(Volume["fl oz"] * 5 .. "gi") -- Gill.
Volume:register(Volume["gi"] * 4 .. "pt") -- Pint.
Volume:register(Volume["pt"] * 2 .. "qt") -- Quart.
Volume:register(Volume["qt"] * 4 .. "gal") -- Galon.
Volume:register(Volume["m^3"] * 350 .. "B") -- Bucket.
Volume:register(Prefix["m"] * Volume["B"])

return Length
