function noop() end

function bind(fn, me)
    return function(...)
        return fn(me, ...)
    end
end

function map(list, callback)
    local res = {}
    for ix, elem in ipairs(list) do
        res[ix] = callback(elem, ix, list)
    end
    return res
end

function filter(list, callback)
    local res = {}
    for ix, elem in ipairs(list) do
        if callback(elem, ix, list) then
            res[#res + 1] = elem
        end
    end
    return res
end

function reduce(list, callback, initial)
    local res = initial
    for ix, elem in ipairs(list) do
        res = callback(res, elem, ix, list)
    end
    return res
end
