
local TexasHoldemPokerScene = class("TexasHoldemPokerScene",function()
    return cc.Scene:create()
end)

function TexasHoldemPokerScene.create()
    local scene = TexasHoldemPokerScene.new()
    scene:addChild(scene:createlayerTable())
    scene:addChild(scene:createLayerMenu())
    return scene
end


function TexasHoldemPokerScene:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.schedulerID = nil
end

function TexasHoldemPokerScene:playBgMusic()
    local bgMusicPath = cc.FileUtils:getInstance():fullPathForFilename("background.mp3") 
    cc.SimpleAudioEngine:getInstance():playMusic(bgMusicPath, true)
    local effectPath = cc.FileUtils:getInstance():fullPathForFilename("effect1.wav")
    cc.SimpleAudioEngine:getInstance():preloadEffect(effectPath)
end

function TexasHoldemPokerScene:creatDog()
    local frameWidth = 105
    local frameHeight = 95

    -- create dog animate
    local textureDog = cc.Director:getInstance():getTextureCache():addImage("dog.png")
    local rect = cc.rect(0, 0, frameWidth, frameHeight)
    local frame0 = cc.SpriteFrame:createWithTexture(textureDog, rect)
    rect = cc.rect(frameWidth, 0, frameWidth, frameHeight)
    local frame1 = cc.SpriteFrame:createWithTexture(textureDog, rect)

    local spriteDog = cc.Sprite:createWithSpriteFrame(frame0)
    spriteDog:setPosition(self.origin.x, self.origin.y + self.visibleSize.height / 4 * 3)
    spriteDog.isPaused = false

    local animation = cc.Animation:createWithSpriteFrames({frame0,frame1}, 0.5)
    local animate = cc.Animate:create(animation);
    spriteDog:runAction(cc.RepeatForever:create(animate))

    -- moving dog at every frame
    local function tick()
        if spriteDog.isPaused then return end
        local x, y = spriteDog:getPosition()
        if x > self.origin.x + self.visibleSize.width then
            x = self.origin.x
        else
            x = x + 1
        end

        spriteDog:setPositionX(x)
    end

    self.schedulerID = cc.Director:getInstance():getScheduler():scheduleScriptFunc(tick, 0, false)

    return spriteDog
end

-- create farm
function TexasHoldemPokerScene:createlayerTable()
    local layerTable = cc.Layer:create()
    -- 添加牌桌背景
    local bg = cc.Sprite:create("card/pic/bg.png")
    -- 总是放置的中心位置, Cocos总是以左下角为坐标原点
    bg:setPosition(self.origin.x + self.visibleSize.width / 2, self.origin.y + self.visibleSize.height / 2)
    print("背景宽度: " .. bg:getTexture():getPixelsWide())
    print("背景高度: " .. bg:getTexture():getPixelsHigh())
    layerTable:addChild(bg)
    
    -- 将所有的牌铺在桌面上(1: 梅花, 2: 方片, 3: 红心, 4: 黑桃, 5: 大小王)
    local startX = 60
    local startY = 200
    for i = 1, 5 do
        for j = 3, 17 do
            if (i < 5 and j < 16) or (i >= 5 and j >= 16) then
                local card = cc.Sprite:create("card/pic/a" .. i .. "_" .. j .. ".png")
                card:setPosition(startX + (j - 3) * 80, startY + (i - 1) * 100)
                layerTable:addChild(card)
            end
        end
    end

--    -- add land sprite
--    for i = 0, 3 do
--        for j = 0, 1 do
--            local spriteLand = cc.Sprite:create("land.png")
--            spriteLand:setPosition(200 + j * 180 - i % 2 * 90, 10 + i * 95 / 2)
--            layerTable:addChild(spriteLand)
--        end
--    end
--
--    -- add crop
--    local frameCrop = cc.SpriteFrame:create("crop.png", cc.rect(0, 0, 105, 95))
--    for i = 0, 3 do
--        for j = 0, 1 do
--            local spriteCrop = cc.Sprite:createWithSpriteFrame(frameCrop);
--            spriteCrop:setPosition(210 + j * 180 - i % 2 * 90, 40 + i * 95 / 2)
--            layerTable:addChild(spriteCrop)
--        end
--    end
--
--    -- add moving dog
--    local spriteDog = self:creatDog()
--    layerTable:addChild(spriteDog)
--
    -- handing touch events
    local touchBeginPoint = nil
    local function onTouchBegan(touch, event)
        local location = touch:getLocation()
        --cclog("onTouchBegan: %0.2f, %0.2f", location.x, location.y)
        touchBeginPoint = {x = location.x, y = location.y}
--        spriteDog.isPaused = true
        -- CCTOUCHBEGAN event must return true
        return true
    end

    local function onTouchMoved(touch, event)
        local location = touch:getLocation()
        --cclog("onTouchMoved: %0.2f, %0.2f", location.x, location.y)
        if touchBeginPoint then
            local cx, cy = layerTable:getPosition()
            layerTable:setPosition(cx + location.x - touchBeginPoint.x,
                cy + location.y - touchBeginPoint.y)
            touchBeginPoint = {x = location.x, y = location.y}
        end
    end

    local function onTouchEnded(touch, event)
        local location = touch:getLocation()
        --cclog("onTouchEnded: %0.2f, %0.2f", location.x, location.y)
        touchBeginPoint = nil
--        spriteDog.isPaused = false
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = layerTable:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, layerTable)
--
--    local function onNodeEvent(event)
--        if "exit" == event then
--            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.schedulerID)
--        end
--    end
--    layerTable:registerScriptHandler(onNodeEvent)

    return layerTable
end

-- create menu
function TexasHoldemPokerScene:createLayerMenu()

    local layerMenu = cc.Layer:create()
--    local menuPopup, menuTools, effectID
--
--    local function menuCallbackClosePopup()
--        -- stop test sound effect
--        cc.SimpleAudioEngine:getInstance():stopEffect(effectID)
--        menuPopup:setVisible(false)
--    end
--    
--    local function menuCallbackOpenPopup()
--        -- loop test sound effect
--        local effectPath = cc.FileUtils:getInstance():fullPathForFilename("effect1.wav")
--        effectID = cc.SimpleAudioEngine:getInstance():playEffect(effectPath)
--        menuPopup:setVisible(true)
--    end
--
--    -- add a popup menu
--    local menuPopupItem = cc.MenuItemImage:create("menu2.png", "menu2.png")
--    menuPopupItem:setPosition(0, 0)
--    menuPopupItem:registerScriptTapHandler(menuCallbackClosePopup)
--    menuPopup = cc.Menu:create(menuPopupItem)
--    menuPopup:setPosition(self.origin.x + self.visibleSize.width / 2, self.origin.y + self.visibleSize.height / 2)
--    menuPopup:setVisible(false)
--    layerMenu:addChild(menuPopup)
--
--    -- add the left-bottom "tools" menu to invoke menuPopup
--    local menuToolsItem = cc.MenuItemImage:create("menu1.png", "menu1.png")
--    menuToolsItem:setPosition(0, 0)
--    menuToolsItem:registerScriptTapHandler(menuCallbackOpenPopup)
--    menuTools = cc.Menu:create(menuToolsItem)
--    local itemWidth = menuToolsItem:getContentSize().width
--    local itemHeight = menuToolsItem:getContentSize().height
--    menuTools:setPosition(self.origin.x + itemWidth/2, self.origin.y + itemHeight/2)
--    layerMenu:addChild(menuTools)

    return layerMenu
end

return TexasHoldemPokerScene
