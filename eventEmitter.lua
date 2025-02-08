local EventEmitter = {}
EventEmitter.__index = EventEmitter

function EventEmitter.new()
    local self = setmetatable({}, EventEmitter)
    self.handlers = {}
    return self
end

local MAX_LISTENERS = 10
function EventEmitter.setMaxListeners(n)
    MAX_LISTENERS = n
end

function EventEmitter:on(event, handler)
    local list = self.handlers[event] or {}
    list[#list + 1] = handler
    assert(#list < MAX_LISTENERS, "Possible EventEmitter memory leak detected. Maximum listeners exceeded.")
    self.handlers[event] = list
end

function EventEmitter:emit(event, ...)
    local handled = false
    local list = self.handlers[event]
    if list then
        for i = #list, 1, -1 do
            list[i](...)
            handled = true
        end
    end
    return handled
end

function EventEmitter:off(event, handler)
    local list = self.handlers[event]
    if list then
        for i = #list, 1, -1 do
            if list[i] == handler then
                table.remove(list, i)
                break
            end
        end
    end
end

function EventEmitter:once(event, handler)
    local a = {}
    a.handler = function(...)
        handler(...)
        self:off(event, a.handler)
        a.handler = nil
    end
    return self:on(event, a.handler)
end

function EventEmitter:removeAllListeners(event)
    if event then
        self.handlers[event] = nil
    else
        self.handlers = {}
    end
end

return EventEmitter
