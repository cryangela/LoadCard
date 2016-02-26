local ActivityLayer=class("ActivityLayer", cc.load("mvc").ViewBase)
function ActivityLayer:onCreate()

	self:loadCsb("Huodong")
	local cancel = self:getWidget("btn_cancel");
	cancel:addClickEventListener(function()
		self:removeFromParent()
	end)
	
end
return ActivityLayer;