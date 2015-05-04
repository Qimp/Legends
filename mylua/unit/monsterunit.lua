MonsterUnit = class("MonsterUnit", BaseUnit)
MonsterUnit.m_cfgData = {} -- 基础配置数据
MonsterUnit.m_cfgId = 0 -- 配置id
function MonsterUnit:ctor()
    self.m_unitType = EM_UNIT_TYPE.MONSTER -- 怪物
    self.m_cfgId = 0 -- 配置id
    self.m_cfgData = {} -- 基础配置数据
end
-- 创建
function MonsterUnit.create( cfgId, monster )
    local instance = MonsterUnit.new()
    instance:init( cfgId, monster )
    return instance
end
-- 初始化
function MonsterUnit:init( cfgId, monster )
    self.m_cfgId = cfgId
    self.m_cfgData = UnitCfg[cfgId] or {}
    self.m_attackType = self.m_cfgData["m_attackType"] -- 攻击类型
    self.m_unit = monster -- 对应的怪物
end
-- 获取单位的某个属性的最小值最大值
function MonsterUnit:getUnitMinMaxAttr( str )
    local cfgData = self.m_cfgData
    local attrD = string.format("%sD",str)
    local attrU = string.format("%sU",str)
    local baseD = self:getTotalAttr( attrD )
    local baseU = self:getTotalAttr( attrU )
    return baseD, baseU
end
-- 获取单位特殊属性
function MonsterUnit:getSpecialAttr( attrStr )
    local isHaveSpAttr = false
    return 0
end
-- 获取单位总属性
function MonsterUnit:getTotalAttr( attrStr )
    local cfgData = self.m_cfgData
    local attr = cfgData[attrStr] or 0
    return attr + self:getSpecialAttr(attrStr)
end
-- 根据幸运获取值
function MonsterUnit:getRandomAttrWithLucky( str )
    local lucky = self:getTotalAttr("m_lucky")
    local attrD, attrU = self:getUnitMinMaxAttr( str )
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
