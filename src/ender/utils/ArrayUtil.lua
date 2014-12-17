--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 数组工具.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module ArrayUtil
ArrayUtil = class("ArrayUtil")

-------------------------------------------------------------------------------
-- 返回table的大小.
-- @function [parent=#ArrayUtil] size
-- @param #table input 需要操作的数组
-- @return #int 数组的大小
function ArrayUtil.size(input)
    return table.getn(input)
end

-------------------------------------------------------------------------------
-- 返回table的最大元素(只能对数值进行操作).
-- @function [parent=#ArrayUtil] max
-- @param #table input 需要操作的数组
-- @return #int 最大元素的值
function ArrayUtil.max(input)
    return math.max(unpack(input))
end

-------------------------------------------------------------------------------
-- 返回table的最小元素(只能对数值进行操作).
-- @function [parent=#ArrayUtil] max
-- @param #table input 需要操作的数组
-- @return #int 最小元素的值
function ArrayUtil.min(input)
    return math.min(unpack(input))
end

-------------------------------------------------------------------------------
-- 填充table的每一个元素为val.
-- @function [parent=#ArrayUtil] fill
-- @param #table input 需要操作的数组
-- @param #any val 需要填充的值
-- @param #int startIndex 开始的索引(可选)
-- @param #int endIndex 结束的索引(可选)
-- @return #table 填充后的数组
function ArrayUtil.fill(input, val, startIndex, endIndex)
    if startIndex ~= nil then
        if endIndex ~= nil then
            -- 固定数组长度不做扩展
            endIndex = math.min(table.getn(input), endIndex)
            for i = startIndex, endIndex do
                input[i] = val
            end
        else
            for i=startIndex, table.getn(input) do
                input[i] = val
            end
        end
    else
        for i=1, table.getn(input) do
        	input[i] = val
        end
    end
    return input
end

-------------------------------------------------------------------------------
-- 初始化table的每一个元素为val, 填充长度为n.
-- @function [parent=#ArrayUtil] init
-- @param #table input 需要操作的数组
-- @param #any val 需要填充的值
-- @param #int n 填充的数量
-- @return #table 填充后的数组
function ArrayUtil.init(input, val, n)
    for i=1, n do
        input[i] = val
    end
    return input
end

-------------------------------------------------------------------------------
-- 排序输出table. 可排序字符串数组(字典排序)
-- @function [parent=#ArrayUtil] sort
-- @param #table input 需要操作的数组
-- @return #table 排序后的数组
function ArrayUtil.sort(input)
    table.sort(input)
    return input
end

-------------------------------------------------------------------------------
-- 输出表示table的字符串
-- @function [parent=#ArrayUtil] toString
-- @param #table input 需要操作的数组
-- @return #string 数组的字符串表示, 以","分隔
function ArrayUtil.toString(input)
    local ret = ""
    for i = 1, table.getn(input) do
        if i > 1 then
            ret = ret .. ","
        end
        ret = ret .. input[i]
    end
    return ret
end

return ArrayUtil