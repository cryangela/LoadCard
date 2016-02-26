local FrameBox = class("FrameBox", game.extend.UINode)
function FrameBox:ctor(text, callback)
	self:load("UI/FrameBox.csb");

	FrameBox.Intance = self;

	self:setAnchorPoint(0.5, 0.5);
	self.layer = ccui.Layout:create();	
	local size = cc.Director:getInstance():getWinSize(); 
	self:setPosition(size.width / 2, size.height / 2);
	self.layer:setContentSize(size);
	self.layer:setAnchorPoint(0.5, 0.5);
	self.layer:setPosition(self:getContentSize().width / 2, self:getContentSize().height / 2);
	self:addChild(self.layer, -1)
	self.layer:setOpacity(200)
	self.layer:setTouchEnabled(true);
	self.layer:setSwallowTouches(true);
	local btn_no = self:getWidget("Button_no")
	local btn_yes = self:getWidget("Button_yes")

	self._back = self:getWidget("back");
	local backSize = self._back:getContentSize();

	self._textLabel = cc.Label:create();
	self._back:addChild(self._textLabel);
	self._textLabel:setString(text);
	self._textLabel:setSystemFontSize(26);
	self._textLabel:setTextColor(cc.c4b(61, 71, 100, 255));
	self._textLabel:setPosition(backSize.width / 2 , backSize.height * 0.68);

	if btn_yes then
		btn_yes:setClickEvent(function(button) 
			self:_remove();
			if callback then
				callback();
			end
		end)
	end

	if btn_no then
		btn_no:setClickEvent(function(button) 
			self:_remove(true);
		end)
	end

	self:setOnExitCallback(function( )
		if FrameBox.Intance then
			FrameBox.Intance = nil;
		end		
	end)
end

function FrameBox:_start()
	if FrameBox.Intance then
		FrameBox.Intance:setScale(0);
		local action = cc.Sequence:create(cc.ScaleTo:create(0.1, 0.9),cc.ScaleTo:create(0.1, 1.1),cc.ScaleTo:create(0.1, 1));
		FrameBox.Intance:runAction(action);
	end
end

function FrameBox:start(text, callback)
	if not FrameBox.Intance then
		FrameBox.Intance = FrameBox:create(text, callback);
		manager.app:getTopView():addChild(FrameBox.Intance);
	end
	self:_start();
end
function FrameBox:_remove(animate)
	if FrameBox.Intance then
		animate = animate or false;
		if animate then
			local action = cc.Sequence:create(cc.ScaleTo:create(0.1, 1.1),cc.ScaleTo:create(0.1, 0.2),cc.CallFunc:create(function() 
				FrameBox.Intance:removeFromParent();
			end));
			FrameBox.Intance:runAction(action);
		else
			FrameBox.Intance:removeFromParent();
		end
	end
end

return FrameBox