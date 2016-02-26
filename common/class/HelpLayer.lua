
local HelpLayer=class("HelpLayer", cc.load("mvc").ViewBase)
function HelpLayer:onCreate()
    self:loadCsb("HelpLayer")
    local cancel = self:getWidget("btn_cancel")
    cancel:addClickEventListener(function()
      self:removeFromParent()
    end)
    local panel = self:getWidget("Panel_1")
    panel:addClickEventListener(function()
      self:removeFromParent()
    end)
 
    local ScrollView = self:getWidget("ScrollView");
    local text = ccui.Text:create();
    text:ignoreContentAdaptWithSize(false);  
    text:setTextAreaSize(cc.size(650, 2200));
    text:setAnchorPoint(0,0);
    text:setFontSize(30);
    text:setColor(cc.c3b(85,67,24))
    ScrollView:addChild(text);
    text:setPosition(0,0);
    text:setString(cc.FileUtils:getInstance():getStringFromFile("fonts/help.txt"));
    ScrollView:setInnerContainerSize(text:getContentSize());

end
return HelpLayer;