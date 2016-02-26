config = config or {};

config.Poke = {
	Back = 255	
};


--牌的类型
config.Poke.Type = {
	Unkown                  = 0,
	SingleCard              = 1,  --单张
	Pair                    = 2,  --一对
	Triplet                 = 3,  --三条
	Bomb                    = 4,  --炸弹
	TripletWithSingleCard   = 5,  --三带一
	TripletWithPair         = 6,  --三带一对
	Sequence                = 7,  --顺子
	SequenceWithPair        = 8,  --连对
	SequenceWIthTriplet     = 9,  --飞机
}