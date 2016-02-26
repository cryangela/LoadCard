local Success=class("Success", cc.load("mvc").ViewBase)
function Success:onCreate()
    self:loadCsb("duihuanchenggong")
    local sure = self:getWidget("btn_sure");
    sure:addTouchEventListener(function()
      self:removeFromParent()
    end)
    local p = cc.ParticleSystemQuad:create("xingxing.plist")
    p:setPosition(cc.p(640, 630))
    p:setAutoRemoveOnFinish(true);
    p:setTotalParticles(1000)
    p:setDuration(0.5)--时间
    self:addChild(p)
end
return Success;