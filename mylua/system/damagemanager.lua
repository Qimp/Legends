local s_damageTri = CreateTrigger()
DamageManager = {}
DamageManager.m_damageUnit = {} -- 伤害马甲
function DamageManager:attackDamageUnit( sourUnit , destUnit )
    local sourId = gfun.getPlayerIdByUnit( sourUnit )
    local damageUnit = self.m_damageUnit[sourId] -- 马甲
    local damage = 0
    
    local sourData = UnitManager:getUnitData(sourUnit)
    local destData = UnitManager:getUnitData(destUnit)
    
    if not sourData or not destData then
        return
    end
    -- 攻击类型
    local attackType = sourData["m_attackType"]
    local defStr = "m_phyDef" -- 默认是物防
    if attackType == EM_ATTACK_TYPE.MAGIC then -- 魔法伤害
        defStr = "m_magDef"
    end
    
    local sourAttackNum = sourData:getRandomAttrWithLucky( "m_attack" )
    local destDefeneNum = destData:getRandomAttrWithLucky( defStr )
    --print( "sourAttackNum = " .. sourAttackNum)
    --print( "destDefeneNum = " .. destDefeneNum)
    damage = sourAttackNum - destDefeneNum
    
    if damage < 0 then
        damage = 0
    end
    
    local color = gd.COLOR_RED
    gfun.createTextTagForPlayer( tostring(damage), destUnit, 0.2, 1.0, color)
    UnitDamageTarget( damageUnit, destUnit, I2R(damage), false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_DIVINE, WEAPON_TYPE_WHOKNOWS )
end 
-- 条件
function DamageManager.Damage_Condition()
    local u = GetEventDamageSource()
    
    if GetUnitAbilityLevel( u, gfun.ID(|Aloc|) ) > 0 then -- 马甲的伤害
        return false
    else
        return true
    end
end
-- 动作
function DamageManager.Damage_Actions()
    local sourUnit = GetEventDamageSource()
    local destUnit = GetTriggerUnit()
    DamageManager:attackDamageUnit(sourUnit,destUnit)
end
-- 注册伤害事件
function DamageManager:regUnitDamageEvent( theUnit )
    TriggerRegisterUnitEvent( s_damageTri, theUnit, EVENT_UNIT_DAMAGED )
end
-- 初始化伤害触发
function DamageManager:init()
    TriggerAddCondition( s_damageTri, Condition( DamageManager.Damage_Condition ) )
    TriggerAddAction( s_damageTri, DamageManager.Damage_Actions )
    
    -- 伤害马甲
    for i = 0, 15 do
        self.m_damageUnit[i] = CreateUnit(Player(i),|h002|,26390, -27979,0)
    end
end
