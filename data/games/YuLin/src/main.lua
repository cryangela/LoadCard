local BeiHai = class("BeiHai");

function BeiHai:ctor()
	print("BeiHai:ctor");
	game.BeiHai:run(manager.user.verify.account,manager.user.verify.pswd,false);
end

return BeiHai;