local UI = class("UI");

function UI:Loading()
	local Loading = require("common.ui.Loading");
	return Loading;
end
function UI:FrameBox()
	local FrameBox = require("common.ui.FrameBox");
	return FrameBox;
end
function UI:Message()
	local Message = require("common.ui.Message");
	return Message;
end

return UI;