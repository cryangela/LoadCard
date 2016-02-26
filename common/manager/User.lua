-- 数据格式:{"bind":"0","nick":"游客96060","charid":"240001746","chip":"0"}

--chip           金币
--verify         帐号
local User = class("User");
--判断是否登录
function User:isLogin()
	return self.charid and self.charid ~= 0;
end

--获取验证的信息
--@account 帐号
--@pswd    密码
function User:getVerify()
	return self.verify;
end

--重置数据
function User:reset()
	self.charid = 0;
end

--登出
function User:loginOut( ... )
	self:reset();
end

--获取用户信息
function User:requestInfo(charid,callback)

end

return User;