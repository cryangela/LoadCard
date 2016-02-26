
local Command = class("Command",game.net.Socket);

function Command:ctor()
	print("Command:ctor");

	--self:connect(3456,"192.168.1.7");

	--回调函数
	self._callbacks = {};

	--消息事件,消息回调
	self:setEvent(config.SocketEventType.OnMessage,function(data,code)
		if self._callbacks[code] then
			self._callbacks[code](data);
	    end
	end);

	--网络断开
	self:setEvent(config.SocketEventType.OnClose,function(code)
		manager.event:trigger(manager.event:define("NetWorkDisconnect"),self);
	end);
end

--发送数据
-- @data table,string json格式数据
function Command:sendData(charid,data,code)
	local typeString = type(data);
	if typeString == "table" then
		data = json.encode(data)  --- json ---
	end
	charid = charid or manager.user.charid;
	print(" sendData " .. charid .. "," .. data)
	self:_send(charid,code,data);
end


--发送数据
-- @data table,string json格式数据
function Command:send(...)
	local args = {...};
	local argc = #args;

	local data = nil;
	local code = 0;
	if argc == 2 then
		data = args[1];
		code = args[2];
	elseif argc == 1 and type(args[1]) == "number" then
		code = args[1];
	end

	if not code then
		print("error argument : code is 0");
	end

	if data then
		local typeString = type(data);
		if typeString == "table" then
			data = json.encode(data)
		end
	else
		data = "";
	end

	local charid = manager.user.charid or 0
	print(" sendData " .. charid .. "," .. data , " code:",code);
	self:_send(charid,code,data);
end


-- 添加回调
-- @code     命令
-- @callback 回调函数
function Command:addCallback(code,callback)
	self._callbacks[code] = callback;
end

--删除回调
function Command:removeCallback(code)
	self._callbacks[code] = nil;
end

--清空回调
function Command:clearCallbacks()
	self._callbacks = {};
end

return Command;