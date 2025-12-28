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
    self:seed(seed or 1)
    return self
end

function RNG:seed(seed)
    self.state = seed * 23456789
end

function RNG:next()
    local x = xorshift(self.state)
    self.state = x
    return x
end

function RNG:random(a, b)
    local x = self:next()
    if not a then
        return x / MAXINT / 2 + 0.5
    elseif not b then
        return x % a + 1
    else
        return x % (b - a + 1) + a
    end
end

return RNG
