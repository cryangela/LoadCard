local PlayGood=class("PlayGood", cc.load("mvc").ViewBase)
function PlayGood:onCreate()
    self:loadCsb("PlayGood")
    local cancel = self:getWidget("btn_cancel1")
    cancel:addClickEventListener(function()
        self:removeFromParent()
    end)
    local btn1 = self:getWidget("btn_wupin1")
    btn1:addClickEventListener(function()
        self:removeFromParent()
        local PlayLayer = include("common.class.PlayLayer"):create()
        manager.app:addView(PlayLayer)
    end)
    local g = cc.ParticleGalaxy:create()
    g:setPosition(360,230)
    self:addChild(g)

end
return PlayGood;
