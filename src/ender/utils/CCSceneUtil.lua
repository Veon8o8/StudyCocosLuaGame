--[[
版权信息
]]--

-------------------------------------------------------------------------------
-- 场景工具，包装Cocos2d中场景相关方法，...
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-25.
-- @module CCSceneUtil
CCSceneUtil = class("CCSceneUtil");

-------------------------------------------------------------------------------
-- 创建精灵(Sprite), 指定位置(如果提供location参数).
-- ERROR: 无法在此方法内正确创建Sprite.
-- @function [parent=#CCSceneUtil] create
-- @param #string fileName 创建Sprite的文件路径
-- @param #table location 形如{x=*,y=*}的table
function CCSceneUtil.create(fileName, location)
    local mySprite = cc.Sprite:create(fileName);
    mySprite:setPosition(location.x, location.y);
    return mySprite;
end

return CCSceneUtil;