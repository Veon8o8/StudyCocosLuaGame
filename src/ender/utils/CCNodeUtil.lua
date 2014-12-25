--[[
版权信息
]]--

-------------------------------------------------------------------------------
-- 节点工具，包装Cocos2d节点处理的相关方法.
-- cc.Node主要功能:
-- <table border="1">
-- <tr><td>每个节点都可以含有子节点</td></tr>
-- <tr><td>节点含有周期性回调的方法(Schedule, Unschedule)</td></tr>
-- <tr><td>可以含有动作(cc.Action)</td></tr>
-- </table>
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-25.
-- @module CCNodeUtil
CCNodeUtil = class("CCNodeUtil");

-------------------------------------------------------------------------------
-- 创建节点(Node), 指定位置(如果提供location参数).
-- @function [parent=#CCNodeUtil] create
-- @param #table location 形如{x=*,y=*}的table
function CCNodeUtil.create(location)
    local myNode = cc.Node:create();
    myNode:setPosition(location.x, location.y);
    return myNode;
end

return CCNodeUtil;