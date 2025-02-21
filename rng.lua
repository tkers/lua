local MAXINT <const> = ~0 >> 1
local function xorshift(x)
    x = x ~ x << 13
    x = x ~ x >> 17
    x = x ~ x << 5
    return x
end

local RNG = {}
RNG.__index = RNG

function RNG.new(seed)
    local self = setmetatable({}, RNG)
    self.seed = seed
    return self
end

function RNG:setSeed(seed)
    self.seed = seed
end

function RNG:getSeed()
    return self.seed
end

function RNG:random(a, b)
    self.seed = xorshift(self.seed)
    if not a then
        return self.seed / MAXINT / 2 + 0.5
    elseif not b then
        return self.seed % a + 1
    else
        return self.seed % (b - a + 1) + a
    end
end

return RNG
