--[[
EventUtil, 事件工具，包装Cocos2d事件相关方法：事件注册，...
作者: Andrew Yuan
时间: 2014-12-06
]]--

EventUtil = class("EventUtil")

-------------------------------------------------------------------------------
-- 注册一组事件到指定的Cocos2D层.
-- @function [parent=#EventUtil] register
-- @param #cc.Layer layer Cocos2D层
-- @param #table eventTable 事件对
function EventUtil.register(layer, eventTable)
    local listener = cc.EventListenerTouchOneByOne:create();
    for i=1, table.getn(eventTable) do
    	listener:registerScriptHandler(eventTable[i][1], eventTable[i][2]);
    end
    local eventDispatcher = layer:getEventDispatcher();
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, layer);
end

-------------------------------------------------------------------------------
-- 返回触摸点的位置{x,y}.
-- @function [parent=#EventUtil] getLocation
-- @param touch
function EventUtil.getLocation(touch)
    local location = touch:getLocation();
--    print(string.format("onTouchMoved: %0.2f, %0.2f", location.x, location.y));
    return location;
end

return EventUtil