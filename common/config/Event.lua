config.Event = {};

--事件定义

--游戏下载成功
manager.event:define("DownLoadGameSuccess");
--游戏下载失败
manager.event:define("DownLoadGameFail");
--网络断开
manager.event:define("NetWorkDisconnect");
--进入游戏失败
manager.event:define("EnterGameFail");
--获取用户信息成功
manager.event:define("RequestUserInfoSuccess");
--刷新主界面
manager.event:define("RefreshUserInfo");
--刷新个人信息
manager.event:define("GetUserInfo");