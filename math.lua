local floor <const> = math.floor
local ceil <const> = math.ceil
local min <const> = math.min
local max <const> = math.max

function math.sign(x)
    return x < 0 and -1 or 1
end

function math.round(x)
    return x < 0 and ceil(x - 0.5) or floor(x + 0.5)
end

function math.lerp(from, to, t)
    return from + (to - from) * t
end

function math.clamp(x, lo, hi)
    return max(lo, min(hi, x))
end

function math.wrap(x, lo, hi)
    return lo + (x - lo) % (hi - lo)
end

function math.wrapInt(x, lo, hi)
    return lo + (x - lo) % (hi - lo + 1)
end
