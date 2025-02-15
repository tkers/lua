local random <const> = math.random

function table.copy(t)
    local res = {}
    for i = 1, #t do
        res[i] = t[i]
    end
    return res
end

function table.reversed(t)
    local res = {}
    local len = #t
    for ix = len, 1, -1 do
        res[len - ix + 1] = t[ix]
    end
    return res
end

-- returns a copy
function table.shuffled(t)
    local res = {}
    local len = #t
    for i = #t, 2, -1 do
        local j = random(i)
        res[len - i + 1] = t[j]
        t[j] = t[i]
    end
    return res
end

-- in-place version of shuffled()
function table.shuffle(t)
    for i = #t, 2, -1 do
        local j = random(i)
        t[i], t[j] = t[j], t[i]
    end
end

function table.map(list, callback)
    local res = {}
    for ix, elem in ipairs(list) do
        res[ix] = callback(elem, ix, list)
    end
    return res
end

function table.pluck(t, key)
    local res = {}
    for i = 1, #t do
        res[i] = t[i][key]
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

function table.find(t, callback)
    for ix, elem in ipairs(t) do
        if callback(elem, ix, t) then
            return elem, ix
        end
    end
end

function table.random(t)
    local i = random(1, #t)
    return t[i], i
end

function table.contains(t, needle)
    for ix, elem in ipairs(t) do
        if elem == needle then
            return true, ix
        end
    end
    return false
end

function table.some(t, callback)
    for ix, elem in ipairs(t) do
        if callback(elem, ix, t) then
            return true
        end
    end
    return false
end

function table.every(t, cb)
    for ix, elem in ipairs(t) do
        if not cb(elem, ix, t) then
            return false
        end
    end
    return true
end

function table.enum(t)
    local res = {}
    for i = 1, #t do
        res[t[i]] = i
    end
    return res
end
