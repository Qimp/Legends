require "BaseItem.lua"
-- 装备
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
    "m_roleHeavy", -- 提供负重 
	"m_magicAvoid", -- 魔法躲避
    "m_poisonRemuse", -- 中毒恢复
	"m_attackSpeed" -- 攻击速度
}
ItemEquip = class("ItemEquip", BaseItem)
ItemEquip.__index = ItemEquip
ItemEquip.m_quality = 0 -- 持久
-- 构造
function ItemEquip:ctor()
    self.m_quality = 0 -- 持久
end
-- 创建(如果 rp==-100 那么将不生成极品属性)
function ItemEquip.create( it, rp )
    local instance = ItemEquip.new()
    instance:init( it, rp)
    return instance
end
-- 初始化
function ItemEquip:init( it, rp )
    -- 生成极品
    if it then
        self.m_item = it -- 绑定的物品
        local index = R2I( GetWidgetLife(it) )
        self.m_cfgId = index -- 配置id
        local itemData = ItemCfg[index] -- 基础数据
        if not itemData then
            print( "物品配置数据丢失 index = " .. index )
            return
        else
            self.m_cfgData = itemData -- 基础配置数据
        end
        local tempAttr = nil
        for k, attrStr in ipairs(attrStrList) do
            tempAttr = itemData[attrStr] -- 基础属性
            if tempAttr and rp ~= -100 then -- 该物品有这个属性
                local exAttr = ItemEquip.getItemExAttr( rp )
                if exAttr > 0 then
                    local exStr = string.format("%s_ex",attrStr) 
                    self[exStr] = exAttr
                end
            end
        end
        -- 持久
        local maxQuality = itemData["m_maxQuality"]
        self.m_quality = GetRandomInt(1,maxQuality)
        
        
    end
    
end
-- 随机生成极品属性
function ItemEquip.getItemExAttr( rp )
    rp = rp or 0
    if GetRandomInt(1,1000) <= (10+rp) then -- 出现极品
        local rand = GetRandomInt(1,1000)
        local exAttr = 0
        if rand < 900 then
            exAttr = 1
        elseif rand < 950 then
            exAttr = 2
        elseif rand < 1000 then
            exAttr = 3
        elseif rand == 1000 then
            exAttr = 4
        end
        return exAttr
    end
    return 0
end
-- 获取物品显示属性
function ItemEquip:getItemShowAttr(attrStr)
    local base = self.m_cfgData[attrStr] or 0
    if base == -4 then
        base = 0
    end
    local exStr = string.format("%s_ex",attrStr) -- 极品的
    local ex = self[exStr] or 0
    
    return base + ex
end
-- 获取物品总属性
function ItemEquip:getItemTotalAttr( attrStr )
    local unShowStr = string.format("%s_unShow",attrStr) -- 隐藏的
    local unShow = self.m_cfgData[attrStr] or 0
    local showAttr = self:getItemShowAttr(attrStr)
    
    local total = showAttr + unShow
    return total, unShow
end
-- 获取物品出售价格
function ItemEquip:getItemPrice()
    local cfgData = self.m_cfgData
    local baseMoney = cfgData["m_money"]
    local maxQuality = cfgData["m_maxQuality"]
    local money = baseMoney / maxQuality * self["m_quality"]
    return money
end
-- 获取物品属性字符串
function ItemEquip:getItemAttrText()
    local textList = {}
    local line = ""
    local text = ""
    local cfgData = self.m_cfgData
    
    -- 名字
    text = string.format("|cFFFFFF00%s|r",cfgData["m_name"])
    table.insert(textList,text)
    table.insert(textList,line)
    table.insert(textList,line)
    
    -- 持久
    text = string.format("持久 %d/%d",self["m_quality"],cfgData["m_maxQuality"])
    table.insert(textList,text)
    table.insert(textList,line)
    
    -- 重量
    text = string.format("重量 %d",cfgData["m_heavy"])
    table.insert(textList,text)
    table.insert(textList,line)
    table.insert(textList,line)
    
    -- 物理防御、魔御、攻击、魔法、道术
    do
        local strList = {"m_phyDef","m_magDef","m_attack","m_magic","m_taoist" }
        local strDesList = {"防御","魔御","攻击","魔法","道术"}
        for k, attrStr in ipairs(strList) do
            local attrD = self:getItemShowAttr(string.format("%sD",attrStr))
            local attrU = self:getItemShowAttr(string.format("%sU",attrStr))
            if attrD > 0 or attrU > 0 then
                text = string.format("|cFF00FF00%s|r %3d - %3d",strDesList[k],attrD,attrU)
                table.insert(textList,text)
                table.insert(textList,line)
            end
        end
    end
    
    -- 
    do
        local strList = {"m_accuracy","m_agile","m_lucky","m_sacred","m_attackSpeed","m_magicAvoid","m_poisonRemuse","m_roleHeavy" }
        local strDesList = {"准确","敏捷","幸运、诅咒","神圣","攻击速度","魔法躲避","中毒恢复","负重"}
        for k, attrStr in ipairs(strList) do
            local attr = self:getItemShowAttr(attrStr)
            if attr ~= 0 then
                if k == 3 then
                    if attr > 0 then
                        text = string.format("|cFF00FF00幸运|r  + %2d",attr)
                    else
                        text = string.format("|cFF00FF00诅咒|r  + %2d",attr)
                    end
                elseif k == 6 or k == 7 then
                    text = string.format("|cFF00FF00%s|r  + %2d%%",strDesList[k],attr*10)
                else
                    text = string.format("|cFF00FF00%s|r  + %2d",strDesList[k],attr)
                end
                table.insert(textList,text)
                table.insert(textList,line)
            end
        end
    end
    
    
    table.insert(textList,line)
    -- 需求 
    local strList = {"m_needLv","m_needAttack","m_needTaosit","m_needMagic"}
    local strDesList = {"需求等级","需求攻击力","需求道术力","需求魔法力"}
    for k, str in ipairs(strList) do
        local attr = cfgData[str]
        if attr then
            text = string.format("%s %d",strDesList[k],attr)
            table.insert(textList,text)
            table.insert(textList,line)
            break
        end
    end
    -- 价钱
    local money = self:getItemPrice()
    text = string.format("|cFFFFFF00售价 %d|r",money)
    table.insert(textList,text)
    
    return textList
end
