
--设置按钮事件，并触发点击声音
--@callback 回调
--@playPath 播放声音的回调
function ccui.Widget:setClickEvent(callback,playPath)
	self:addClickEventListener(function(button) 
        
        local beginVec2 = self:getTouchBeganPosition();
        local endVec2 = self:getTouchEndPosition();

        if math.abs(beginVec2.x - endVec2.x) > 10 or  math.abs(beginVec2.y - endVec2.y) > 10 then
        	return;
        end

		local nowClickTime = os.clock();
		self._lastClickTime = self._lastClickTime or 0;
		print("self._lastClickTime:",self._lastClickTime," nowClickTime:",nowClickTime);
		if  math.abs(nowClickTime -  self._lastClickTime) < 0.3 then
			print("点击的时间!");
			return;
		end
		self._lastClickTime = nowClickTime;
		if callback then			
			callback(button);
		end
		playPath = playPath or config.ButtonPlayPath;
		--播放点击音效
		ccexp.AudioEngine:play2d(playPath);
		--SimpleAudioEngine:getInstance():playEffect(playPath);
	end);
end