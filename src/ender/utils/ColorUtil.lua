--[[
版权信息
]]--

-------------------------------------------------------------------------------
-- 颜色工具，通过不同的参数来创建颜色.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-25.
-- @module ColorUtil
ColorUtil = class("ColorUtil");

-------------------------------------------------------------------------------
-- 通过int参数创建颜色.
-- 注意: cc.c4b(r, g, b, a);中最后一个参数是alpha(透明度).
-- @function [parent=#ColorUtil] createFromInt
-- @param #int intValue 32位的int颜色值.
-- @return #color4btable 带透明色信息的颜色表
function ColorUtil.createFromInt(intValue)
    local color = nil;
    local a,r,g,b;
    local left = intValue;
    a, left = ColorUtil.mod(left, 2^24);
    r, left = ColorUtil.mod(left, 2^16);
    g, b = ColorUtil.mod(left, 2^8);
    print(string.format("a:%d, r:%d, g:%d, b:%d", a, r, g, b));
    color = cc.c4b(r, g, b, a);
    return color;
end

-------------------------------------------------------------------------------
-- 返回两个整数值, 第一个是商, 第二个是余数.
-- @function [parent=#ColorUtil] mod
-- @param #int v1 除数.
-- @param #int v2 被除数.
function ColorUtil.mod(v1, v2)
    local r1 = math.modf(v1 / v2);
    local r2 = v1 % v2;
    return r1, r2;
end

return ColorUtil;