local Sound = class("Sound")

--声音目录
Sound.Dir = "Sound/";

function Sound:ctor( ... )
	self._configs = {};
end

--重置
function Sound:reset()
	self._playIDs = {};
	self:stopAll();
end

--加载当前游戏的音乐配置
function Sound:loadCurrentGameConfig()
	local status = manager.app:getState();

	

	self._effectVolume = manager.localStore:get("effectVolume") or 0.5;
	self._backgroundVolume = manager.localStore:get("backVolume") or 0.5;

	local configPath = manager.app:getCurrentGameDir() .. "/res/SoundConfig";
	print("configPath:",configPath);
	self._configs[manager.app:getCurrentGame()] = getObjectFromFile(configPath);
	return self._configs[manager.app:getCurrentGame()];
end

function Sound:stopAll()
	ccexp.AudioEngine:stopAll();
	cc.SimpleAudioEngine:getInstance():stopMusic();
end

--播放音效
--@object name:声音名字 sex:性别 volume:音量,默认配置的音量,loop:是否循环,callback:播放回调
--@return 播放的音效ID 
function Sound:playEffect( ... )
	local args = {...};
	
	if not args.name then
		return print("# playEffect args name is not exist");
	end

	local playName = self._configs[manager.app:getCurrentGame()][args.name];

	if not playName then
		return print("playName is not valid!");
	end

	--性别
	if not args.sex then
		args.sex = config.Sex.Common;
	end

	args.loop = args.loop or false;

	--播放路径
	local playPath = Sound.Dir .. args.sex .. "/" .. playName;
	self._playIDs[playPath] = ccexp.AudioEngine:play2d(playPath , args.loop , self:getEffectVolume());

	--回调
	if args.callback and self._playIDs[playPath] ~= cc.AUDIO_INVAILD_ID then
		ccexp.AudioEngine:setFinishCallback(self._playIDs[playPath],args.callback);
	end

	return self._playIDs[playPath];
end

--播放背景音乐
function Sound:playBack( ... )
	local args = {...};

	if not args.name then
		return print("# playEffect args name is not exist");
	end

	local playName = self._configs[manager.app:getCurrentGame()][args.name];

	if not playName then
		return print("playName is not valid!");
	end

	--播放路径
	local playPath = Sound.Dir .. "Back/" .. playName;
	args.loop = args.loop or false;

	cc.SimpleAudioEngine:getInstance():playBackgroundMusic(playPath,args.loop);
end

--停止播放背景音乐
function Sound:stopBack()
	cc.SimpleAudioEngine:getInstance():stopMusic();
end

--设置背景音乐的音量
function Sound:setBackgroundVolume(volume)
	self._backgroundVolume = volume;
end

--设置音效音量
function Sound:setEffectVolume(volume)
	self._effectVolume = volume;
end

function Sound:getBackgroundVolume()
	return self._backgroundVolume;
end

function Sound:getEffectVolume()
	return self._effectVolume;
end

--保存声音配置
function Sound:save()
	manager.localStore:set("effectVolume",self:getEffectVolume());
	manager.localStore:set("backVolume",self:getBackgroundVolume());
end

return Sound;