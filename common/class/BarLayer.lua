local BarLayer = class("BarLayer", cc.load("mvc").ViewBase)
function BarLayer:onCreate()
    self:loadCsb("BarLayer")
    local panel = self:getWidget("Panel_1")
    panel:addClickEventListener(function()
        self:removeFromParent()
    end)
    local btn3 = self:getWidget("Button_3")
    btn3:addTouchEventListener(function()
        btn3:setOpacity(150)
        local sp = cc.Sprite:create("icon/tuoguan2.png")
        sp:setPosition(1180,130)
        self:addChild(sp)
        local sp1 = cc.Sprite:create("icon/tuoguan1.png")
        sp1:setPosition(1030,80)
        self:addChild(sp1) 
    end)
    local btn5 = self:getWidget("Button_5")
    btn5:addTouchEventListener(function()
        self:removeFromParent()
        local set = include("common.class.SetLayer"):create()
        manager.app:addView(set)
    end)
    local btn1 = self:getWidget("Button_1")
    btn1:addTouchEventListener(function()
        local quit = include("common.class.QuitLayer"):create()
        manager.app:addView(quit)
    end)
    local btn2 = self:getWidget("Button_2")
    btn2:addTouchEventListener(function()
        self:removeFromParent()
        local HelpLayer = include("common.class.HelpLayer"):create()
        manager.app:addView(HelpLayer)
    end)
    local btn4 = self:getWidget("Button_4")
    btn4:addTouchEventListener(function()
        self:removeFromParent()
        local chat = include("common.class.ChatLayer"):create()
        manager.app:addView(chat)
    end)
   
end
return BarLayer;