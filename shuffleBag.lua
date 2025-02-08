local ShuffleBag = {}
ShuffleBag.__index = ShuffleBag

local random <const> = math.random
local function copy(tab)
    local dest = {}
    for i = 1, #tab do
        dest[i] = tab[i]
    end
    return dest
end

function ShuffleBag.new(items)
    local self = setmetatable({}, ShuffleBag)
    self.items = copy(items)
    self.total = #self.items
    self.pivot = 1
    return self
end

function ShuffleBag:take()
    local items = self.items
    local pivot = self.pivot
    local total = self.total

    local ix = random(pivot, total)
    local value = items[ix]
    items[ix] = items[pivot]
    items[pivot] = value

    self.pivot = (pivot < total) and (pivot + 1) or 1

    return value
end

function ShuffleBag:reset()
    self.pivot = 1
end

return ShuffleBag
