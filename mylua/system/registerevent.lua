-- 按钮按esc
local function registerPlayerEsc()
    local tri = CreateTrigger()
    for id = 0, 7 do
        TriggerRegisterPlayerEvent(tri, Player(id), EVENT_PLAYER_END_CINEMATIC)
        TriggerAddAction(tri, function()
            CameraManager:unlockCameraAtEquip( id )
            CameraManager.resetPlayerCamera( id )
        end)
    end
end
-- 单位释放技能
local function registerAnySpeel()
    local tri = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ( tri, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    TriggerAddCondition( tri, Condition( function()
        if ( gfun.objectId(GetSpellAbilityId()) == 'A000' ) then
            local triUnit = GetTriggerUnit()
            local playerId = gfun.getPlayerIdByUnit(triUnit)
            local ui = PlayerManager:getUI(playerId)
            ui:updateEquipUIShow()
        end
        return false
    end) )
end
-- 任意单位获得物品
local function registerAnyPickUpItem()
    local tri = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ( tri, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    TriggerAddCondition( tri, Condition( function()
        local it = GetManipulatedItem()
        local u = GetTriggerUnit()
        local heroData = UnitManager:getUnitData(u)
        heroData:pickUpItemInBag( it )
        return false
    end) )
end
-- 发动目标指令
local function orderToItemAction()
    local id = GetPlayerId(GetTriggerPlayer())
    local u = GetTriggerUnit()
    local x1 = GetUnitX(u)
    local y1 = GetUnitY(u)
    local it = GetOrderTargetItem()
    local x2 = GetItemX(it)
    local y2 = GetItemY(it)
    local iid = GetItemTypeId(it)
    
    if GetIssuedOrderId() ~= 851971 or GetOrderTargetItem() == nil or IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == false then
        return
    end
    
    if gfun.distanceBetweenXY(x1 , y1 , x2 , y2) >= 150 then
        gfun.log("距离")
    else
        local heroData = UnitManager:getUnitData(u)
        heroData:pickUpItemInBag( it )
        IssuePointOrder(u, "smart", x1, y1)
    end
end
local function registerOrderToItem()
    local tri = CreateTrigger()
    TriggerAddAction(tri, orderToItemAction)
    for id = 0, 7 do
        TriggerRegisterPlayerUnitEvent(tri, Player(id), EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER, null)
    end
end
-- 初始化
function initRegisterEvent()
    -- esc
    registerPlayerEsc()
    -- 任意单位释放技能
    registerAnySpeel()
    -- 任意单位获得物品
    registerAnyPickUpItem()
    -- 发动目标指令
    registerOrderToItem()
end
