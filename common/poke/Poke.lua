local Poke = class("Poke");


function Poke:set(value)
	self._value = value;
	self._cardValues =  {};
	for i=1,#self._value do
		table.insert(self._cardValues,poke.card:Value(self._value[i]));
	end
end

function Poke:getTypeNum(num)
	for i=1,#self._value do
		
	end
end

function Poke:type()
	local valueSize = #self._value;
	if valueSize == 1 then
		return config.Poke.Type.SingleCard;
	end

	if valueSize == 2 then
		local v1 = self._cardValues[1];
		local v2 = self._cardValues[2];
		return v1 == v2 and config.Poke.Type.Pair or config.Poke.Type.Unkown;
	end

	if valueSize == 3 then
		local v1 = self._cardValues[1];
		local v2 = self._cardValues[2];
		local v3 = self._cardValues[3];
		
		if  v1 == v2 and v2 == v3 then
			return config.Poke.Type.Triplet;
		end
	end

	if valueSize == 4 then
		local v1 = self._cardValues[1];
		local v2 = self._cardValues[2];
		local v3 = self._cardValues[3];
		local v4 = self._cardValues[4];

		if  v1 == v2 and v2 == v3 and v3 == v4 then
			return config.Poke.Type.Bomb;
		end

		if  v1 == v2 and v2 == v3 and v3 ~= v4  then
			return config.Poke.Type.TripletWithSingleCard;
		end

		if  v4 == v3 and v2 == v3 and v1 ~= v4  then
			return config.Poke.Type.TripletWithSingleCard;
		end
	end

	if valueSize == 5 then
		local v1 = self._cardValues[1];
		local v2 = self._cardValues[2];
		local v3 = self._cardValues[3];
		local v4 = self._cardValues[4];
		local v5 = self._cardValues[5];

		if v1 == v2 and v2 == v3 and v4 == v5 then
			return config.Poke.Type.TripletWithPair;
		end

		if v1 == v2 and v3 == v4 and v4 == v5 then
			return config.Poke.Type.TripletWithPair;
		end
	end

	if valueSize >= 5 then
		local isSequence = true;
		for i = 1,valueSize - 1 do
			if  math.abs(self._cardValues[i] - self._cardValues[i + 1]) ~= 1 then
				isSequence = false;
				break;
			end
		end
		if isSequence then
			return config.Poke.Type.Sequence;
		end
	end

	if valueSize >= 6 then
		local isSequenceWithPair = true;
		for i = 1,valueSize - 2 do
			if i % 2 == 0 and self._cardValues[i] == self._cardValues[i + 1] and math.abs(self._cardValues[i] - self._cardValues[i + 2]) ~= 1 then
				isSequenceWithPair = false;
				break;
			end
		end
		if isSequenceWithPair then
			return config.Poke.Type.SequenceWithPair;
		end

		
	end

	return config.Poke.Type.Unkown;
end

return Poke;