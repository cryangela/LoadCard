local ChatLayer=class("ChatLayer", cc.load("mvc").ViewBase)

function ChatLayer:onCreate()
      self:loadCsb("ChatLayer")
      local garidLayout = game.extend.Grid:create();
      garidLayout:setMargin(30);
      garidLayout:setMaxVec(1);
      local ScrollView = self:getWidget("ScrollView_2");
      ScrollView:setContentSize(666,330);
      ScrollView:addChild(garidLayout);
      for i=1,6 do
          local sp = ccui.Button:create("icon/duanyu"..i..".png")
          sp:setSwallowTouches(false)
          sp:addClickEventListener(function()
              local time = cc.DelayTime:create(0.2)
              local fun = cc.CallFunc:create(function()
              self:removeFromParent()
              end)
          local seq = cc.Sequence:create(time,fun)
          self:runAction(seq)
          end)
          garidLayout:addChild(sp)
      end
      garidLayout:updateContent();
      ScrollView:setInnerContainerSize(garidLayout:getContentSize());
      local panel = self:getWidget("Panel_1");
      panel:addClickEventListener(function()
          self:removeFromParent()
      end)

end

return ChatLayer;