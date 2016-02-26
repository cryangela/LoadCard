local ShopLayer=class("ShopLayer", cc.load("mvc").ViewBase);
Ybin={
{price="icon/youxibisc_0002_6yuan.png",pic="icon/youxibisc_0004_6wan.png",pic1="icon/youxibisc_0001_item.png"},

{price="icon/youxibisc_0006_10yuan.png",pic="icon/youxibisc_0007_10wan.png",pic1="icon/youxibisc_0008_item2.png"},
{price="icon/youxibisc_0009_20yuan.png",pic="icon/youxibisc_0010_20wan.png",pic1="icon/youxibisc_0011_item3.png"},
{price="icon/youxibisc_0012_50yuan.png",pic="icon/youxibisc_0013_50wan.png",pic1="icon/youxibisc_0014_item4.png"},
{price="icon/youxibisc_0015_100yuan.png",pic="icon/youxibisc_0016_100wan.png",pic1="icon/youxibisc_0017_item5.png"},
{price="icon/youxibisc_0018_200yuan.png",pic="icon/youxibisc_0019_200wan.png",pic1="icon/youxibisc_0020_item6.png"}
}


function ShopLayer:onCreate()
    self:loadCsb("shangcheng");
    --取消  
    local cancel = self:getWidget("btn_cancel");
    cancel:addClickEventListener(function()
        self:removeFromParent();
    end)
    local garidLayout = game.extend.Grid:create();
    garidLayout:setMargin(50);
    local ScrollView = self:getWidget("ScrollView_1");
    ScrollView:setPositionX(120);
    ScrollView:setDirection(2);
    ScrollView:setContentSize(1050,500);
    ScrollView:addChild(garidLayout);
    --游戏币商城
    for i=1,6 do
        garidLayout:setMaxVec(3);
        local  sp1 = cc.Sprite:create("icon/youxibisc_0001_itemframe.png");
        garidLayout:addChild(sp1);
        local sp2 = cc.Sprite:create("icon/youxibisc_0000_hongduandai.png");
        sp2:setPosition(220,110);
        sp1:addChild(sp2,3);
        local sp5 = cc.Sprite:create(Ybin[i].pic);
        sp5:setPosition(60,30);
        sp2:addChild(sp5);
        local sp6 = cc.Sprite:create(Ybin[i].pic1);
        sp6:setPosition(140,140);
        sp1:addChild(sp6);  
        sp3 = ccui.Button:create("icon/youxibisc_0003_greenbuttom.png");
        sp3:setSwallowTouches(false)
        sp3:setScaleX(0.6)
        sp3:setScaleY(0.8)
        sp3:setPosition(155, 40);
        sp3:addClickEventListener(function()
        print("icon/youxibisc_0003_greenbuttom.png")
        end);
        sp1:addChild(sp3);
        local sp4 = cc.Sprite:create(Ybin[i].price);
        sp4:setPosition(120,25);
        sp3:addChild(sp4);
        end
        garidLayout:updateContent();
        ScrollView:setInnerContainerSize(garidLayout:getContentSize());
        Table_img = {self:getWidget("img_youxibin"),self:getWidget("img_daoju"),self:getWidget("img_duihuan")};
        Table_btn = {self:getWidget("btn_youxibin"),self:getWidget("btn_daoju"),self:getWidget("btn_duihuan")};
        --游戏币，道具，兑换卷的切换 	 
        Table_btn[1]:addClickEventListener(function()
        Table_img[1]:setVisible(true);
        Table_img[2]:setVisible(false);
        Table_img[3]:setVisible(false);
        garidLayout:removeAllChildren()
        -- ScrollView:GetComponent():ResetPosition();
        --游戏币商城
        for i=1,6 do
        garidLayout:setMaxVec(3);
        local  sp1 = cc.Sprite:create("icon/youxibisc_0001_itemframe.png");
        garidLayout:addChild(sp1);
        local sp2 = cc.Sprite:create("icon/youxibisc_0000_hongduandai.png");
        sp2:setPosition(220,110);
        sp1:addChild(sp2,3);
        local sp5 = cc.Sprite:create(Ybin[i].pic);
        sp5:setPosition(60,30);
        sp2:addChild(sp5);
        local sp6 = cc.Sprite:create(Ybin[i].pic1);
        sp6:setPosition(140,140);
        sp1:addChild(sp6);
        local sp3 = ccui.Button:create("icon/youxibisc_0003_greenbuttom.png");
        sp3:setScaleX(0.6)
        sp3:setSwallowTouches(false)
        sp3:setScaleY(0.8)
        sp3:setPosition(155, 40);
        sp3:addClickEventListener(function()
        print("icon/youxibisc_0003_greenbuttom.png")
        end);
        sp1:addChild(sp3);
        local sp4=cc.Sprite:create(Ybin[i].price);
        sp4:setPosition(120,25);
        sp3:addChild(sp4);
        print("游戏币商城",i)
    end
    garidLayout:updateContent();
    ScrollView:setInnerContainerSize(garidLayout:getContentSize());
    end)
    Table_btn[2]:addClickEventListener(function()
    Table_img[1]:setVisible(false);
    Table_img[2]:setVisible(true);
    Table_img[3]:setVisible(false);
    garidLayout:removeAllChildren()
    --道具商城
    for i=1,10 do
        garidLayout:setMaxVec(5);
        local sp1 = cc.Sprite:create("icon/daojusc_0008_brownframe.png");
        garidLayout:addChild(sp1);
        local sp2 = cc.Sprite:create("icon/daojusc_0005_blueframe.png");
        sp2:setPosition(100,140);
        sp1:addChild(sp2);
        local sp3 = ccui.Button:create("icon/daojusc_0001_greenbuttom.png");
        sp3:setPosition(100, 40);
        sp3:setSwallowTouches(false)
        sp3:addClickEventListener(function()
        print("icon/daojusc_0001_greenbuttom.png")
        end);
        sp1:addChild(sp3);
        local sp5 = cc.Sprite:create("icon/daojusc_00001.png");
        sp5:setPosition(65,21);
        sp3:addChild(sp5);
        local sp6 = cc.Sprite:create("icon/daojusc_0007_jipaiqi.png");
        sp6:setPosition(230,180);
        sp1:addChild(sp6);    
        local sp4 = cc.Sprite:create("icon/daojusc_0006_message.png");
        sp4:setPosition(235,120);
        sp1:addChild(sp4);
        local label = cc.Label:createWithSystemFont("x999","",25);
        label:setPosition(235, 50);
        label:setColor(cc.c3b(255, 216, 0));
        sp1:addChild(label);
        local sp7 = cc.Sprite:create("icon/wodewupin_0001_jipaiqi.png");
        sp7:setPosition(80,70);
        sp2:addChild(sp7);
        local sp8 = cc.Sprite:create("icon/daojusc_0003_redcloth.png");
        sp8:setPosition(37,100);
        sp2:addChild(sp8);
        local sp9 = cc.Sprite:create("icon/daojusc_0002_yongjiu.png");
        sp9:setPosition(30,50);
        sp8:addChild(sp9);
        print("道具商城",i)
        end
        garidLayout:updateContent();
        ScrollView:setInnerContainerSize(garidLayout:getContentSize());
        end)
        Table_btn[3]:addClickEventListener(function()
        Table_img[1]:setVisible(false);
        Table_img[2]:setVisible(false);
        Table_img[3]:setVisible(true);
        garidLayout:removeAllChildren()
        --兑换商城
        for i=1,10 do
        garidLayout:setMaxVec(5);
        local sp1 = cc.Sprite:create("icon/daojusc_0008_brownframe.png");
        garidLayout:addChild(sp1);
        local sp2 = cc.Sprite:create("icon/duihuansc_0006_blueframe.png");
        sp2:setPosition(95,110);
        sp1:addChild(sp2);  
        local sp3 = cc.Sprite:create("icon/duihuansc_0007_iphone6s.png"); 
        sp3:setScaleX(0.9);
        sp3:setPosition(240,180);
        sp1:addChild(sp3);
        local sp4 = cc.Sprite:create("icon/duihuansc_0005_xiaolvchao.png");
        sp4:setPosition(200,100);
        sp1:addChild(sp4);
        local sp5 = cc.Label:createWithSystemFont("68000","",25);
        sp5:setColor(cc.c3b(247, 219, 146))
        sp5:setPosition(260,100);
        sp1:addChild(sp5);
        local sp6 = ccui.Button:create("icon/duihuansc_0002_greenbuttom.png");
        sp6:setScaleX(0.9);
        sp6:setSwallowTouches(false)
        sp6:setPosition(240, 50);
        sp6:addClickEventListener(function()
        local success = include("app.Class.Success"):create()
        manager.app:addView(success)
        print("icon/daojusc_0001_greenbuttom.png")
        end);
        sp1:addChild(sp6);
        local sp7 = cc.Sprite:create("icon/duihuansc_0001_duihuan.png");
        sp7:setPosition(70,20);
        sp6:addChild(sp7);
        local sp8 = cc.Sprite:create("icon/duihuansc_0003_iphoneicon.png");
        sp8:setPosition(80,90);
        sp2:addChild(sp8);
        local sp9 = cc.Sprite:create("icon/duihuansc_0004_redcloth.png");
        sp9:setPosition(100,45);
        sp2:addChild(sp9);
        local label = cc.Label:createWithSystemFont("剩余"..(i+10),"",25);
        label:setPosition(79, 35);
        label:setRotation(-35);
        sp9:addChild(label);
        print("兑换商城",i)
    end
    garidLayout:updateContent();
    ScrollView:setInnerContainerSize(garidLayout:getContentSize());
    end)
    
end
return ShopLayer;