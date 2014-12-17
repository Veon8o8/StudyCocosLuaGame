-- 单元测试框架, 用于测试游戏中可能使用的工具类方法, 包括
-- StringUtil
-- ArrayUtil

require "ender.test.TestCase"

require "ender.test.utils.StringUtilTest"
require "ender.test.utils.ArrayUtilTest"

local TestScene = class("TestScene",function()
    return cc.Scene:create()
end)

function TestScene.create()
    local scene = TestScene.new()
    scene:addChild(scene:createLayerFarm())

    StringUtilTest:new().run()
    ArrayUtilTest:new().run()
    return scene
end


function TestScene:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.schedulerID = nil
end

-- create farm
function TestScene:createLayerFarm()
    local layerFarm = cc.Layer:create()
    -- add in farm background
    local bg = cc.Sprite:create("farm.jpg")
    bg:setPosition(self.origin.x + self.visibleSize.width / 2 + 80, self.origin.y + self.visibleSize.height / 2)
    layerFarm:addChild(bg)

    return layerFarm
end

return TestScene
