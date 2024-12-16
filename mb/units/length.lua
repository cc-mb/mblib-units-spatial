local Unit = require "mb.units.base.unit"
local Type = require "mb.units.base.type"

local Prefix = require "mb.units.prefix"

--- Length units.
local Length = Type.new()

Length:register_base(Unit.BASE .. "m") -- Meter.
Length:register(Length["m"] * 0.9144 .. "yd") -- Yard.
Length:register(Length["yd"] / 3 .. "ft") -- Foot.
Length:register(Length["ft"] / 3 .. "hh") -- Hand.
Length:register(Length["hh"] / 4 .. "in") -- Inch.
Length:register(Length["in"] / 3 .. "Bc") -- Barleycorn.
Length:register(Length["in"] / 1000 .. "th") -- Thou.
Length:register(Length["Bc"] / 480 .. "twip") -- Twip.
Length:register(Length["yd"] * 22 .. "ch") -- Chain.
Length:register(Length["ch"] * 10 .. "fur") -- Furlong.
Length:register(Length["fur"] * 8 .. "mi") -- Mile.
Length:register(Length["mi"] * 3 .. "lea") -- League.
Length:register(Length["m"] * 1852 .. "nmi") -- Nautical mile.
Length:register(Length["nmi"] / 10 .. "cable") -- Cables.
Length:register(Length["cable"] / 100 .. "ftm") -- Fathom.
Length:register(Length["ch"] / 100 .. "link") -- Link.
Length:register(Length["link"] * 25 .. "rd") -- Rod/Pole/Perch.
Length:register(Length["m"] * 9460730472580800 .. "ly") -- Light-year.
Length:register(Length["ly"] / 365.25 / 86400 .. "ls") -- Light-second.
Length:register(Length["m"] * 3.84399e8 .. "LD") -- Lunar distance.
Length:register(Length["m"] * 149597870700 .. "AU") -- Astronomical unit.
Length:register(Length["AU"] * 180 * 60 * 60 .. "pc") -- Parsec.

--- Apply prefxes to the unit.
---@param unit string
---@param prefixes string[]
local function apply_prefixes(unit, prefixes)
  for _, prefix in ipairs(prefixes) do
    Length:register(Prefix[prefix] * Length[unit])
  end
end

apply_prefixes("m", {"a", "f", "p", "n", "u", "m", "c", "d", "k", "M", "G", "T", "P"})
apply_prefixes("ly", {"k", "M", "G"})
apply_prefixes("pc", {"k", "M"})

return Length
