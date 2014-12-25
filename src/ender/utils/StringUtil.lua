--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 字符串工具.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module StringUtil
StringUtil = class("StringUtil");

-------------------------------------------------------------------------------
-- 返回input字符串的长度.
-- @function [parent=#StringUtil] length
-- @param #string input 需要操作的字符串
-- @return #int 字符串的长度
function StringUtil.length(input)
    return string.len(input)
end

-------------------------------------------------------------------------------
-- 返回被截取前后空白的input字符串. (来源于网络，无修改)
-- @function [parent=#StringUtil] trim
-- @param #string str 需要操作的字符串
-- @return #string 被截取前后空白的input字符串
function StringUtil.trim(s)
    local from = s:match"^%s*()"
    return from > #s and "" or s:match(".*%S", from)
end

-------------------------------------------------------------------------------
-- TODO: 返回转换为大写的字符串. (来源于网络，无修改)
-- @function [parent=#StringUtil] upper
-- @param #string str 需要操作的字符串
-- @return #string 转换为大写的字符串
function StringUtil.upper(str)
    local len = string.len(str)
    local str_tmp = ""
    for i = 1, len do
        local ch = string.sub(str, i, i)
        if ch >= 'a' and ch <= 'z' then
            ch = string.char(string.byte(ch) - 32)
        end
        str_tmp = str_tmp .. ch
    end
    return str_tmp
end

-------------------------------------------------------------------------------
-- TODO: 返回转换为小写的字符串. (来源于网络，无修改)
-- @function [parent=#StringUtil] lower
-- @param #string str 需要操作的字符串
-- @return #string 转换为小写的字符串
function StringUtil.lower(str)
    local len = string.len(str)
    local str_tmp = ""
    for i = 1, len do
        local ch = string.sub(str, i, i)
        if ch >= 'A' and ch <= 'Z' then
            ch = string.char(string.byte(ch) + 32)
        end
        str_tmp = str_tmp .. ch
    end
    return str_tmp
end

-------------------------------------------------------------------------------
-- 返回subString在input中第一次出现的位置.
-- @function [parent=#StringUtil] indexOf
-- @param #string input 需要操作的字符串
-- @param #string subString 需要查找的子串
-- @return #int 子字符串第一次出现的索引位置
function StringUtil.indexOf(input, subString)
    -- 新的知识点: 虚变量的使用
    startIndex, _ = string.find(input, subString)
    return startIndex
end

-------------------------------------------------------------------------------
-- 返回subString在input中最后一次出现的位置.
-- @function [parent=#StringUtil] lastIndexOf
-- @param #string input 需要操作的字符串
-- @param #string subString 需要查找的子串
-- @return #int 子字符串最后一次出现的索引位置
function StringUtil.lastIndexOf(input, subString)
    local startIndex = 0
    repeat 
        startIndex, _ = string.find(input, subString, startIndex + 1)
    until string.find(input, subString, startIndex + 1) == nil -- 对nil的判断使用 XXX -= nil会报错
    return startIndex
end

-------------------------------------------------------------------------------
-- 用szSeparator将szFullString分隔开来成为字符串数组
-- @function [parent=#StringUtil] split
-- @param #string szFullString 需要操作的字符串
-- @param #string szSeparator 分隔符号
-- @return #int 分隔后的字符串数组
function StringUtil.split(szFullString, szSeparator)
    local nFindStartIndex = 1
    local nSplitIndex = 1
    local nSplitArray = {}
    while true do
        local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
        if not nFindLastIndex then
            nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
            break
        end
        nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
        nFindStartIndex = nFindLastIndex + string.len(szSeparator)
        nSplitIndex = nSplitIndex + 1
    end
    return nSplitArray
end

-------------------------------------------------------------------------------
-- 获取子字符串
-- @function [parent=#StringUtil] substring
-- @param #string input 需要操作的字符串
-- @param #int startIndex 子字符串开始的位置
-- @param #int endIndex 子字符串结束的位置
-- @return #string 分隔后的字符串数组
function StringUtil.substring(input, startIndex, endIndex)
    return string.sub(input, startIndex, endIndex)
end

return StringUtil;