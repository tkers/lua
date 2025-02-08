local Pond = {}
Pond.__index = Pond

function Pond.new(build, size)
    local self = setmetatable({}, Pond)
    self.build = build
    self.items = {}
    self.total = 0
    if size then
        self:fill(size)
    end
    return self
end

function Pond:fill(n)
    for i = 1, n do
        self:give(self.build())
    end
end

function Pond:take()
    if self.total > 0 then
        local item = self.items[self.total]
        self.items[self.total] = nil
        self.total = self.total - 1
        return item
    else
        return build()
    end
end

function Pond:give(item)
    self.total = self.total + 1
    self.items[self.total] = item
end

function pond:drain()
    self.items = {}
    self.total = 0
end

return Pond
