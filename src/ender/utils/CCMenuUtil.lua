--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 菜单工具.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module CCMenuUtil
CCMenuUtil = class("CCMenuUtil");

-------------------------------------------------------------------------------
-- 创建菜单.
-- @function [parent=#CCMenuUtil] createMenu
-- @param #string position 文字坐标
-- @return #cc.Menu 菜单
function CCMenuUtil.createMenu(position, ...)
    local menu=cc.Menu:create(...);                        --初始化菜单
    menu:setPosition(position.x, position.y);          --设置菜单坐标
    return menu;
end

-------------------------------------------------------------------------------
-- 创建一个字符型的菜单项.
-- @function [parent=#CCMenuUtil] createMenuItemFont
-- @param #string text 文字内容
-- @param #color4table color 字体颜色cc.c3b(R, G, B)或cc.c4b(A, R, G, B)
-- @param #string position 文字坐标
-- @param #string callback 菜单响应事件
-- @return #cc.MenuItemFont 字符型的菜单项
function CCMenuUtil.createMenuItemFont(text, color, position, callback)
    local menuItem=cc.MenuItemFont:create(text);           --初始化菜单项
    menuItem:setString(text);                              --设置文字内容
    menuItem:setColor(color);                              --设置字体颜色
    menuItem:setPosition(position.x, position.y);          --设置文字坐标
    menuItem:registerScriptTapHandler(callback);           --设置菜单响应事件
    return menuItem;
end

-------------------------------------------------------------------------------
-- 创建一个Sprite型的菜单项.
-- @function [parent=#CCMenuUtil] createMenuItemSprite
-- @param #string filename 菜单项图片背景文件名前缀
-- @param #string color 颜色cc.c3b(R, G, B)或cc.c4b(A, R, G, B)
-- @param #string position 文字坐标
-- @param #string callback 菜单响应事件
-- @return #cc.MenuItemFont 字符型的菜单项
function CCMenuUtil.createMenuItemSprite(text, color, position, callback)
    local normalSprite = cc.Sprite:create(text .. "_normal.png");
    local selectedSprite = cc.Sprite:create(text .. "_selected.png");
    -- TODO: 找到disabledSprite的使用场景
    local disabledSprite = cc.Sprite:create(text .. "_disabled.png");
    local menuItem = cc.MenuItemSprite:create(               --初始化菜单项
        normalSprite, selectedSprite, disabledSprite);
    menuItem:setColor(color);                              --设置字体颜色
    menuItem:setPosition(position.x, position.y);          --设置文字坐标
    menuItem:registerScriptTapHandler(callback);           --设置菜单响应事件
    return menuItem;
end

-------------------------------------------------------------------------------
-- 创建一个Image型的菜单项.
-- @function [parent=#CCMenuUtil] createMenuItemImage
-- @param #string filename 菜单项图片背景文件名前缀
-- @param #string color 颜色cc.c3b(R, G, B)或cc.c4b(A, R, G, B)
-- @param #string position 文字坐标
-- @param #string callback 菜单响应事件
-- @return #cc.MenuItemFont 字符型的菜单项
function CCMenuUtil.createMenuItemImage(text, color, position, callback)
    local normalImage = text .. "_normal.png";
    local selectedImage = text .. "_selected.png";
    -- TODO: 找到disabledSprite的使用场景
    local disabledImage = text .. "_disabled.png";
    local menuItem = cc.MenuItemImage:create(              --初始化菜单项
        normalImage, selectedImage, disabledImage);
    menuItem:setColor(color);                              --设置字体颜色
    menuItem:setPosition(position.x, position.y);          --设置文字坐标
    menuItem:registerScriptTapHandler(callback);           --设置菜单响应事件
    return menuItem;
end

return CCMenuUtil;