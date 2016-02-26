local Utils = class("Utils",game.extend.Utils)

function Utils:getFileSizeString(fileSize)
	 fileSize = fileSize or 0;
	 local kbfs = fileSize / 1024;
	 if fileSize < 1024 then
	 	return string.format("%.2fKB", kbfs) 
	 end
	 return string.format("%.2fMB", kbfs / 1024) 
end

--合并对象
function Utils:extendObject(obj1,obj2)
	print("type(obj1):",type(obj1),"type(obj2):",type(obj2));
	if type(obj1) == 'table' and type(obj2) == 'table' then
		for k,v in pairs(obj2) do
			obj1[k] = v;
		end
	end
	return obj1;
end

function Utils:isValidPhoneNum( str )
	if string.len(str) ~= 11 then
		return false;
	end
	return string.match(str,"%d+") == str;
end

--获取手机号码
function Utils:getPhoneNum( ... )
	--android
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_ANDROID then
		local args = {}
		local sigs = "()Ljava/lang/String;"
		local luaj = require "cocos.cocos2d.luaj"
		local className = "game/manager/Utils"
		local ok,ret  = luaj.callStaticMethod(className,"getPhoneNum",args,sigs)
		if not ok then
		    print("luaj error:", ret)
		else
		    print("The ret is:", ret)
		end
		return ret;
	end

	--windows
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
		return "";
	end
end

return Utils;