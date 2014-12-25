--[[
版权信息
]]--

-------------------------------------------------------------------------------
-- 精灵工具，包装Cocos2d精灵相关方法.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module CCSpriteUtil
CCSpriteUtil = class("CCSpriteUtil");

-------------------------------------------------------------------------------
-- 创建精灵(Sprite), 指定位置(如果提供location参数).
-- ERROR: 无法在此方法内正确创建Sprite.
-- @function [parent=#CCSpriteUtil] create
-- @param #string fileName 创建Sprite的文件路径
-- @param #table location 形如{x=*,y=*}的table
function CCSpriteUtil.create(fileName, location)
    local mySprite = cc.Sprite:create(fileName);
    mySprite:setPosition(location.x, location.y);
    return mySprite;
end

return CCSpriteUtil;