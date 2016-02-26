local App = class("App",game.manager.App)

local WritePath =  device.writablePath .. "data/";

--优先查找可读目录
-- local SearchPaths = {
-- 	WritePath .. "gamehall/",
-- 	WritePath .. "res/",
-- 	WritePath .. "res/Image",
-- 	"gamehall/",
-- 	"res/",
-- 	"res/Image"
-- };

--获取惟一设备号
-- function App:getDeviceCode()
-- 	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_ANDROID then
-- 		local args = {}
-- 		local sigs = "(V)Ljava/lang/String;"
-- 		local luaj = require "cocos.cocos2d.luaj"
-- 		local className = "game/manager/App"
-- 		local ok,ret  = luaj.callStaticMethod(className,"getDeviceCode",args,sigs)
-- 		if not ok then
-- 		    print("luaj error:", ret)
-- 		else
-- 		    print("The ret is:", ret)
-- 		end
-- 	end

-- 	--windows
-- 	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
-- 		return "deviceCode__";
-- 	end
-- end

function App:ctor( ... )
	--下载游戏配置
	--self:requestGameConfig();
	--display.loadSpriteFrames("Image/HandIcon.plist","Image/HandIcon.png");
end

function App:requestGameConfig(callback)
	local commonConfig = self:getCommonConfig();
	local requestUrl = "http://" .. commonConfig.gameHost .. "/Config/Game";
	manager.http:request(requestUrl,function(data) 
		self._gamesConfig = json.decode(data);
		callback(self._gamesConfig);
	end);
end

--获取程序版本号
function App:getVersion( ... )
	--android
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_ANDROID then
		local args = {}
		local sigs = "()Ljava/lang/String;"
		local luaj = require "cocos.cocos2d.luaj"
		local className = "game/manager/App"
		local ok,ret  = luaj.callStaticMethod(className,"getVersion",args,sigs)
		if not ok then
		    print("luaj error:", ret)
		else
		    print("The ret is:", ret)
		end
		return ret;
	end

	--windows
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return "1.0.0";
	end
end

--wifi网络是否可用
function App:isWifiAvailable( ... )
	--android
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_ANDROID then
		local args = {}
		local sigs = "()Z"
		local luaj = require "cocos.cocos2d.luaj"
		local className = "game/manager/App"
		local ok,ret  = luaj.callStaticMethod(className,"isWifiAvailable",args,sigs)
		if not ok then
		    print("luaj error:", ret)
		else
		    print("The ret is:", ret)
		end
		return ret;
	end

	--windows
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return true;
	end
end

--gprs网络是否可用
function App:isGprsAvailable( ... )
	--android
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_ANDROID then
		local args = {}
		local sigs = "()Z"
		local luaj = require "cocos.cocos2d.luaj"
		local className = "game/manager/App"
		local ok,ret  = luaj.callStaticMethod(className,"isGprsAvailable",args,sigs)
		if not ok then
		    print("luaj error:", ret)
		else
		    print("The ret is:", ret)
		end
		return ret;
	end

	--windows
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return true;
	end
end


--启动游戏平台
function App:startGameHall()
	--切换本地存储文件
	manager.localStore:resetStoreFile(config.StoreData);
	self:setState(config.AppState.Main);
	cc.FileUtils:getInstance():setSearchPaths(self:getSearchPaths());
	require("app.main"):create();
end

--退出游戏,到平台
function App:exitGame()
	--保存声音配置
	manager.sound:save();
	--设置屏幕方法
	manager.app:setOrientation(1);
	--清除服务器回调
	manager.command:clearCallbacks();
	--清除所有加载的纹理
	self:clearAllImages();
	--停止所有音乐
	manager.sound:stopAll();
	--再次启动大厅
	self:startGameHall();
end


function App:getState()
	return self._state;
end

function App:setState(state)
	self._state = state;
end

function App:getRunGame()
	return self._runGame;
end

function App:downloadGame(key,callbacks)
	local gameConfig = self:getGameConfig(key);

	if not gameConfig then
		return manager.ui.Message():show("配置数据错误！");
	end

end

--获取通用的配置
--@reload 是否重新加载配置
function App:getCommonConfig(reload)
	reload = reload or false;
	if not self._commonConfig or reload then
	    self._commonConfig = getObjectFromFile("Config/Common");
	end
	return self._commonConfig;
end


--启动游戏
function App:startGame(key)
	local gameConfig = self:getGameConfig(key);
	self._runGame = key;

	local entryScript = self:getGameEntryScript(key);
	local gameClass = require(entryScript);
	if not gameClass or type(gameClass) ~= "table" then
		return self:onEnterGameFail();
	end

	--登录回调
	local callback = function(isSuccess,retObject)
		if isSuccess then
			--设置App状态为游戏中
			self:setState(config.AppState.Game);
			--修改屏幕方向
			manager.app:setOrientation(0);
			manager.sound:loadCurrentGameConfig();

			--清空路径缓存
			cc.FileUtils:getInstance():clearFullPathCache();

			--设置查找路径优先级
			local newSearchPaths = {};
			table.insert(newSearchPaths,WritePath .. "/games/".. key .."/src");
			table.insert(newSearchPaths,WritePath .. "/games/".. key .."/res");
			table.insert(newSearchPaths,WritePath .. "/games/".. key .."/res/Image");  --兼容北海
			table.insert(newSearchPaths,"games/".. key .."/src");
			table.insert(newSearchPaths,"games/".. key .."/res");
			table.insert(newSearchPaths,"games/".. key .."/res/Image");  --兼容北海
			local SearchPaths = self:getSearchPaths();
			for i,v in ipairs(SearchPaths) do
				table.insert(newSearchPaths,v);
			end
			cc.FileUtils:getInstance():setSearchPaths(newSearchPaths);

			--切换本地存储
			manager.localStore:resetStoreFile(self._runGame .. "_" .. config.StoreData);
			gameClass:create(retObject);
		end
    end

	require("app.ui.Loading.LoginGameLoading"):show(gameConfig,gameClass,callback);
	callback(true);
end



--进入游戏失败
function App:onEnterGameFail()
	manager.localStore:resetStoreFile(config.StoreData);
	self:setState(config.AppState.Main);
	manager.event:trigger(manager.event:define("EnterGameFail"));
end

function App:getCurrentGame()
	return self._runGame;
end

--获取当前运行的游戏的目录
function App:getCurrentGameDir()
	return "games/".. self._runGame;
end

--获取当前运行的游戏的本地配置
--path:game/游戏名字/config
function App:getCurrentGameLocalConfig()
	local configPath = self:getCurrentGameDir() .. "/config";
	return getObjectFromFile(configPath);
end

--获取指定的游戏的本地配置
function App:getGameLocalConfig(name)
	local configPath = "games/" .. name .. "/config";
	return getObjectFromFile(configPath);
end

--获取游戏入口脚本
function App:getGameEntryScript(name)
	return "games/".. name .. "/src/main.lua";
end

--获取已下载的游戏列表
function App:getDownloadGameList()
	--local gameConfigSource = cc.FileUtils:getInstance():getStringFromFile("Config/Game");
	local gameConfig = self._gamesConfig
	printf("run getDownloadGameList");

	local gameList = {};
	if gameConfig then
		for k,v in pairs(gameConfig) do
			if self:isGameExist(k) then
				gameList[k] = v;
			end
		end
	end
	return gameList;
end

--获取所有游戏列表
--路径:res/config/Game
function App:getAllGameList()
	--local gameConfigSource = cc.FileUtils:getInstance():getStringFromFile("Config/Game");
	local gameConfig = self._gamesConfig
	local gameList = {};
	for k,v in pairs(gameConfig) do
		if not self:isGameExist(k) then
			gameList[k] = v;
		end
	end
	return gameList;
end

--获取指定的游戏配置
--路径:res/config/Game
function App:getGameConfig( k )
	--local gameConfigSource = cc.FileUtils:getInstance():getStringFromFile("Config/Game");
	local gameConfig = self._gamesConfig
	return gameConfig[k];
end

--判断游戏是否存在 ,优先查找luac文件
function App:isGameExist(gameName)
	local luaScriptPath = "games/".. gameName .. "/src/main.luac";
	local isExist = cc.FileUtils:getInstance():isFileExist(luaScriptPath);
	if not isExist then
		local luaScriptPath = "games/".. gameName .. "/src/main.lua";
	    isExist = cc.FileUtils:getInstance():isFileExist(luaScriptPath);
	end
	print("isGameExist luaScriptPath:",luaScriptPath , " isExist:",isExist);
	return isExist;
end

--运行scene
function App:runScene(view,transition, time, more)
	self._currentView = view;
    local scene = display.newScene(view:getName())
    scene:addChild(view)
    display.runScene(scene, transition, time, more);
    cc.Director:getInstance():getTextureCache():removeUnusedTextures();
end

--添加view
function App:addView(view)
	self._currentView = view;
	local scene = cc.Director:getInstance():getRunningScene()
	scene:addChild(view);
end

function App:getTopView()
	local scene = cc.Director:getInstance():getRunningScene()
	local children = scene:getChildren();
	return children[#children];
end

return App;