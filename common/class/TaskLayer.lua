local TaskLayer=class("TaskLayer", cc.load("mvc").ViewBase)
require("common.class.GameData")

function TaskLayer:onCreate()
    self:loadCsb("TaskLayer")
    --取消
    local cancel=self:getWidget("btn_cancel")
    cancel:addClickEventListener(function()
        self:removeFromParent()
    end)    
    local garidLayout = game.extend.Grid:create();
    garidLayout:setMargin(30);
    garidLayout:setMaxVec(1);
    local ScrollView = self:getWidget("ScrollView_2");
    ScrollView:setPositionX(150);
    -- ScrollView:setDirection(2);
    ScrollView:setContentSize(1180,750);
    ScrollView:addChild(garidLayout);
    for i=1,38 do
        print("正在创建第".. i .. "个任务")
        local sp1 = ccui.Scale9Sprite:create("icon/paihangbang_0019_bigframe.png")
        sp1:setContentSize(1150, 120);
        garidLayout:addChild(sp1)
        local sp2 = cc.Sprite:create("icon/daojusc_0011_coin.png")
        sp2:setPosition(600,30)
        sp1:addChild(sp2)
        local sp3 = cc.Sprite:create("icon/renwu_0018_jiangli.png")
        sp3:setPosition(550,30)
        sp1:addChild(sp3)
        local lbl_name = cc.Label:createWithSystemFont(GameData.Table_T1[i].name,"",35);
        lbl_name:setPosition(310,90)
        sp1:addChild(lbl_name)
        local lbl_gold = cc.Label:createWithSystemFont(GameData.Table_T1[i].price,"",30);
        lbl_gold:setPosition(650,30)
        sp1:addChild(lbl_gold)
        local lbl_jindu = cc.Sprite:create("icon/renwu_0019_jindu.png");
        lbl_jindu:setPosition(250,30)
        sp1:addChild(lbl_jindu)
        local lbl_jindu = cc.Sprite:create(GameData.Table_T1[i].pic);
        lbl_jindu:setPosition(60,60)
        sp1:addChild(lbl_jindu)
        local ss = cc.Sprite:create("icon/renwu_0016_aocao.png")
        ss:setPosition(400,30)
        sp1:addChild(ss)
        local s = cc.Sprite:create("icon/renwu_0015_lvtiao.png")
        local timer = cc.ProgressTimer:create(s)
        timer:setPosition(400, 30)
        timer:setBarChangeRate(cc.p(1,0))  --只对方形有用，0是显示所有，1是根据进度显示
        timer:setType(1)  --方形
        timer:setMidpoint(cc.p(0,0.5))  --从某个地方开始显示
        sp1:addChild(timer)
        local pro = cc.ProgressTo:create(2.0,100)  --所有进
        timer:runAction(pro)
        local label = nil;
        if i==1 then
        label = cc.Label:createWithSystemFont("5/5","",25);
        elseif i==2 then
        label = cc.Label:createWithSystemFont("10/10","",25);
        else
        label = cc.Label:createWithSystemFont("1/1","",25);
        end
        label:setPosition(400,30)
        sp1:addChild(label)
        local btn = nil;
        if i==1 then
        btn1=ccui.Button:create("icon/renwu_0022_redbuttom.png")
        btn1:addTouchEventListener(function()
        print("111111111111111111111111")
        end)
        local ssp = cc.Sprite:create("icon/renwu_0005_lingqujiangli.png")
        ssp:setPosition(110,50)
        btn1:addChild(ssp)
        else
        btn1 = ccui.Button:create("icon/renwu_0014_bluebuttom.png")
        btn1:addTouchEventListener(function()
        print("222222222222222222")
        end)
        local ssp1 = cc.Sprite:create("icon/renwu_0013_quzuorenwu.png")
        ssp1:setPosition(110,50)
        btn1:addChild(ssp1)
        end
        btn1:setPosition(1000,60)
        sp1:addChild(btn1)
    end
    garidLayout:updateContent();
    ScrollView:setInnerContainerSize(garidLayout:getContentSize());
    --每日任务与系统任务的切换
    local btn_m = self:getWidget("btn_m");
    btn_m:addClickEventListener(function()
    local img_m = self:getWidget("img_m");
    local img_x = self:getWidget("img_x");
    img_x:setVisible(false)
    img_m:setVisible(true)
    garidLayout:removeAllChildren()
    for i=1,38 do
        local sp1 = ccui.Scale9Sprite:create("icon/paihangbang_0019_bigframe.png")
        sp1:setContentSize(1150, 120);
        garidLayout:addChild(sp1)
        local sp2 = cc.Sprite:create("icon/daojusc_0011_coin.png")
        sp2:setPosition(600,30)
        sp1:addChild(sp2)
        local sp3 = cc.Sprite:create("icon/renwu_0018_jiangli.png")
        sp3:setPosition(550,30)
        sp1:addChild(sp3)
        local lbl_name = cc.Label:createWithSystemFont(GameData.Table_T1[i].name,"",35);
        lbl_name:setPosition(310,90)
        sp1:addChild(lbl_name)
        local lbl_gold = cc.Label:createWithSystemFont(GameData.Table_T1[i].price,"",30);
        lbl_gold:setPosition(650,30)
        sp1:addChild(lbl_gold)
        local lbl_jindu = cc.Sprite:create("icon/renwu_0019_jindu.png");
        lbl_jindu:setPosition(250,30)
        sp1:addChild(lbl_jindu)
        local lbl_jindu = cc.Sprite:create(GameData.Table_T1[i].pic);
        lbl_jindu:setPosition(60,60)
        sp1:addChild(lbl_jindu)
        local ss = cc.Sprite:create("icon/renwu_0016_aocao.png")
        ss:setPosition(400,30)
        sp1:addChild(ss)
        local s = cc.Sprite:create("icon/renwu_0015_lvtiao.png")
        local timer = cc.ProgressTimer:create(s)
        timer:setPosition(400, 30)
        timer:setBarChangeRate(cc.p(1,0))  --只对方形有用，0是显示所有，1是根据进度显示
        timer:setType(1)  --方形
        timer:setMidpoint(cc.p(0,0.5))  --从某个地方开始显示
        sp1:addChild(timer)
        local pro = cc.ProgressTo:create(2.0,100)  --所有进
        timer:runAction(pro)
        local label=nil;
        if i==1 then
        label = cc.Label:createWithSystemFont("5/5","",25);
        elseif i==2 then
        label = cc.Label:createWithSystemFont("10/10","",25);
        else
        label = cc.Label:createWithSystemFont("1/1","",25);
        end
        label:setPosition(400,30)
        sp1:addChild(label)
        local btn=nil;
        if i==1 then
        btn1 = ccui.Button:create("icon/renwu_0022_redbuttom.png")
        btn1:addTouchEventListener(function()
        print("111111111111111111111111")
        end)
        local ssp = cc.Sprite:create("icon/renwu_0005_lingqujiangli.png")
        ssp:setPosition(110,50)
        btn1:addChild(ssp)
        else
        btn1 = ccui.Button:create("icon/renwu_0014_bluebuttom.png")
        btn1:addTouchEventListener(function()
        print("222222222222222222")
        end)
        local ssp1 = cc.Sprite:create("icon/renwu_0013_quzuorenwu.png")
        ssp1:setPosition(110,50)
        btn1:addChild(ssp1)
        end
        btn1:setPosition(1000,60)
        sp1:addChild(btn1)
    end
    garidLayout:updateContent();
    ScrollView:setInnerContainerSize(garidLayout:getContentSize());
    end)
    local btn_x = self:getWidget("btn_x");
    btn_x:addClickEventListener(function()
    local img_m = self:getWidget("img_m");
    local img_x = self:getWidget("img_x");
    img_x:setVisible(true)
    img_m:setVisible(false)
    garidLayout:removeAllChildren()
    for i=1,20 do
        local sp1 = ccui.Scale9Sprite:create("icon/paihangbang_0019_bigframe.png")
        sp1:setContentSize(1150, 120);
        garidLayout:addChild(sp1)
        local sp2 = cc.Sprite:create("icon/daojusc_0011_coin.png")
        sp2:setPosition(600,30)
        sp1:addChild(sp2)
        local sp3 = cc.Sprite:create("icon/renwu_0018_jiangli.png")
        sp3:setPosition(550,30)
        sp1:addChild(sp3)
        local lbl_name = cc.Label:createWithSystemFont(GameData.Table_T2[i].name,"",35);
        lbl_name:setPosition(310,90)
        sp1:addChild(lbl_name)
        local lbl_gold = cc.Label:createWithSystemFont(GameData.Table_T2[i].price,"",30);
        lbl_gold:setPosition(700,30)
        sp1:addChild(lbl_gold)
        local lbl_jindu = cc.Sprite:create("icon/renwu_0019_jindu.png");
        lbl_jindu:setPosition(250,30)
        sp1:addChild(lbl_jindu)
        local lbl_jindu = cc.Sprite:create(GameData.Table_T2[i].pic);
        lbl_jindu:setPosition(60,60)
        sp1:addChild(lbl_jindu)
        local ss = cc.Sprite:create("icon/renwu_0016_aocao.png")
        ss:setPosition(400,30)
        sp1:addChild(ss)
        local s = cc.Sprite:create("icon/renwu_0015_lvtiao.png")
        local timer = cc.ProgressTimer:create(s)
        timer:setPosition(400, 30)
        timer:setBarChangeRate(cc.p(1,0))  --只对方形有用，0是显示所有，1是根据进度显示
        timer:setType(1)  --方形
        timer:setMidpoint(cc.p(0,0.5))  --从某个地方开始显示
        sp1:addChild(timer)
        local pro = cc.ProgressTo:create(2.0,100)  --所有进
        timer:runAction(pro)
        local label = nil;
        if i==1 or i==8 or i==9 or i==10 or i==11  or i==12 or i==17 or i==18 or i==19 or i==20 then
        label = cc.Label:createWithSystemFont("1/1","",25);
        elseif i==2 or i==5 or i==6  then
        label = cc.Label:createWithSystemFont("30/30","",25);
        elseif i==3 or i==7 then
        label = cc.Label:createWithSystemFont("100/100","",25);
        elseif i==4 or i==15 then
        label = cc.Label:createWithSystemFont("10/10","",25);
        elseif i==13 then
        label = cc.Label:createWithSystemFont("5/5","",25);
        elseif i==14 then
        label = cc.Label:createWithSystemFont("0/10","",25);
        elseif i==16 then
        label = cc.Label:createWithSystemFont("50/50","",25);
        end
        label:setPosition(400,30)
        sp1:addChild(label)
        local btn = nil;
        if i==1 then
        btn1 = ccui.Button:create("icon/renwu_0022_redbuttom.png")
        btn1:addTouchEventListener(function()
        print("111111111111111111111111")
        end)
        local ssp = cc.Sprite:create("icon/renwu_0005_lingqujiangli.png")
        ssp:setPosition(110,50)
        btn1:addChild(ssp)
        else
        btn1 = ccui.Button:create("icon/renwu_0014_bluebuttom.png")
        btn1:addTouchEventListener(function()
        print("222222222222222222")
        end)
        local ssp1 = cc.Sprite:create("icon/renwu_0013_quzuorenwu.png")
        ssp1:setPosition(110,50)
        btn1:addChild(ssp1)
        end
        btn1:setPosition(1000,60)
        sp1:addChild(btn1)
    end
    garidLayout:updateContent();
    ScrollView:setInnerContainerSize(garidLayout:getContentSize());
    end)

end
return TaskLayer
