local SetLayer=class("SetLayer", cc.load("mvc").ViewBase);

function SetLayer:onCreate()
    self:loadCsb("shezhi");
    --取消
    local cancel = self:getWidget("btn_cancel")
    cancel:addClickEventListener(function()
        self:removeFromParent()
    end)
    --音乐 
    local slider = ccui.Slider:create()
    -- slider:setTouchEnabled(true)
    slider:loadBarTexture("icon/shezhi_0001_bigbar.png")
    slider:loadSlidBallTextures("icon/shezhi_0007_tuodonganniu.png", "icon/shezhi_0007_tuodonganniu.png", "")
    slider:loadProgressBarTexture("icon/shezhi_0000_bigblue.png")
    slider:setPosition(710,360)
    slider:setPercent(100)
    self:addChild(slider)
    --音效   
    local slider = ccui.Slider:create()
    -- slider:setTouchEnabled(true)
    slider:loadBarTexture("icon/shezhi_0001_bigbar.png")
    slider:loadSlidBallTextures("icon/shezhi_0007_tuodonganniu.png", "icon/shezhi_0007_tuodonganniu.png", "")
    slider:loadProgressBarTexture("icon/shezhi_0000_bigblue.png")
    slider:setPosition(710,440)
    slider:setPercent(100)
    self:addChild(slider)
    --震动
    local checkBox = ccui.CheckBox:create()
    -- checkBox:setTouchEnabled(true)
    checkBox:loadTextures("shezhi_0000_on.png","","shezhi_0001_off.png","","")
    checkBox:setPosition(cc.p(570, 280))   --坐标
    checkBox:addEventListener(function(sender,eventType)
        if eventType == ccui.CheckBoxEventType.selected then
            print("on")
        elseif eventType == ccui.CheckBoxEventType.unselected then
            print("off")
        end
    end)  --注册事件 
    self:addChild(checkBox)   -- 添加到图层 
 
end
return SetLayer;