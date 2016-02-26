local Ranking=class("Ranking", cc.load("mvc").ViewBase)
TableX={"icon/paihangbang_0003_jin.png","icon/paihangbang_0002_yin.png","icon/paihangbang_0001_tong.png"}
function Ranking:onCreate()
    self:loadCsb("Ranking")
  
    --取消
    local cancel = self:getWidget("Button_2")
    cancel:addClickEventListener(function()
      self:removeFromParent()
    end)
    --未入榜名字
    local name = self:getWidget("Text_2")
    name:setString("死鬼,真穷！")
    --未入榜金币
    local gold = self:getWidget("Text_3")
    gold:setString("1000000")
    local garidLayout = game.extend.Grid:create();
    garidLayout:setMargin(30);
    garidLayout:setMaxVec(1);
    local ScrollView = self:getWidget("ScrollView_1");
    ScrollView:setPositionX(130);
    ScrollView:setContentSize(1050,620);
    ScrollView:addChild(garidLayout);
    for i=1,20 do
      local sp1 = ccui.Scale9Sprite:create("icon/paihangbang_0019_bigframe.png")
      sp1:setContentSize(1050, 120);
      garidLayout:addChild(sp1)
      local sp2 = cc.Sprite:create("icon/paihangbang_0009_playerframe.png")
      sp2:setPosition(70,60)
      sp1:addChild(sp2)
      local sp3 = cc.Sprite:create("icon/paihangbang_0006_bigtouxiang.png")
      sp3:setPosition(50,55)
      sp2:addChild(sp3)
      local sp4 = cc.Sprite:create("icon/paihangbang_0005_nv.png")
      sp4:setPosition(600,90)
      sp1:addChild(sp4)
      local sp5 = cc.Sprite:create("icon/daojusc_0011_coin.png")
      sp5:setPosition(600,30)
      sp1:addChild(sp5)
      local sp6 = cc.Sprite:create("icon/paihangbang_0012_nicheng.png")
      sp6:setPosition(716, 90);
      sp1:addChild(sp6);
      local sp7 = cc.Sprite:create("icon/paihangbang_0011_jinriyingli.png")
      sp7:setPosition(690, 30);
      sp1:addChild(sp7);
      local sp8 = nil
      if i<4 then
        sp8 = cc.Sprite:create(TableX[i]);
      else
        sp8 = cc.Label:createWithSystemFont(tostring(i),"",60);
        sp8:setColor(cc.c3b(255, 255, 0))
      end
        sp8:setPosition(300,60)
        sp1:addChild(sp8)
        local lbl_name = cc.Label:createWithSystemFont("有钱,任性!","",30);
        lbl_name:setPosition(850,90)
        sp1:addChild(lbl_name)
        local lbl_gold = cc.Label:createWithSystemFont("1800000000","",30);
        lbl_gold:setPosition(850,30)
        sp1:addChild(lbl_gold)
    end
    garidLayout:updateContent();
    ScrollView:setInnerContainerSize(garidLayout:getContentSize());
    -- 每日赚金榜与财富榜的切换
    local btn_m = self:getWidget("Button_3")
    btn_m:addClickEventListener(function()
    local img_m = self:getWidget("Image_11")
    img_m:setVisible(true)
    local img_c = self:getWidget("Image_12")
    img_c:setVisible(false)
    garidLayout:removeAllChildren()
    for i=1,20 do
      local sp1 = ccui.Scale9Sprite:create("icon/paihangbang_0019_bigframe.png")
      sp1:setContentSize(1050, 120);
      garidLayout:addChild(sp1)
      local sp2 = cc.Sprite:create("icon/paihangbang_0009_playerframe.png")
      sp2:setPosition(70,60)
      sp1:addChild(sp2)
      local sp3 = cc.Sprite:create("icon/paihangbang_0006_bigtouxiang.png")
      sp3:setPosition(50,55)
      sp2:addChild(sp3)
      local sp4 = cc.Sprite:create("icon/paihangbang_0005_nv.png")
      sp4:setPosition(600,90)
      sp1:addChild(sp4)
      local sp5 = cc.Sprite:create("icon/daojusc_0011_coin.png")
      sp5:setPosition(600,30)
      sp1:addChild(sp5)
      local sp6 = cc.Sprite:create("icon/paihangbang_0012_nicheng.png")
      sp6:setPosition(716, 90);
      sp1:addChild(sp6);
      local sp7 = cc.Sprite:create("icon/paihangbang_0011_jinriyingli.png")
      sp7:setPosition(690, 30);
      sp1:addChild(sp7);
      local sp8 = nil
      if i<4 then
        sp8 = cc.Sprite:create(TableX[i]);
      else
        sp8 = cc.Label:createWithSystemFont(tostring(i),"",60);
        sp8:setColor(cc.c3b(255, 255, 0))
      end
        sp8:setPosition(300,60)
        sp1:addChild(sp8)
        local lbl_name = cc.Label:createWithSystemFont("有钱,任性!","",30);
        lbl_name:setPosition(850,90)
        sp1:addChild(lbl_name)
        local lbl_gold = cc.Label:createWithSystemFont("1800000000","",30);
        lbl_gold:setPosition(850,30)
        sp1:addChild(lbl_gold)
    end
    garidLayout:updateContent();
    ScrollView:setInnerContainerSize(garidLayout:getContentSize());
    end);
    local btn_c = self:getWidget("Button_4")
    btn_c:addClickEventListener(function()
      local img_m = self:getWidget("Image_11")
      img_m:setVisible(false)
      local img_c = self:getWidget("Image_12")
      img_c:setVisible(true)
      garidLayout:removeAllChildren()
      for i=1,20 do
        local sp1 = ccui.Scale9Sprite:create("icon/paihangbang_0019_bigframe.png")
        sp1:setContentSize(1050, 120);
        garidLayout:addChild(sp1)
        local sp2 = cc.Sprite:create("icon/paihangbang_0009_playerframe.png")
        sp2:setPosition(70,60)
        sp1:addChild(sp2)
        local sp3 = cc.Sprite:create("icon/paihangbang_0006_bigtouxiang.png")
        sp3:setPosition(50,55)
        sp2:addChild(sp3)
        local sp4 = cc.Sprite:create("icon/paihangbang_0005_nv.png")
        sp4:setPosition(600,90)
        sp1:addChild(sp4)
        local sp5 = cc.Sprite:create("icon/daojusc_0011_coin.png")
        sp5:setPosition(600,30)
        sp1:addChild(sp5)
        local sp6 = cc.Sprite:create("icon/paihangbang_0012_nicheng.png")
        sp6:setPosition(716, 90);
        sp1:addChild(sp6);
        local sp7 = cc.Sprite:create("icon/paihang_caifu.png")
        sp7:setPosition(716, 30);
        sp1:addChild(sp7);
        local sp8 = nil
        if i<4 then
          sp8 = cc.Sprite:create(TableX[i]);
        else
          sp8 = cc.Label:createWithSystemFont(tostring(i),"",60);
          sp8:setColor(cc.c3b(255, 255, 0))
        end
          sp8:setPosition(300,60)
          sp1:addChild(sp8)
          local lbl_name = cc.Label:createWithSystemFont("有钱,任性!","",30);
          lbl_name:setPosition(850,90)
          sp1:addChild(lbl_name)
          local lbl_gold = cc.Label:createWithSystemFont("1800000000","",30);
          lbl_gold:setPosition(850,30)
          sp1:addChild(lbl_gold)
        end
      garidLayout:updateContent();
      ScrollView:setInnerContainerSize(garidLayout:getContentSize());
      end);
end
return Ranking
