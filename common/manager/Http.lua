local Http = class("Http",game.manager.Http);

--http请求
function Http:request(...)
	local args = {...};
	if #args >= 2 and type(args[1]) == "string" and type(args[2]) == "function" then
		self:get(args[1],"",args[2],args[3]);
	elseif #args >= 3 and type(args[2]) == "table" and type(args[1]) == "string" then
		local tableObj = args[2];
		local requestString = "";
		for k,v in pairs(tableObj) do
			requestString = requestString .. k .. "=" .. v .. "&"
		end
		self:get(args[1],requestString,args[3],args[4]);
	elseif #args >= 3 and type(args[2]) == "string" and type(args[1]) == "string" then
		self:get(args[1],args[2],args[3],args[4]);
	else
			print("error args");
	end
end

return Http;