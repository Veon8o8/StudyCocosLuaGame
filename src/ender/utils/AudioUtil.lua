--[[
AudioUtil, 声音工具，包装Cocos2d播放声音的方法
作者: Andrew Yuan
时间: 2014-12-06
]]--

AudioUtil = class("AudioUtil")

-------------------------------------------------------------------------------
-- 播放一段音乐.
-- @function [parent=#AudioUtil] playMusic
-- @param #string filename 声音文件的路径
-- @param #boolean bLoop 是否循环播放
function AudioUtil.playMusic(filename, bLoop)
    local musicPath = cc.FileUtils:getInstance():fullPathForFilename(filename);
    cc.SimpleAudioEngine:getInstance():playMusic(musicPath, bLoop);
end

-------------------------------------------------------------------------------
-- 预先加载音效.
-- @function [parent=#AudioUtil] preloadEffect
-- @param #string filename 声音文件的路径
function AudioUtil.preloadEffect(filename)
    local effectPath = cc.FileUtils:getInstance():fullPathForFilename(filename);
    cc.SimpleAudioEngine:getInstance():preloadEffect(effectPath);
end

-------------------------------------------------------------------------------
-- 播放音效.
-- @function [parent=#AudioUtil] playEffect
-- @param #string filename 声音文件的路径
function AudioUtil.playEffect(filename)
    local effectPath = cc.FileUtils:getInstance():fullPathForFilename(filename);
    effectID = cc.SimpleAudioEngine:getInstance():playEffect(effectPath);
end

return AudioUtil