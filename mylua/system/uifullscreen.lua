-- 初始化镜头
require "CameraManager.lua"
-- 删除图标并清空
local function removeDestructable( trkData )
    local icon = trkData["m_des"]
    if icon then
        RemoveDestructable(trkData["m_des"])
        trkData["m_des"] = nil
    end
end
-- 生成图标
local function createDestructable( trkData, itemData )
    if itemData then
        local destId = itemData:getItemCfgSingleData("m_desId")
        local icon = CreateDestructable(gfun.ID( destId ), trkData["m_x"], trkData["m_y"], 0, 0.85, 0) -- 物品的可破坏物
        if icon then
            trkData["m_des"] = icon -- 图标
        end
    end
end
-- 镜头在这初始化
CameraManager:init()
UIFullScreen = class("UIFullScreen")
UIFullScreen.__index = UIFullScreen
UIFullScreen.m_hitTri = nil -- 点击触发器
UIFullScreen.m_touchTri = nil -- 触摸触发器
UIFullScreen.m_playerId = 0 -- 玩家id
UIFullScreen.m_trkList = {} -- trk列表
UIFullScreen.m_trkDataList = {} -- trkData列表
UIFullScreen.m_itemTextTagList = {} -- 物品属性漂浮文字列表
UIFullScreen.m_roleTextTagList = {} -- 人物属性漂浮文字列表
UIFullScreen.m_sourTrk = nil -- 上一个trk
function UIFullScreen:ctor()
    self.m_hitTri = nil -- 点击触发器
    self.m_touchTri = nil -- 触摸触发器
    self.m_playerId = 0 -- 玩家id
    self.m_trkList = {} -- trk列表
    self.m_trkDataList = {} -- trkData列表
    self.m_itemTextTagList = {} -- 物品属性漂浮文字列表
    self.m_roleTextTagList = {} -- 人物属性漂浮文字列表
    self.m_sourTrk = nil -- 上一个trk
end
function UIFullScreen.create( playerId )
    local instance = UIFullScreen.new()
    instance:init(playerId)
    return instance
end
-- 初始化
function UIFullScreen:init( playerId )
    self.m_playerId = playerId -- 玩家id
    
    self:initUIShow() -- 创建界面元素
    self:initTrkTrigger() -- 初始化触发器
    self:initTrk() -- 初始化并创建trk
end
-- 交换数据
function UIFullScreen:onChangeItem( sourTrkData, destTrkData, sourItemList, destItemList, sourItemIndex, destItemIndex, sourItemData, destItemData )
    -- 删除旧图标
    removeDestructable(sourTrkData)
    removeDestructable(destTrkData)
    -- 交换物品
    sourItemList[sourItemIndex] = destItemData
    destItemList[destItemIndex] = sourItemData
    -- 生成图标
    createDestructable( sourTrkData, destItemData ) -- 生成新图标
    createDestructable( destTrkData, sourItemData ) -- 生成新图标
end
-- trk点击回调
function UIFullScreen:onHit()
    local destTrk = GetTriggeringTrackable()
    local destTrkData = self.m_trkDataList[destTrk]
    if destTrkData then
        local sourTrk = self.m_sourTrk -- 上一个trk
        local playerId = self.m_playerId
        local heroData = PlayerManager:getHeroData(playerId)
        local bodyItemList = heroData.m_bodyEquipList -- 身上的装备
        local bagItemList = heroData.m_bagItemList -- 背包物品
        local usableItemList = heroData.m_usableItemList -- 六格
        local destTrkIndex = destTrkData["m_index"]
        local destItemList = {} -- 背包
        local destItemIndex = 0
        local destItemData = nil -- 数据
        if sourTrk == nil then
            if destTrkIndex >= 101 and destTrkIndex <= 140 then -- 背包
                destItemList = bagItemList -- 背包 
                destItemIndex = destTrkIndex - 100
                destItemData = destItemList[destItemIndex] -- 数据
            elseif destTrkIndex >= 21 and destTrkIndex <= 26 then -- 六格
                destItemList = usableItemList -- 六格 
                destItemIndex = destTrkIndex - 20
                destItemData = destItemList[destItemIndex] -- 数据
            elseif destTrkIndex >= 1 and destTrkIndex <= 13 then -- 背包 --> 装备
                destItemList = bodyItemList -- 装备 
                destItemIndex = destTrkIndex
                destItemData = destItemList[destItemIndex] -- 数据
            end
            if destItemData ~= nil then
                self.m_sourTrk = destTrk
            end
            return
        else
            local sourTrkData = self.m_trkDataList[sourTrk]
            local sourTrkIndex = sourTrkData["m_index"]
            local sourItemList = {} -- 背包
            local sourItemIndex = 0
            local sourItemData = nil -- 数据
            if sourTrk == destTrk then -- 双击
            -- 背包
            elseif sourTrkIndex >= 101 and sourTrkIndex <= 140 then -- 背包
                sourItemList = bagItemList -- 背包
                sourItemIndex = sourTrkIndex - 100
                sourItemData = sourItemList[sourItemIndex] -- 数据
                if destTrkIndex >= 1 and destTrkIndex <= 13 then -- 背包 --> 装备
                    destItemList = bodyItemList -- 装备
                    destItemIndex = destTrkIndex
                    destItemData = destItemList[destItemIndex] -- 数据
                    local destNeedType = destTrkData["m_equipType"] -- 目标可装备类型
                    local sourType = sourItemData:getItemType() -- 物品种类
                    if (sourType == destNeedType) or ( (sourType == EM_ITEM_TYPE.POISON or sourType == EM_ITEM_TYPE.PAPER) and (destNeedType == EM_ITEM_TYPE.PAPER) ) then
                        -- 条件如果满足
                        if sourItemData:isSuitForHeroEquip( heroData ) == true then
                            self:onChangeItem( sourTrkData, destTrkData, sourItemList, destItemList, sourItemIndex, destItemIndex, sourItemData, destItemData )
                        end
                    else
                        gfun.showErrorStr("不可装备")
                    end
                    gfun.log("背包 --> 装备")
                elseif destTrkIndex >= 21 and destTrkIndex <= 26 then -- 背包 --> 六格 
                    destItemList = usableItemList -- 六格 
                    destItemIndex = destTrkIndex - 20
                    destItemData = destItemList[destItemIndex] -- 数据
                    local sourType = sourItemData:getItemType() -- 物品种类
                    if sourType == EM_ITEM_TYPE.CONSUMPTION then -- 消耗品
                        self:onChangeItem( sourTrkData, destTrkData, sourItemList, destItemList, sourItemIndex, destItemIndex, sourItemData, destItemData )
                    end
                    gfun.log("背包 --> 六格")
                elseif destTrkIndex >= 101 and destTrkIndex <= 140 then -- 背包 --> 背包
                    destItemList = bagItemList -- 背包
                    destItemIndex = destTrkIndex - 100
                    destItemData = destItemList[destItemIndex] -- 数据
                    self:onChangeItem( sourTrkData, destTrkData, sourItemList, destItemList, sourItemIndex, destItemIndex, sourItemData, destItemData )
                    gfun.log("背包 --> 背包")
                elseif destTrkIndex == 40 then -- 背包 --> 丢弃
                    destItemList = {} -- 无
                    destItemIndex = 0
                    destItemData = nil -- 数据
                    self:onChangeItem( sourTrkData, destTrkData, sourItemList, destItemList, sourItemIndex, destItemIndex, sourItemData, destItemData )
                    gfun.log("背包 --> 丢弃")
                end
            -- 六格 -> 背包
            elseif (sourTrkIndex >= 21 and sourTrkIndex <= 26) and (destTrkIndex >= 101 and destTrkIndex <= 140 ) then -- 六格 -> 背包

            -- 装备-> 背包
            elseif (sourTrkIndex >= 1 and sourTrkIndex <= 13) and (destTrkIndex >= 101 and destTrkIndex <= 140 ) then -- 装备 -> 背包
                
            end
            -- 清空源
            self.m_sourTrk = nil
        end
    end
end
-- trk触摸回调
function UIFullScreen:onTouch()
    local curTrk = GetTriggeringTrackable()
    
    local trkData = self.m_trkDataList[curTrk]
    if trkData then
        local playerId = self.m_playerId
        local index = trkData["m_index"]
        local heroData = PlayerManager:getHeroData(playerId)
        
        local itemData = nil
        
        if index >=1 and index <= 13 then -- 装备
        
        elseif index >=21 and index <= 26 then -- 六格
        
        elseif index == 40 then -- 丢弃
        elseif index >=101 and index <= 140 then -- 背包
            local bagItemList = heroData.m_bagItemList -- 背包
            itemData = bagItemList[index - 100] -- 数据
        end
        if itemData then
            local textList = itemData:getItemAttrText()
            self:createItemText( textList )
        end
    end
end
-- 创建玩家的全屏装备界面
function UIFullScreen:updateEquipUIShow()
    local heroData = PlayerManager:getHeroData(self.m_playerId)
    if not heroData then
        return 
    end
    
    -- 镜头锁定
    CameraManager:lockCameraAtEquip( self.m_playerId )
    self:updateHeroAttrShow() -- 英雄属性
    self:updateBagItemShow() -- 背包物品
end
-- 更新显示英雄属性
function UIFullScreen:updateHeroAttrShow()
    local heroData = PlayerManager:getHeroData(self.m_playerId)
    if not heroData then
        return 
    end
    local heroAttrText = heroData:getHeroAttrText()
    self:createHeroText( heroAttrText )
end
-- 更新显示背包物品
function UIFullScreen:updateBagItemShow()
    -- 清空物品漂浮文字
    local textTagList = self.m_itemTextTagList
    for k, tag in ipairs(textTagList) do
        DestroyTextTag(tag)
    end
    self.m_itemTextTagList = {}
    local heroData = PlayerManager:getHeroData(self.m_playerId)
    if not heroData then
        return 
    end
    local bagItemList = heroData.m_bagItemList
    for i = 1, 40 do
        local trk = self.m_trkList[100+i]
        local trkData = self.m_trkDataList[trk]
        local itemData = bagItemList[i]
        local oldIcon = trkData["m_des"] 
        removeDestructable( trkData ) -- 删除旧图标
        createDestructable( trkData, itemData ) -- 生成新图标
    end
end
-- 创建漂浮文字-物品
function UIFullScreen:createItemText( textList )
    local playerId = self.m_playerId
    local textTagList = self.m_itemTextTagList
    for k, tag in ipairs(textTagList) do
        DestroyTextTag(tag)
    end
    self.m_itemTextTagList = {}
    local startX = -29775
    local startY = 29298
    local moveY = 9
    local i = 0
    for k, text in ipairs(textList) do
        if text ~= "" then
            local textTag = CreateTextTag()
            table.insert(self.m_itemTextTagList,textTag)
            SetTextTagText(textTag, text, 0.0281 ) 
            SetTextTagPos(textTag, startX, startY - i*moveY - playerId*4000, 0)
            SetTextTagPermanent( textTag, true )
            SetTextTagVisibility( textTag, true )
        else
            i = i + 1
        end
        i = i + 1
    end
end
-- 创建漂浮文字-人物
function UIFullScreen:createHeroText(textList )
    local playerId = self.m_playerId
    local textTagList = self.m_roleTextTagList
    for k, tag in ipairs(textTagList) do
        DestroyTextTag(tag)
    end
    self.m_roleTextTagList = {}
    local startX = -28830
    local startY = 29322
    local moveY = 9
    local i = 0
    for k, text in ipairs(textList) do
        if text ~= "" then
            local textTag = CreateTextTag()
            table.insert(self.m_roleTextTagList,textTag)
            SetTextTagText(textTag, text, 0.0281 ) 
            SetTextTagPos(textTag, startX, startY - i*moveY - playerId*4000, 0) 
            SetTextTagPermanent( textTag, true ) 
            SetTextTagVisibility( textTag, true )
        else
            i = i + 1
        end
        i = i + 1
    end
end
-- 初始化可追踪物的触发器
function UIFullScreen:initTrkTrigger()
    self.m_hitTri = CreateTrigger()
    self.m_touchTri = CreateTrigger()
    TriggerAddAction( self.m_hitTri, function()
        self:onHit()
    end)
    TriggerAddAction( self.m_touchTri, function()
        self:onTouch()
    end)
end
-- 初始化界面显示可破坏物
function UIFullScreen:initUIShow()
    local playerId = self.m_playerId
    local z = 0
    CreateDestructableZ(gfun.ID( |B000| ),-29400.00,29170.00-4000*playerId,z,0.00,1.25,0)-- 人物背包
    CreateDestructableZ(gfun.ID( |B002| ),-29330.00,28850.00-4000*playerId,z,0.00,1.25,0)-- 快捷栏
    CreateDestructableZ(gfun.ID( |B001| ),-29045.00,29155.00-4000*playerId,z,0.00,1.25,0)-- 人物界面
    CreateDestructableZ(gfun.ID( |B004| ),-29720.00,29120.00-4000*playerId,z,0.00,1.25,0)-- 物品属性框
    CreateDestructableZ(gfun.ID( |B003| ),-28830.00,29120.00-4000*playerId,z,0.00,1.25,0)-- 人物属性框
    
end
-- 创建单个trk
function UIFullScreen:createSingleTrk( mdxStr, x, y , id, index )
    local trk= CreateTrackable(mdxStr, x, y, 0)
    self.m_trkList[index] = trk
    self.m_trkDataList[trk] = {
        m_playerId = id,
        m_index = index,
        m_x = x,
        m_y = y,
        m_equipType = nil,
        m_des = nil -- 可破坏物
    }
    -- 注册事件
    TriggerRegisterTrackableHitEvent( self.m_hitTri, trk )
    TriggerRegisterTrackableTrackEvent( self.m_touchTri,trk )
    return trk, trkData
end
-- 创建单个装备trk
-- 创建一个玩家的可追踪物
function UIFullScreen:initTrk()
    local weaponIconMdx = "war3mapImported\\DBIcon.mdx"
    local nornalIcomMdx = "war3mapImported\\FBIcon.mdx"
    local id = self.m_playerId
    local x = 0
    local y = 0
    local function createTrkForEquip(mdxStr, x, y , id, index, equipType)
        local trk, trkData = self:createSingleTrk( mdxStr, x, y , id , index )
        if trkData then
            trkData["m_equipType"] = equipType
        end
    end
    x=-29072.00
    y=29178.00-4000*id
    createTrkForEquip( weaponIconMdx, x, y , id , 1, EM_ITEM_TYPE.WEAPON )-- 武器
    
    x=-29035.00
    y=29170.00-4000*id
    createTrkForEquip( weaponIconMdx, x, y , id , 2, EM_ITEM_TYPE.CLOTH )-- 衣服
    
    x=-29037.00
    y=29283.00-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 3, EM_ITEM_TYPE.HELMAT )-- 头盔
    
    x=-28959.00
    y=29248.00-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 4, EM_ITEM_TYPE.NECKLACE )-- 项链
    
    x=-28959.00
    y=29200.00-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 5, EM_ITEM_TYPE.MEDAL )-- 勋章
    x=-29115.00
    y=29137.50-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 6, EM_ITEM_TYPE.BRACELET )-- 手镯左
    x=-28959.00
    y=29137.50-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 7, EM_ITEM_TYPE.BRACELET )-- 手镯右
    x=-29115.00
    y=29089.50-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 8, EM_ITEM_TYPE.RING )-- 戒指左
    x=-28959.00
    y=29089.50-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 9, EM_ITEM_TYPE.RING )-- 戒指右
    x=-29115.00
    y=29041.50-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 10, EM_ITEM_TYPE.PAPER )-- 符
    x=-29011.00
    y=29041.50-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 11, EM_ITEM_TYPE.SHOES )-- 鞋子
    x=-29063.00
    y=29041.50-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 12, EM_ITEM_TYPE.BELT )-- 腰带
    x=-28959.00
    y=29041.50-4000*id
    createTrkForEquip( nornalIcomMdx, x, y , id , 13, EM_ITEM_TYPE.GEM )-- 宝石
    
    for j = 0, 5 do
        x=-29464.00+53.5*j
        y=28850.00-4000*id
        self:createSingleTrk( nornalIcomMdx, x, y , id , 21+j )-- 六格(21~26)
    end
    
    x=-29220.00
    y=29080.00-4000*id
    self:createSingleTrk( nornalIcomMdx, x, y , id , 40 )-- 丢弃
    
    
    for j = 0, 4 do
        for k = 0, 7 do
            x=-29594.00+k*44.9
            y=29294.00-4000*id-40*j
            self:createSingleTrk( nornalIcomMdx, x, y , id, 101 + j*8 + k )-- 背包=>人物背包(101~140)
        end
    end
end
