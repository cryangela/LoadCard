local Message = class("Message", ccui.Layout,require("common.base.Id"))

--当前存在的提示队列
Message.Arr = {};

function Message:ctor(text)
	local size = cc.Director:getInstance():getWinSize(); 

	self._messageBack = ccui.Layout:create();
	self._messageBack:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid);
	self._messageBack:setBackGroundColor(cc.c3b(0, 0, 0));
	self._messageBack:setPosition(size.width / 2, size.height * 0.55);
	self._messageBack:setAnchorPoint(cc.p(0.5,0.5));
	self:addChild(self._messageBack);
	
	self:setContentSize(size);
	self._messageText = cc.Label:create();
	self._messageText:setSystemFontSize(28);
	self._messageBack:addChild(self._messageText);
	self._messageBack:setCascadeOpacityEnabled(true);

	if text and type(text) == 'string' and string.sub(text,1,1) then
		self._messageText:setString(text);
		print("tip:",text);
	end

	local messageTextSize = self._messageText:getContentSize();
	messageTextSize.width = messageTextSize.width * 1.2;
	messageTextSize.height = messageTextSize.height * 1.2;
	self._messageBack:setContentSize(messageTextSize);
	self._messageText:setPosition(messageTextSize.width / 2 , messageTextSize.height / 2);

	self:setOnExitCallback(function( )
		 Message.Arr[self:getId()] = nil;
	end)
end

function Message:show(text)
	local intance;
	intance = Message:create(text);
	manager.app:getTopView():addChild(intance);

	intance._messageBack:runAction(cc.Sequence:create(
		cc.EaseIn:create(cc.FadeOut:create(3),2),
		cc.CallFunc:create(function()
			intance:removeFromParent();
	end)));

	--计算坐标
	for k,v in pairs(Message.Arr) do
		local action = cc.MoveBy:create(0.18,cc.p(0,v._messageBack:getContentSize().height + 5 ));
		v._messageBack:runAction(cc.EaseIn:create(action,2.5));
	end
	Message.Arr[intance:getId()] = intance;
	return intance;
end


return Message