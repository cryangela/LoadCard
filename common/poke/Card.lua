--牌的计算相关
local Card = class("Card");

local CardValueNum = 13;

function Card:Value(cardValue)
    return math.floor(cardValue % CardValueNum);
end

function Card:Color(cardValue)
	return math.floor(cardValue / CardValueNum);
end

--是否为有效的牌的值
function Card:isValidId(cardValue)
	return cardValue >= 13 and cardValue <= 66
end

--是否为大王
function Card:isBigKing(cardValue)
	return cardValue == 66;
end

--是否为小王
function Card:isSmallKing(cardValue)
	return cardValue == 65;
end

--是否为牌背
function Card:isBack(cardValue)
	return cardValue == config.Poke.Back;
end

return Card;