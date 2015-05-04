-- 杂物
require "BaseItem.lua"
ItemBook = class("ItemBook", BaseItem)
ItemBook.__index = ItemBook
-- 构造
function ItemBook:ctor()
end
-- 创建
function ItemBook.create( it )
    local instance = ItemBook.new()
    instance:init( it )
    return instance
end
-- 初始化
function ItemBook:init(it)
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
end
-- 获取物品属性字符串
function ItemBook:getItemAttrText()
    local textList = {}
    local line = ""
    local text = ""
    local cfgData = self.m_cfgData
    
    -- 名字
    text = string.format("|cFFFFFF00%s|r",cfgData["m_name"])
    table.insert(textList,text)
    table.insert(textList,line)
    table.insert(textList,line)
    
    -- 职业
    local jobStr = gfun.getJobTypeStr( cfgData["m_jobType"] )
    text = string.format("|cFF00FFFF%s秘籍|r",jobStr)
    table.insert(textList,text)
    table.insert(textList,line)
    -- 提示
    text = "|cFF00FFFF双击学习|r"
    table.insert(textList,text)
    table.insert(textList,line)
    table.insert(textList,line)
    -- 重量
    text = string.format("重量 %d",cfgData["m_heavy"])
    table.insert(textList,text)
    table.insert(textList,line)
    table.insert(textList,line)
    
    -- 价钱
    text = string.format("|cFFFFFF00售价 %d|r",cfgData["m_money"])
    table.insert(textList,text)
    
    return textList
end
