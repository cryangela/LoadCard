local UINode = game.extend.UINode;

function UINode:setKeyCallBack(callback)
	self:registerKeyEvent(function(keyCode)
		callback(keyCode);
	end);
end


function UINode:isTopNode()
	
end

--注册服务器的数据回调
function UINode:registerMessageEvent(code,callback)
	self:_registerMessageEvent(code,function(data,code)
		 if callback then
		  	--todo
		  	data = json.decode(data);
		  	callback(data,code);
		  end 
	end);
end

