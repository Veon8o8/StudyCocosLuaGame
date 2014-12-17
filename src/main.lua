
cc.FileUtils:getInstance():addSearchPath("src")
cc.FileUtils:getInstance():addSearchPath("res")

-- CC_USE_DEPRECATED_API = true
require "cocos.init"

-- Ender Utils
require "ender.init"

-- 控制变量, 是否使用单元测试
local isUnitTestMode = false

-- cclog
local cclog = function(...)
    print(string.format(...))
end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
    return msg
end

local function main()
    collectgarbage("collect")
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

    -- initialize director
    local director = cc.Director:getInstance()

    --turn on display FPS
--    director:setDisplayStats(true)

    --set FPS. the default value is 1.0/60 if you don't call this
    director:setAnimationInterval(1.0 / 60)
    
--    cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(480, 320, 0)
    cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(1280, 720, 0)
    
    if isUnitTestMode then
        --create test scene
        CCDirectorUtil.gotoScene("TestScene")
    else
        --create game scene
--        CCDirectorUtil.gotoScene("GameScene")
        CCDirectorUtil.gotoScene("CardScene")
--        gameScene:playBgMusic()
    end

end


local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    error(msg)
end
