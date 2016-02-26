local FirstLayer=class("FirstLayer",cc.load("mvc").ViewBase)
function FirstLayer:onCreate()
      self:loadCsb("shouchong")
      local panel = self:getWidget("Panel_1")
      panel:addClickEventListener(function()
          self:removeFromParent()
      end)
      --首充缩放
      local image = self:getWidget("img_bg")
      --缩放
      local scaleto = cc.ScaleTo:create(2.0, 1.2)
      local scaleto1 = cc.ScaleTo:create(2.0,1)
      --改变透明度setOpacity(0-255)
      local s = cc.FadeTo:create(2, 200)
      local s1 = cc.FadeTo:create(2, 255)
      --组合
      local spawn = cc.Spawn:create(scaleto,s)
      local spawn1 = cc.Spawn:create(scaleto1,s1)
      --序列
      local seq = cc.Sequence:create(spawn,spawn1)
      --永久
      local repf = cc.RepeatForever:create(seq)
      image:runAction(repf)
      --粒子效果
      local Image = self:getWidget("Image_7")--仅此一次
      local sys1 = cc.ParticleSystemQuad:create("hh.plist")
      sys1:setAutoRemoveOnFinish(true)
      self:addChild(sys1,1)
      --仅此一次
      local gp1 = cc.Sprite:create("icon/zhengzhoujiesuan (2).png")
      gp1:setScale(0.5)
      gp1:setPosition(15,45)
      Image:addChild(gp1)
      local move = cc.MoveTo:create(1.5,cc.p(200,45))
      local scaleto = cc.ScaleTo:create(0.5, 0.8)
      local fun = cc.CallFunc:create(function()
      gp1:removeFromParent()
      end)
      local seq = cc.Sequence:create(move,scaleto,fun)
      gp1:runAction(seq)

end
return FirstLayer;