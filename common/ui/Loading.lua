local Loading = class("Loading", game.extend.UINode);

Loading.Intance = nil;

function Loading:ctor(text)	
	self._loadingLayer = ccui.Layout:create() ;
	self._loadingLayer:setTouchEnabled(true);
	self._loadingLayer:setSwallowTouches(true);
	self._loadingDisplay = cc.Sprite:createWithSpriteFrameName("Public-jhhh.png");
	local size = cc.Director:getInstance():getWinSize(); 
	self._loadingLayer:setContentSize(size);
	--self._loadingDisplay:setPosition(size.width / 2, size.height / 2);
	--self._loadingLayer:addChild(self._loadingDisplay);
	self:addChild(self._loadingLayer);
	self:setContentSize(size);
	self:setAnchorPoint(0,0);
	
	local loadingDisplaySize = self._loadingDisplay:getContentSize();

	self._container = cc.Node:create();
	self._loadingLayer:addChild(self._container);

	self._container:addChild(self._loadingDisplay);
	self._loadingDisplay:setPosition(loadingDisplaySize.width / 2, loadingDisplaySize.height / 2);
	self._container:setContentSize(loadingDisplaySize);

	if  type(text) == "string" and string.len(text) > 0 then
		if  not self._loadingText then
			self._loadingText = cc.Label:create();
			self._loadingText:setSystemFontSize(28);
			self._loadingText:setAnchorPoint(0,0.5);
			self._container:addChild(self._loadingText);
		end
		self._loadingText:setString(text);
	end
	self._container:setAnchorPoint(0.5,0.5);
	self._container:setPosition(size.width / 2, size.height / 2);

	Loading.Intance = self;

	self:setOnExitCallback(function( )
		if Loading.Intance then
			Loading.Intance = nil;
		end
	end)

	if self._loadingDisplay then
		--self._loadingDisplay:stopAllActions();
		self._loadingDisplay:runAction(cc.RepeatForever:create(cc.RotateBy:create(0.35,90)));
	end

end

function Loading:setText(text,textColor)
	self._loadingText:setString(text);
	if textColor then
	   self._loadingText:setTextColor(textColor);
    end

    --更新尺寸
    local loadingDisplaySize = self._loadingDisplay:getContentSize();
    local loadingTextSize = self._loadingText:getContentSize();
    self._loadingText:setPosition(loadingDisplaySize.width + 5 , loadingDisplaySize.height / 2);
    self._container:setContentSize(cc.size( loadingDisplaySize.width + 5 + loadingTextSize.width , loadingDisplaySize.height ));
end


function Loading:start(text,textColor)
	if not Loading.Intance then
		Loading.Intance = Loading:create(text);
		manager.app:getTopView():addChild(Loading.Intance);
	end
	Loading.Intance:setText(text,textColor);
end

function Loading:stop()
	print("Loading.Intance:",Loading.Intance);
	if Loading.Intance then
		Loading.Intance:removeFromParent();
	end
end


return Loading;