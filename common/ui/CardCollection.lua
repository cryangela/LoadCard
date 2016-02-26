--手牌集合
local CardCollection = class("CardCollection",game.extend.UINode);

function CardCollection:ctor()
	self:enableNodeEvents();
end

--添加手牌
--@card "common.ui.Card"
function CardCollection:addCard(card)
	self:addChild(card);
	card:setTouchEnabled(true);
	card:addTouchEventListener(function(card,eventType)
		 self:onCardTouch(card,eventType);
	end);
end

function CardCollection:onEnter( ... )

end

--获取所有手牌
function CardCollection:getCards()
	return self:getChildren();
end

--重写此方法
--设置牌的坐标并设置self的大小
function CardCollection:updateDisplay( ... )
	
end

--牌触摸事件的回调
--@card      触摸的牌
--@eventType  
function CardCollection:onCardTouch(card,eventType)
 	
end


return CardCollection;