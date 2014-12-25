--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 导演工具.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module CCDirectorUtil
CCDirectorUtil = class("CCDirectorUtil");

-------------------------------------------------------------------------------
-- 场景切换.
-- @function [parent=#CCDirectorUtil] createMenu
-- @param #string sceneName 场景名字
function CCDirectorUtil.gotoScene(sceneName)
    print("数据类型: " .. type(sceneName));
    local gameScene = nil;
    if type(sceneName) == "string" then
        gameScene = require(sceneName).create();
    elseif type(sceneName) == "userdata" then
        gameScene = sceneName;
    end
    
    if gameScene ~= nil then
        if cc.Director:getInstance():getRunningScene() then
            cc.Director:getInstance():replaceScene(gameScene);
        else
            cc.Director:getInstance():runWithScene(gameScene);
        end
    end
end

return CCDirectorUtil;