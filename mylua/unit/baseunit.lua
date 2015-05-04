BaseUnit = class("BaseUnit")
BaseUnit.m_unitType = 0 -- 单位类型
BaseUnit.m_unit = nil -- 绑定单位
BaseUnit.m_attackType = 0 -- 攻击类型
function BaseUnit:ctor()
    self.m_unitType = 0
    self.m_unit = nil
    self.m_attackType = 0
end
function BaseUnit.create()
    return BaseUnit.new()
end
-- 公有接口
-- 获取单位特殊属性
function BaseUnit:getSpecialAttr()
    return 0
end
-- 获取单位总属性
function BaseUnit:getTotalAttr()
    return 0
end
-- 获取单位
function BaseUnit:getUnit()
    return self.m_unit
end
