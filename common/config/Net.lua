config = config or {};

config.Net = {
	Send = {},
	Ret = {}	
}

--发送
config.Net.Send = {
	PROTOCOL_SESS_LOGIN_CMD = 600002,  --发送登录消息
}

--接收
config.Net.Ret = {
	PROTOCOL_SESSRET_LOGIN_CMD = 900001, --接收登录消息
}