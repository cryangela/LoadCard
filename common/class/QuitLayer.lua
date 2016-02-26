local QuitLayer=class("QuitLayer", cc.load("mvc").ViewBase)
function QuitLayer:onCreate()
	self:loadCsb("quitLayer")
	local btn_queding = self:getWidget("btn_queding")
	btn_queding:addTouchEventListener(function()
		self:removeFromParent()
		gDeskScene:removeFromParent()
		local Main = include("common.views.CommonMainScene"):create()
		manager.app:addView(Main)
	end)
	local btn_quxiao = self:getWidget("btn_quxiao")
	btn_quxiao:addTouchEventListener(function()
		self:removeFromParent()
	end)
end
return QuitLayer