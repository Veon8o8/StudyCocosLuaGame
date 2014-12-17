--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 导演工具.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module CCDirectorUtil
CCDirectorUtil = class("CCDirectorUtil")

-------------------------------------------------------------------------------
-- 场景切换.
-- @function [parent=#CCDirectorUtil] createMenu
-- @param #string sceneName 场景名字
function CCDirectorUtil.gotoScene(sceneName)
    local scene = require(sceneName)
    local gameScene = scene.create()

    if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(gameScene)
    else
        cc.Director:getInstance():runWithScene(gameScene)
    end
end