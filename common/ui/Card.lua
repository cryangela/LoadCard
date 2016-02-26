local Card = class("Card", ccui.ImageView ,require("common.base.Id"));

display.loadSpriteFrames("Image/Card.plist","Image/Card.png");

Card.CardNumNames = {"A","2","3","4","5","6","7","8","9","10","j","q","k"};

function Card:ctor(cardValue)
	if cardValue then
		self:setValue(cardValue);
	end
end

--设置牌的值
function Card:setValue(cardValue)
	if poke.card:isValidId(cardValue) then
		self._originalValue = cardValue;
		self._cardValue = cardValue;
		
		if poke.card:isBigKing(cardValue) then
			return self:loadTexture("red_joker.png",ccui.TextureResType.plistType);
		end

		if poke.card:isSmallKing(cardValue) then
			return self:loadTexture("small_joker.png",ccui.TextureResType.plistType);
		end

		local cardColor = poke.card:Color(cardValue)
		local cardBackName = "card" .. cardColor  .. ".png";
		print(cardBackName);
		self:loadTexture(cardBackName,ccui.TextureResType.plistType);

		local cardNum = poke.card:Value(cardValue);
		print("cardValue:",cardValue);
		local cardNumName;
		if cardColor == 1 or cardColor == 3 then
			cardNumName = Card.CardNumNames[cardNum + 1] .. "_red.png";
		else
			cardNumName = Card.CardNumNames[cardNum + 1] .. "_black.png";
		end
		print("cardNumName" .. cardNumName);

		local cardBackSize = self:getContentSize();

		if not self._cardNum then
			self._cardNum = cc.Sprite:createWithSpriteFrameName(cardNumName);
			self._cardNum:setAnchorPoint(0,1);
			self:addChild(self._cardNum);
		end

		if not self._bottomCardNum then 
			self._bottomCardNum = cc.Sprite:createWithSpriteFrameName(cardNumName);
			self._bottomCardNum:setAnchorPoint(1,0);
			self:addChild(self._bottomCardNum);
		end

		self._cardNum:setPosition(3,cardBackSize.height * 0.96);
		self._cardNum:setSpriteFrame(cardNumName);
		
		self._bottomCardNum:setPosition(cardBackSize.width * 0.96,6);
		self._bottomCardNum:setSpriteFrame(cardNumName);
	end
end

--获取牌的值
function Card:getValue()
	return self._cardValue;
end

--设置为牌背
function Card:setBack()
	self:setValue(config.Poke.Back);
end

--隐藏牌，翻为牌背,实际存在牌值
function Card:hideBack()
	local originalValue = self._originalValue;
	self:setBack();
	self._originalValue = originalValue;
end

--设置牌的状态
function Card:setStatus()

end

function Card:getStatus()
	
end

return Card;