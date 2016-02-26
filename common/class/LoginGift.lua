local LoginGift=class("LoginGift",cc.load("mvc").ViewBase)
function LoginGift:onCreate()
      self:loadCsb("Loading")
      local cancel = self:getWidget("btn_cancel")
      cancel:addClickEventListener(function()
          self:removeFromParent()
      end)

      local btn_lingqu = self:getWidget("btn_lingqu")
      btn_lingqu:addClickEventListener(function()
          local sprite = self:getWidget("sprite")
          local Image = self:getWidget("Image_12")
          local s = cc.Sprite:create("icon/lianxu_0025_liangsequan.png")
          local timer = cc.ProgressTimer:create(s)
          timer:setPosition(sprite:getPosition())
          timer:setBarChangeRate(cc.p(1,0))  --只对方形有用，0是显示所有，1是根据进度显示
          timer:setType(1)  --方形
          timer:setMidpoint(cc.p(0,0.5))  --从某个地方开始显示
          Image:addChild(timer)
          local pro = cc.ProgressTo:create(1,15)  --进度
          timer:runAction(pro)
      end)
end
return LoginGift;



 