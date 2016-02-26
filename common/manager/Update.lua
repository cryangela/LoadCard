--游戏更新相关
local Update = class("Update");


--更新游戏
function Update:startGame(callback)
	local commonConfig = manager.app:getCommonConfig(true);
	local requestUrl = "http://" .. commonConfig.gameHost .. "/update/UpdateConfig";

	manager.http:request(requestUrl,function(data) 
		self._updateConfig = json.decode(data);
		self:updateConfig();
		if callback then
		     callback(self._updateConfig);
		end
	end);
end

--刷新游戏更新的配置
function Update:updateConfig()
	--清空路径缓存
	cc.FileUtils:getInstance():clearFullPathCache();

	local gameConfigList = manager.app:getDownloadGameList();
	local downLoadPackages = {};
	for k,v in pairs(gameConfigList) do
	    local gameUpdateConfig = self._updateConfig[k];
	    local gameConfig = manager.app:getGameLocalConfig(k);
	    print("gameUpdateConfig:",json.encode( gameUpdateConfig ) );
	    print("gameConfig:",json.encode( gameConfig ) );
	    if gameUpdateConfig and gameUpdateConfig.packages and gameConfig then
	    	for i,v in ipairs(gameUpdateConfig.packages) do
	    		--获取需要更新的包
	    		if versionCompare(v["version"],gameConfig.version) == 1 then
	    			downLoadPackages[k] =  downLoadPackages[k] or {};
	    			table.insert(downLoadPackages[k],v);
	    		end
	    	end
	    end
	end
	print("需要更新的包:",json.encode(downLoadPackages));
	--self:startGameDownload(downLoadPackages);
	self._downLoadGamePackages = downLoadPackages;
end

--获取需要更新的游戏的包
function Update:getGameDownLoadPackage(gameName)
	return self._downLoadGamePackages[gameName];
end


--检测App的整包更新
function Update:startApp( ... )
	--android
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_ANDROID then
		local args = {}
		local sigs = "()V"
		local luaj = require "cocos.cocos2d.luaj"
		local className = "game/manager/Update"
		local ok,ret  = luaj.callStaticMethod(className,"start",args,sigs)
		if not ok then
		    print("luaj error:", ret)
		else
		    print("The ret is:", ret)
		end
		return ret;
	end
end

return Update;