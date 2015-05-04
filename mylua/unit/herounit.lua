local attrStrLessList = {
	"m_attackD", -- 攻击下限
	"m_attackU", -- 攻击上限
	"m_magicD", -- 魔法下限
	"m_magicU", -- 魔法上限
	"m_taoistD", -- 道术下限
	"m_taoistU", -- 道术上限
	"m_phyDefD", -- 防御下限
	"m_phyDefU", -- 防御上限
	"m_magDefD", -- 魔御下限
	"m_magDefU", -- 魔御上限
	"m_accuracy", -- 准确
	"m_agile", -- 敏捷
    "m_roleHeavy" -- 人物身体负重 
}
local attrStrList = {
	"m_attackD", -- 攻击下限
	"m_attackU", -- 攻击上限
	"m_magicD", -- 魔法下限
	"m_magicU", -- 魔法上限
	"m_taoistD", -- 道术下限
	"m_taoistU", -- 道术上限
	"m_phyDefD", -- 防御下限
	"m_phyDefU", -- 防御上限
	"m_magDefD", -- 魔御下限
	"m_magDefU", -- 魔御上限
	"m_accuracy", -- 准确
	"m_agile", -- 敏捷
	"m_lucky", -- +幸运/ -诅咒 
	"m_sacred", -- 神圣
	"m_magicAvoid", -- 魔法躲避
    "m_poisonRemuse", -- 中毒恢复
	"m_attackSpeed", -- 攻击速度
    "m_roleHeavy" -- 人物身体负重 
}
-- 属性分类 物品基础 不显示 极品 显示 特殊 总共
local roleAttrList = { "_tempShow", "_tempTotal"}
-- 更新人物属性
    -- 基础 = 人物基础 （attackU）
    
    -- 物品 = 物品总共 （attackU_propTotal）
    -- 隐藏 = 物品隐藏 （attackU_unShow ）
    
    -- 特殊 = 技能或者药水( attackU_special )
    
    -- 总共 = 人物基础 + 物品总共 + 特殊
    -- 显示 = 物品总共 - 物品特殊
    
HeroUnit = class("HeroUnit", BaseUnit)
HeroUnit.m_jobType = 0 -- 职业
HeroUnit.m_sex = 0 -- 性别
HeroUnit.m_lv = 0 -- 等级
HeroUnit.m_exp = 0 -- 经验
HeroUnit.m_brawn = 0 -- 最大腕力
HeroUnit.m_bagHeavy = 0 -- 背包最大负重

HeroUnit.m_curBagHeavy = 0  -- 当前背包负重
HeroUnit.m_curBrawn = 0     -- 当前腕力
HeroUnit.m_curRoleHeavy = 0 -- 当前人物负重

HeroUnit.m_bodyEquipList = {} -- 身上的装备
HeroUnit.m_bagItemList = {} -- 背包物品
HeroUnit.m_usableItemList = {} -- 六格
-- 构造
function HeroUnit:ctor()
    -- 基本数据
    self.m_unitType = EM_UNIT_TYPE.HERO -- 英雄
    self.m_attackType = 1 -- 攻击类型
	-- 属性
    for i, str in ipairs( attrStrList ) do
        for k, keyStr in ipairs(roleAttrList) do
            local attrStr = string.format( "%s%s",str, keyStr )
            self[attrStr] = 0
        end	
        self[str] = 0 -- 人物基础
    end
    
    self.m_jobType = 0 -- 职业
    self.m_sex = 0 -- 性别
    self.m_lv = 0 -- 等级
    self.m_exp = 0 -- 经验
    self.m_brawn = 0 -- 腕力
    self.m_bagHeavy = 0 -- 背包负重
    self.m_curBagHeavy = 0 -- 当前背包负重
    self.m_curBrawn = 0     -- 当前腕力
    self.m_curRoleHeavy = 0 -- 当前人物负重

    self.m_bodyEquipList = {} -- 身上的装备
    self.m_bagItemList = {} -- 背包物品
    self.m_usableItemList = {} -- 六格
end
-- 创建
function HeroUnit.create( hero, jobType, sex )
    local instance = HeroUnit.new()
    instance:init(hero, jobType, sex)
    return instance
end
-- 初始化
function HeroUnit:init(hero, jobType, sex )
    self.m_unit = hero -- 单位
    self.m_jobType = jobType -- 职业
    self.m_sex = sex -- 性别
    self.m_lv = 0 -- 等级
    self.m_exp = 0 -- 经验
    
    self.m_brawn = 0 -- 腕力
    self.m_bagHeavy = 0 -- 背包负重
    
    -- 不会变的属性
    self.m_lucky = 0 -- +幸运/ -诅咒 
    self.m_sacred = 0 -- 神圣
    self.m_magicAvoid = 1 -- 魔法躲避
    self.m_poisonRemuse = 0 -- 中毒恢复
    self.m_attackSpeed = 0 -- 攻击速度
end
-- 更新人物属性
function HeroUnit:updateHeroAttr()
    -- 重置人物基础
    local heroCfg = HeroCfg[self.m_jobType][self.m_lv] or {}
    for i, attrStr in ipairs(attrStrLessList) do -- 遍历所有的字符串
        self[attrStr] = heroCfg[attrStr] or 0
    end
    self.m_brawn = heroCfg["m_brawn"] or 0 -- 腕力
    self.m_bagHeavy = heroCfg["m_bagHeavy"] or 0 -- 背包负重
    
    -- 重置人物特殊
    for i, attrStr in ipairs(attrStrList) do -- 遍历所有的字符串
        local propTotal = 0 -- 物品总共
        local unShow = 0 -- 物品隐藏
        for k, bodyItem in pairs( self.m_bodyEquipList ) do -- 身上的装备
            local itemTotal, itemUnShow = bodyItem:getItemTotalAttr( attrStr )
            propTotal = propTotal + itemTotal 
            unShow = unShow + itemUnShow
        end
        -- 人物总共
        local tempTotalStr = string.format( "%s_tempTotal",attrStr )
        local tempShowStr = string.format( "%s_tempShow",attrStr )
        self[tempTotalStr] = self[attrStr] + propTotal -- 伪总共 = 人物基础 + 物品总共
        self[tempShowStr] = self[tempTotalStr] - unShow -- 伪显示 = 人物总共 - 隐藏属性
    end
end
-- 获取人物特殊属性
function HeroUnit:getSpecialAttr( attrStr )
    local isHaveSpAttr = false
    return 0
end
-- 获取人物总属性
function HeroUnit:getTotalAttr( attrStr )
    if attrStr == "m_bagHeavy" or attrStr == "m_brawn" then
        return self[attrStr]
    else
        local tempTotalStr = string.format( "%s_tempTotal",attrStr )
        return self[tempTotalStr] + self:getSpecialAttr(attrStr)
    end
end
-- 获取人物显示属性
function HeroUnit:getShowAttr( attrStr )
    if attrStr == "m_bagHeavy" or attrStr == "m_brawn" then
        return self[attrStr]
    else
        local tempShowStr = string.format( "%s_tempShow",attrStr )
        return self[tempShowStr] + self:getSpecialAttr(attrStr)
    end
end
-- 获取人物剩余人物负重
function HeroUnit:getRemainRoleHeavy()
    return self:getShowAttr( "m_roleHeavy" ) - self.m_curRoleHeavy-- 当前人物负重
end
-- 获取人物剩余腕力
function HeroUnit:getRemainBrawn()
    return self:getShowAttr( "m_brawn" ) - self.m_curBrawn-- 当前腕力
end
-- 获取人物剩余背包负重
function HeroUnit:getRemainBagHeavy()
    return self:getShowAttr( "m_bagHeavy" ) - self.m_curBagHeavy-- 当前背包负重
end

-- 人物升级
function HeroUnit:riseHeroLv()
    local hero = self.m_unit-- 绑定单位
    if not hero then
        return
    end
    local curLv = GetUnitLevel(hero)
    self.m_lv = curLv
    self:updateHeroAttr()
end
-- 捡起物品到包里
function HeroUnit:pickUpItemInBag( it )
    local bagList = self["m_bagItemList"]
    local itemData = ItemManager.m_itemDataList[it] -- 物品数据
    local index = #bagList + 1
    -- 是否有位置
    if index > 40 then
        print("bagFull 背包已满")
        return
    end
    -- 重量是否够
    local itemHeavy = itemData:getItemHeavy()
    local totalHeavy = self.m_curBagHeavy + itemHeavy
    if totalHeavy > self.m_bagHeavy then
        gfun.log("背包负重不足")
        return
    end
    
    -- 存入包里
    bagList[index] = itemData
    itemData:setItemToPlayer( self.m_unit )
    -- 负重增加
    self.m_curBagHeavy = totalHeavy
    
    SetItemPosition( it, -29170,-29340)
    print("getItem in " .. index)
    
end
-- 装一件装备
function HeroUnit:onEquip( itemData, toPos )
    local oldItem = self.m_bodyEquipList[toPos]
    self.m_bodyEquipList[toPos] = itemData
    if itemData then
        local itemType = itemData:getItemType()
        local itemHeavy = itemData:getItemHeavy()
        local heroHeavy = self:getShowAttr( "m_roleHeavy" )     -- 人物身体负重
        local heroBrawn = self:getShowAttr( "m_brawn" )         -- 腕力

        if itemType == EM_ITEM_TYPE.WEAPON then -- 武器
            self.m_curBrawn = self.m_curBrawn + itemHeavy     -- 腕力
        else
            self.m_roleHeavy = self.m_roleHeavy + itemHeavy   -- 负重
        end
    end
    return oldItem
end
-- 卸下一件装备
function HeroUnit:offEquip( itemData, fromPos )
    if fromPos == nil then
        for k, data in pairs( self.m_bodyEquipList ) do
            if data == itemData then
                fromPos = k
                break
            end
        end
    end
    if itemData then
        local itemType = itemData:getItemType()
        local itemHeavy = itemData:getItemHeavy()
        local heroHeavy = self:getShowAttr( "m_roleHeavy" )     -- 人物身体负重
        local heroBrawn = self:getShowAttr( "m_brawn" )         -- 腕力

        if itemType == EM_ITEM_TYPE.WEAPON then -- 武器
            self.m_curBrawn = self.m_curBrawn - itemHeavy     -- 腕力
        else
            self.m_roleHeavy = self.m_roleHeavy - itemHeavy   -- 负重
        end
        self.m_bodyEquipList[fromPos] = nil
    end
end
-- 从背包里删除一件物品
-- 根据幸运返回人物的攻击力/道术/魔法/防御/魔防
function HeroUnit:getRandomAttrWithLucky( str )
    local lucky = self:getTotalAttr( "m_lucky" )
    local attrD = self:getTotalAttr( string.format("%sD",str) )
    local attrU = self:getTotalAttr( string.format("%sU",str) )
    local count = 0
    
    local dis = attrU - attrD
    if dis == 0 then -- 无差距 直接返回
        return attrU
    elseif dis > 0 then -- 上限大
        if lucky <=0 then -- 如果幸运<=0 返回上下限随机值
            count = GetRandomInt(attrD,attrU)
            return count
        else -- 幸运>0
            local tempD
            tempD = math.floor( lucky / 10 * dis ) + attrD -- 下限 + 幸运/10*差距
            count = GetRandomInt(tempD,attrU)
            return count
        end
    else -- 下限大
        if lucky >= 0 then -- 幸运无用
            count = GetRandomInt(attrU,attrD)
            return count
        else -- 诅咒有效
            local newDis = 0 - dis -- 化为正数
            local tempU
            tempU = math.floor( (0-lucky)/10 * newDis ) + attrU
            count = GetRandomInt(tempU,attrD)
            return count
        end
    end
end
-- 获取物品属性字符串
function HeroUnit:getHeroAttrText()
    local textList = {}
    local line = ""
    local text = ""
    
    local strList = { "m_phyDef", "m_magDef", "m_attack", "m_taoist", "m_magic" }
    for k, attStr in ipairs(strList) do
        local attrD = self:getShowAttr( string.format("%sD",attStr) )
        local attrU = self:getShowAttr( string.format("%sU",attStr) )
        text = string.format("%d - %d",attrD,attrU)
        table.insert(textList,text)
        table.insert(textList,line)
    end
    
    local attrStrList = {"m_accuracy","m_agile","m_magicAvoid","m_roleHeavy","m_bagHeavy","m_brawn"}
    for k, attStr in ipairs(attrStrList) do
        if k == 3 then
            text = string.format("%d%%",self:getShowAttr(attStr)*10)
        else
            text = string.format("%d",self:getShowAttr(attStr))
        end
        table.insert(textList,text)
        if k ~= #attrStrList then
            table.insert(textList,line)
        end
    end
    
    return textList
end



