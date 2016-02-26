local PlayLayer=class("PlayLayer", cc.load("mvc").ViewBase)
function PlayLayer:onCreate()
      self:loadCsb("PlayLayer")
      local cancel = self:getWidget("btn_cancel2")
      cancel:addClickEventListener(function()
          self:removeFromParent()
      end)
      local btn1 = self:getWidget("btn_juese2")
      btn1:addClickEventListener(function()
          self:removeFromParent()
          local playGood = include("app.Class.PlayGood"):create()
          manager.app:addView(playGood)
      end)
        
	
end
return PlayLayer;