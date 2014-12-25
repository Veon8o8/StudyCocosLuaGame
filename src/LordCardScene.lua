--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 斗地主场景(局部变量).
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module LordCardScene
local LordCardScene = class("LordCardScene",function()
    return cc.Scene:create();
end)

-- 本地变量
local layerTable;

-------------------------------------------------------------------------------
-- 创建斗地主游戏场景, 包含牌桌和菜单.
-- @function [parent=#LordCardScene] create
-- @return #LordCardScene
function LordCardScene.create()
    local scene = LordCardScene.new();
    scene:addChild(scene:createlayerTable());
    scene:addChild(scene:createLayerMenu());
    return scene;
end

-------------------------------------------------------------------------------
-- 构造函数.
-- @function [parent=#LordCardScene] ctor
function LordCardScene:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize();
    self.origin = cc.Director:getInstance():getVisibleOrigin();
    self.schedulerID = nil;
end

-------------------------------------------------------------------------------
-- 创建一个牌桌场景.
-- @function [parent=#LordCardScene] createlayerTable
-- @return #cc.Layer
function LordCardScene:createlayerTable()

    layerTable = cc.Layer:create();
    
    -- 屏幕中心
    local location = {
        x = self.origin.x + self.visibleSize.width / 2,
        y = self.origin.y + self.visibleSize.height / 2
    };
    
    -- 添加牌桌背景
    local bg = cc.Sprite:create("card/pic/bg.png");
    -- 总是放置的中心位置, Cocos总是以左下角为坐标原点
    bg:setPosition(location.x, location.y);
    print("背景宽度: " .. bg:getTexture():getPixelsWide());
    print("背景高度: " .. bg:getTexture():getPixelsHigh());
    layerTable:addChild(bg);

    return layerTable;
end

-------------------------------------------------------------------------------
-- 创建一个菜单场景.
-- @function [parent=#LordCardScene] createLayerMenu
-- @return #cc.Layer
function LordCardScene:createLayerMenu()

    local layerMenu = cc.Layer:create();
      
    -- 屏幕中心
    local screenCenter = {
        x = self.origin.x + self.visibleSize.width / 2,
        y = self.origin.y + self.visibleSize.height / 2
    };
    
    local color = cc.c3b(0xFF,0xFF,0);

    -- 创建一个Image菜单
    function startMenuItemCallback(sender)
        print("点击了文字开始");
        layerMenu:removeAllChildren();
        -- TODO: 开始发牌.
        self:deal();
    end

    local startMenuItem2 = CCMenuUtil.createMenuItemSprite(
        "card/pic/menu/menu_item_start", color, screenCenter, startMenuItemCallback);

    layerMenu:addChild(CCMenuUtil.createMenu({x=0,y=0}, startMenuItem2));

    return layerMenu;
    
end

-------------------------------------------------------------------------------
-- 发牌.
-- @function [parent=#LordCardScene] deal
-- @return #cc.Layer
function LordCardScene:deal()
    print("发牌");
    
    for idx = 1, 10 do
        local spriteCard = cc.Sprite:create("card/pic/a1_"..(idx + 3)..".png");
        spriteCard:setPosition(400 + idx * 20, 30);
        layerTable:addChild(spriteCard);
        local cardMoveToAction = cc.MoveTo:create(0.6 + idx * 0.04, {x = 500 + idx * 20, y = 60});
        spriteCard:runAction(cardMoveToAction);
    end
end

return LordCardScene
