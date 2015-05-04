-- 消耗品
require "BaseItem.lua"
ItemConsumption = class("ItemConsumption", BaseItem)
ItemConsumption.__index = ItemConsumption
ItemConsumption.m_curNum = 0 -- 可以使用次数
-- 构造
function ItemConsumption:ctor()
    self.m_curNum = 0 -- 可以使用次数
end
-- 创建
function ItemConsumption.create( it )
    local instance = ItemConsumption.new()
    instance:init( it )
    return instance
end
-- 初始化
function ItemConsumption:init(it)
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
    end
    
    self.m_curNum = self.m_cfgData["m_maxNum"] -- 设置数量
    
end
-- 获取物品重量
function ItemConsumption:getItemHeavy()
    return self.m_cfgData["m_heavy"] * self.m_curNum
end
-- 获取物品价格
function ItemConsumption:getItemPrice()
    return self.m_cfgData["m_money"] * self.m_curNum
end
-- 获取物品属性字符串
function ItemConsumption:getItemAttrText()
    local textList = {}
    local line = ""
    local text = ""
    local cfgData = self.m_cfgData
    
    -- 名字
    text = string.format("|cFFFFFF00%s|r",cfgData["m_name"])
    table.insert(textList,text)
    table.insert(textList,line)
    table.insert(textList,line)
    
    -- hp恢复
    local hp = cfgData["m_totalHp"]
    if hp then
        text = string.format("|cFF00FF00生命值 +%d|r",hp)
        table.insert(textList,text)
        table.insert(textList,line)
    end
    -- mp恢复
    local mp = cfgData["m_totalMp"]
    if mp then
        text = string.format("|cFF00FF00魔法值 +%d|r",mp)
        table.insert(textList,text)
        table.insert(textList,line)
    end
    table.insert(textList,line)
    
    -- 可使用次数
    text = string.format("数量 %d/%d", self.m_curNum, cfgData["m_maxNum"])
    table.insert(textList,text)
    table.insert(textList,line)
    -- 重量
    text = string.format("重量 %d",self:getItemHeavy())
    table.insert(textList,text)
    table.insert(textList,line)
    table.insert(textList,line)
    
    -- 价钱
    text = string.format("|cFFFFFF00售价 %d|r",self:getItemPrice())
    table.insert(textList,text)
    
    return textList
end
