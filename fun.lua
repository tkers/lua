function noop() end

function identity(x)
    return x
end

function const(x)
    return function()
        return x
    end
end

function bind(fn, me)
    return function(...)
        return fn(me, ...)
    end
end
