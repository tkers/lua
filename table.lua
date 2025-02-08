function table.map(list, callback)
    local res = {}
    for ix, elem in ipairs(list) do
        res[ix] = callback(elem, ix, list)
    end
    return res
end

function table.filter(list, callback)
    local res = {}
    for ix, elem in ipairs(list) do
        if callback(elem, ix, list) then
            res[#res + 1] = elem
        end
    end
    return res
end

function table.reduce(list, callback, initial)
    local res = initial
    for ix, elem in ipairs(list) do
        res = callback(res, elem, ix, list)
    end
    return res
end
