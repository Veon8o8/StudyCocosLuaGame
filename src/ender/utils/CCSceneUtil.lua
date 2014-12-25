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
-- 创建一个逐渐过渡到目标颜色的切换动画.
-- @field [parent=#CCSceneUtil] #string FADE
CCSceneUtil.FADE = "fade";
-------------------------------------------------------------------------------
-- 创建一个逐渐透明的过渡动画.
-- @field [parent=#CCSceneUtil] #string CROSS_FADE
CCSceneUtil.CROSS_FADE = "cross_fade";

-------------------------------------------------------------------------------
-- 获取指定类型的场景转换包装.
-- @function [parent=#CCSceneUtil] getTransition
-- @param #string type 场景切换的类型
-- @param #string sceneName 场景名
-- @param #float duration 场景切换的持续时间
function CCSceneUtil.getTransition(type, sceneName, duration, ...)
    local nextScene = require(sceneName).create();
    local trasitionScene = nil;
    -- 参考网址: http://blog.csdn.net/liuhong135541/article/details/24375915.
    if type == CCSceneUtil.FADE then
        trasitionScene = cc.TransitionFade:create(duration, nextScene);
    elseif type == CCSceneUtil.CROSS_FADE then
        trasitionScene = cc.TransitionCrossFade:create(duration, nextScene);
--    elseif type == CCSceneUtil.FADE then
    end
    return trasitionScene;
end

return CCSceneUtil;