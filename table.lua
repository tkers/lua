local min <const> = math.min
local max <const> = math.max
local random <const> = math.random

function table.contains(list, needle)
    for i, elem in ipairs(list) do
        if elem == needle then
            return true, i
        end
    end
    return false
end

function table.copy(list)
    local res = {}
    for i = 1, #list do
        res[i] = list[i]
    end
    return res
end

function table.drop(list, n)
    local res = {}
    for i = n + 1, #list do
        res[i - n] = list[i]
    end
    return res
end

function table.enum(list)
    local res = {}
    for i = 1, #list do
        res[list[i]] = i
    end
    return res
end

function table.equals(a, b)
    local na, nb = #a, #b
    if na ~= nb then
        return false
    end
    for i = 1, na do
        if a[i] ~= b[i] then
            return false
        end
    end
    return true
end

function table.every(list, cb)
    for i, elem in ipairs(list) do
        if not cb(elem, i, list) then
            return false
        end
    end
    return true
end

function table.filter(list, callback)
    local res = {}
    for i, elem in ipairs(list) do
        if callback(elem, i, list) then
            res[#res + 1] = elem
        end
    end
    return res
end

function table.find(list, callback)
    for i, elem in ipairs(list) do
        if callback(elem, i, list) then
            return elem, i
        end
    end
end

function table.map(list, callback)
    local res = {}
    for i, elem in ipairs(list) do
        res[i] = callback(elem, i, list)
    end
    return res
end

function table.pluck(list, key)
    local res = {}
    for i = 1, #list do
        res[i] = list[i][key]
    end
    return res
end

function table.random(list)
    local i = random(1, #list)
    return list[i], i
end

function table.reduce(list, callback, initial)
    local res = initial
    for i, elem in ipairs(list) do
        res = callback(res, elem, i, list)
    end
    return res
end

function table.reject(list, callback)
    local res = {}
    for i, elem in ipairs(list) do
        if not callback(elem, i, list) then
            res[#res + 1] = elem
        end
    end
    return res
end

function table.reversed(list)
    local res = {}
    local len = #list
    for i = len, 1, -1 do
        res[len - i + 1] = list[i]
    end
    return res
end

-- in-place version of shuffled()
function table.shuffle(list)
    for i = #list, 2, -1 do
        local j = random(i)
        list[i], list[j] = list[j], list[i]
    end
end

-- returns a copy
function table.shuffled(list)
    local res = {}
    local len = #list
    for i = len, 2, -1 do
        local j = random(i)
        res[len - i + 1] = list[j]
        list[j] = list[i]
    end
    return res
end

function table.some(list, callback)
    for i, elem in ipairs(list) do
        if callback(elem, i, list) then
            return true
        end
    end
    return false
end

function table.sorted(list, comp)
    local res = table.copy(list)
    table.sort(res, comp)
    return res
end

function table.sub(list, from, till)
    if not from then
        from = 1
    elseif from < 0 then
        from = max(1, #list + from + 1)
    end

    if not till then
        till = #list
    elseif till < 0 then
        till = min(#list, #list + till + 1)
    end

    local res = {}
    for i = from, till do
        res[i - from + 1] = list[ix]
    end

    return res
end

function table.take(list, n)
    local res = {}
    local last = min(#list, n)
    for i = 1, last do
        res[i] = list[i]
    end
    return res
end

function table.zipWith(a, b, callback)
    local res = {}
    local len = min(#a, #b)
    for i = 1, len do
        res[i] = callback(a[i], b[i], i)
    end
    return res
end
