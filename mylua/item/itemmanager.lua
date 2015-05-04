require "ItemCfg.lua"
require "ItemEquip.lua"
require "ItemSundries.lua"
require "ItemConsumption.lua"
require "ItemBook.lua"
ItemManager = {}
ItemManager.m_itemDataList = {}-- 物品数据仓库 物品的极品属性等 都存在这 以handle值为索引
-- 获取物品
function ItemManager:getItemData( it )
    if it then
        return self.m_itemDataList[it], it
    end
end
-- 删除物品
function ItemManager:removeItem( it )
    self.m_itemDataList[it] = nil
end
-- 创建物品
function ItemManager:createItem( itemId, playerId, x, y, rp )
    local it = CreateItem( itemId, x, y)
    local itemType = GetItemLevel( it )
    local itemData = nil
    
    if itemType >= EM_ITEM_TYPE.WEAPON and itemType <= EM_ITEM_TYPE.SHOES then -- 装备
        itemData = ItemEquip.create( it, rp )
    elseif itemType == EM_ITEM_TYPE.GROCERY then -- 杂物
        itemData = ItemSundries.create( it )
    elseif itemType == EM_ITEM_TYPE.CONSUMPTION then -- 消耗品
        itemData = ItemConsumption.create( it )
    elseif itemType == EM_ITEM_TYPE.BOOK then -- 书籍
        itemData = ItemBook.create( it )
    end
    if it then
        self.m_itemDataList[it] = itemData
    end
    return it
end
