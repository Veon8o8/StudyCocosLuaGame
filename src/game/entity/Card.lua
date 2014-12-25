--[[
版权信息
]]--

-------------------------------------------------------------------------------
-- 实体: 一张牌.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-25.
-- @module Card
Card = class("Card");

-------------------------------------------------------------------------------
-- 牌的x坐标.
-- @field [parent=#Card] #float x
Card.x = 0;
-------------------------------------------------------------------------------
-- 牌的y坐标.
-- @field [parent=#Card] #float y
Card.y = 0;
-------------------------------------------------------------------------------
-- 牌的宽度.
-- @field [parent=#Card] #float width
Card.width = 0;
-------------------------------------------------------------------------------
-- 牌的高度.
-- @field [parent=#Card] #float height
Card.height = 0;
-------------------------------------------------------------------------------
-- 牌的精灵对象.
-- @field [parent=#Card] #userdata bitmap
Card.bitmap = nil;
-------------------------------------------------------------------------------
-- 牌的名字.
-- @field [parent=#Card] #string name
Card.name = "";
-------------------------------------------------------------------------------
-- 是否背面.
-- @field [parent=#Card] #boolean rear
Card.rear = false;
-------------------------------------------------------------------------------
-- 是否被点击.
-- @field [parent=#Card] #boolean clicked
Card.clicked = false;

-- TODO: 实现牌对象的OOP
function Card:new(o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

-------------------------------------------------------------------------------
-- 定义 Card 的构造函数.
-- @function [parent=#Card] ctor
-- @param #float width 牌的宽度设置
-- @param #float height 牌的高度设置
-- @param #float bitmap 牌的精灵设置
function Card:ctor(width, height, bitmap)
    self.width = width;
    self.height = height;
    self.bitmap = bitmap;
end

-------------------------------------------------------------------------------
-- 设置牌的位置.
-- @function [parent=#Card] setLocation
-- @param #float x 场景切换的类型
-- @param #float y 场景名
function Card.setLocation(x, y)
    self.x = x;
    self.y = y;
end

-------------------------------------------------------------------------------
-- 设置牌的名字.
-- @function [parent=#Card] setName
-- @param #string name 牌的名字
function Card.setName(name)
    self.name = name;
end

-------------------------------------------------------------------------------
-- 得到牌的原始区域.
-- @function [parent=#Card] getSRC
-- @return #cc.rect
function Card.getSRC()
    return cc.rect(0, 0, width, width);
end

-------------------------------------------------------------------------------
-- 得到牌的目标区域.
-- @function [parent=#Card] getDST
-- @return #cc.rect
function Card.getDST()
    return cc.rect(x, y, x + width, y + width);
end

return Card;