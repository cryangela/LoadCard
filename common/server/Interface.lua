--服务器接口
local Interface = class("Interface");

function Interface:getSvrRequestUrl( ... )
	local commonConfig = manager.app:getCommonConfig();
	local requestUrl = "http://" .. commonConfig.svrHost .. ":89/index.php";
	return requestUrl;
end

function Interface:request(url,action,args,callback)
	args.charid = manager.user.charid;
	local requestData = {
		action = action,
		args = args
	};
	print("发送 " , url, json.encode(requestData));
	manager.http:request(url,"arg=" .. json.encode(requestData),function(ret) 
		print("ret:",ret);
		ret = json.decode(ret);
		if  ret.code ~= config.Interface.Code.OK then
			print("request " , url , " error " , json.encode(requestData));
		end
		callback(ret);
	end,function( ret )
		print("http请求错误！");
	end);
end


--检测用户设备
function Interface:checkDevice(device,callback)
	local requestData = {
		device = device
	};
	return self:request(self:getSvrRequestUrl(),"login.checkDevice",requestData,function(ret) 
		if ret.code == config.Interface.Code.OK then
			manager.user.verify = ret.data;
		end
		callback(ret);
	end);
end

--注册设备
function Interface:regRole(device,callback)
	local requestData = {
		device = device
	};
	return self:request(self:getSvrRequestUrl(),"login.regRole",requestData,callback);
end

--登录
function Interface:login(account,pswd,callback)
	local requestData = {
		account = account,
		pswd = pswd
	};
	return self:request(self:getSvrRequestUrl(),"login.platform",requestData,function(ret) 
		--存储用户信息
		if ret.code == config.Interface.Code.OK then
			manager.utils:extendObject(manager.user,ret.data);
		end
		callback(ret);
	end);
end

--获取角色信息
--@charid 用户ID
function Interface:getInfo(charid,callback)
	local requestData = {
		charid = charid
	};
	return self:request(self:getSvrRequestUrl(),"Role.getInfo",requestData,function(ret)
		manager.user.charid = ret.data.charid	
		if callback then
			callback(ret)
		end
	end);
end

--修改昵称
--@charid 用户ID
function Interface:resetName(account_, nick_ ,sex_,callback)
	local requestData = {
		account = account_,
		nick = nick_,
		sex = sex_
	};	
	self:request(self:getSvrRequestUrl(),"Change.name",requestData,function(ret)
		if  ret.code == 1 then
			return print(ret.str);
		end
		callback(ret);
	end);
end

--获取短信验证码
--@phone 手机号码
function Interface:SmsCode(phone,callback)
	local requestData = {
		phone = phone
	};
	print("requestData:",json.encode(requestData) , " phone:",phone);
	return self:request(self:getSvrRequestUrl(),"Sms.reg_code",requestData,function(ret)
		if callback then
			callback(ret);
		end
	end);
end

--短信注册
function Interface:SmsReg(phone,code,pswd,callback)
	local requestData = {
		phone = phone,
		code = code,
		pswd = pswd
	};
	return self:request(self:getSvrRequestUrl(),"Sms.reg",requestData,callback);
end

--绑定手机
function Interface:Bindphone(phone,code,account,callback)
	local requestData = {
		phone = phone,
		code = code,
		account = account
	};
	return self:request(self:getSvrRequestUrl(),"Bind.phone",requestData,function(ret)
		if ret.code == 0 or ret.code == 1024 then
			if callback then
				callback(ret);
			end
		else
			manager.ui:Message():show(ret.msg == "" and "未知错误，请稍后再试" or ret.msg);		
		end	
	end);
end

--修改头像
function Interface:Changeicon(icon,charid,callback)
	local requestData = {
		icon = icon,
		charid = charid
	};
	return self:request(self:getSvrRequestUrl(),"Change.icon",requestData,function(ret)
		if ret.code == 0 then
			if callback then
				callback(ret);
			end
		end	
	end);
end
--修改密码
function Interface:ChangePswd(oldpswd,newpswd,charid,callback)
	local requestData = {
		oldpswd = oldpswd,
		newpswd = newpswd,
		charid = charid
	};
	return self:request(self:getSvrRequestUrl(),"Change.pswd",requestData,function(ret)
		if ret.code == 0 then
			if callback then
				callback(ret);
			end	
		else
			manager.ui:Message():show(ret.msg);					
		end	
	end);
end

return Interface;
