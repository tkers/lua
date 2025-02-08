function noop() end

function bind(fn, me)
    return function(...)
        return fn(me, ...)
    end
end
