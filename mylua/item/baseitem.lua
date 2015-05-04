-- 接口
BaseItem = class("BaseItem")
BaseItem.__index = BaseItem
BaseItem.m_cfgId = 0 -- 配置id
BaseItem.m_item = nil -- 绑定的物品
BaseItem.m_cfgData = {} -- 基础配置数据
BaseItem.m_playerId = 0 -- 绑定的玩家id
BaseItem.m_hero = nil -- 绑定的英雄
function BaseItem:ctor()
end
-- 获取物品
function BaseItem:getItem()
	return self.m_item
end
-- 获取物品的配置
function BaseItem:getItemCfgData()
    return self.m_cfgData
end
-- 获取物品的类型
function BaseItem:getItemType()
	return self.m_cfgData["m_type"]
end
-- 获取物品配置的单项属性
function BaseItem:getItemCfgSingleData( attrStr )
    return self.m_cfgData[attrStr]
end
-- 获取物品重量
function BaseItem:getItemHeavy()
    return self.m_cfgData["m_heavy"]
end
-- 获取物品价格
function BaseItem:getItemPrice()
    return self.m_cfgData["m_money"]
end
-- 设置物品给玩家
function BaseItem:setItemToPlayer( hero )
    self.m_hero = hero
    self.m_playerId = gfun.getPlayerIdByUnit( hero )
end
-- 是否符合英雄装备
function BaseItem:isSuitForHeroEquip( heroData )
	if not heroData then
		return false
	end
	local strList = {"m_needLv","m_needAttack","m_needTaosit","m_needMagic"}
    local strDesList = {"需求等级","需求攻击力","需求道术力","需求魔法力"}
    local needSex = self.m_cfgData["m_needLv"]
    local needLv = self.m_cfgData["m_needLv"] or 0
    local needAttack = self.m_cfgData["m_needAttack"] or 0
    local needTaosit = self.m_cfgData["m_needTaosit"] or 0
    local needMagic = self.m_cfgData["m_needMagic"] or 0
    local heroLv = heroData.m_lv
    local heroSex = heroData.m_sex


	if needSex and heroSex ~= needSex then
    	gfun.showErrorStr("性别不符")
    	return false
    end
    if heroLv < needLv then
    	gfun.showErrorStr("等级不够")
    	return false
    end
    if heroData:getShowAttr( "m_attackU" ) < needAttack then
    	gfun.showErrorStr("攻击力不够")
    	return false
    end
    if heroData:getShowAttr( "m_taositU" ) < needTaosit then
    	gfun.showErrorStr("道术力不够")
    	return false
    end
    if heroData:getShowAttr( "m_magicU" ) < needMagic then
    	gfun.showErrorStr("魔法力不够")
    	return false
    end

    local itemHeavy = self:getItemHeavy()
    local itemType = self:getItemType()
    local heroHeavy = heroData:getShowAttr( "m_roleHeavy" )     -- 人物身体负重
    local heroBrawn = heroData:getShowAttr( "m_brawn" )         -- 腕力

    if itemType == EM_ITEM_TYPE.WEAPON then -- 武器
        if heroBrawn < itemHeavy then
            gfun.showErrorStr("腕力不够")
            return false
        end
    else
        if heroHeavy < itemHeavy then
            gfun.showErrorStr("负重不够")
            return false
        end
    end
    return true
end
