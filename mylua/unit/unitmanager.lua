require "BaseUnit.lua"
require "MonsterUnit.lua"
require "HeroUnit.lua"
require "DamageManager.lua"
require "PlayerManager.lua"
require "UIFullScreen.lua"
UnitManager = {}
UnitManager.m_unitList = {} -- 所有单位列表
-- 获取单位
function UnitManager:getUnitData( theUnit )
    if theUnit then
        return self.m_unitList[theUnit], theUnit
    end
end
-- 创建怪物
function UnitManager:createMonster( playerId, uId, x, y ,f )
    local monster = CreateUnit( Player(playerId), uId, x, y, f )
    if monster then
        local cfgId = GetUnitPointValue(monster)
        local data = MonsterUnit.create(cfgId, monster) 
        self.m_unitList[monster] = data
        DamageManager:regUnitDamageEvent( monster ) -- 注册伤害
        return data
    end
    return nil
end
-- 创建英雄
function UnitManager:createHero( playerId, uId, x, y ,f, jobType, sex )
    local hero = CreateUnit( Player(playerId), uId, x, y, f )
    if hero then
        local data = HeroUnit.create( hero, jobType, sex) -- 创建数据
        self.m_unitList[hero] = data
        DamageManager:regUnitDamageEvent( hero ) -- 注册伤害
        -- 测试属性
        data:riseHeroLv()
        return data
    end
    return nil
end
